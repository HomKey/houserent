package com.hk.project.service;


import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.hk.base.service.BaseService;
import com.hk.base.support.ResultsData;
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
}
