package com.hk.project.service;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.hk.base.service.BaseService;
import com.hk.base.support.ResultsData;
import com.hk.base.support.StringUtil;
import com.hk.project.model.FloorModel;
@Service
@Transactional
public class FloorService extends BaseService<FloorModel>{
	public ResultsData removeById(String id){
		ResultsData result = new ResultsData();
		String roomHql = "delete RoomModel r where r.floor.id = ?";
		String floorHql = "delete FloorModel r where r.id = ?";
		int room = this.dao.executeByHQL(roomHql,id);
		int floor = this.dao.executeByHQL(floorHql,id);
		result.put("room", room);
		result.put("floor", floor);
		result.setStatusSuccess();
		return result;
	}
	public List<Map<String,Object>> getByFloor(String buildingId,String floorId){
		List<Map<String,Object>> results = new ArrayList<Map<String,Object>>();
		String hql = "SELECT new map("
				+ "sum(d.deposit - d.depositPay) as depositTotal,"
				+ "sum(d.gate - d.gatePay) as gateTotal,"
				+ "r.id as id,"
				+ "r.roomNumber as roomNumber,"
				+ "f.floorName as floorName,"
				+ "r.building.name as buildingName ) "
				+ "FROM RentDetailModel d RIGHT JOIN d.room r left join r.floor f ";
		if(StringUtil.isEmpty(floorId)){
			hql += " where r.building.id = ? GROUP BY d.room.id";
			results = (List<Map<String, Object>>) this.dao.queryByHQL(hql,buildingId);
		}else{
			hql += " where r.floor.id = ? GROUP BY d.room.id";
			results = (List<Map<String, Object>>) this.dao.queryByHQL(hql,floorId);
		}
		System.out.println(results.size());
		for(Map<String,Object> model : results){
			System.out.println(model.get("depositTotal"));
		}
		return results;
	}
}
