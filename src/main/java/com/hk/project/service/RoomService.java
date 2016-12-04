package com.hk.project.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.hk.base.service.BaseService;
import com.hk.base.support.ResultsData;
import com.hk.project.model.RoomModel;
@Service
@Transactional
public class RoomService extends BaseService<RoomModel>{
	public ResultsData removeById(String id){
		ResultsData result = new ResultsData();
		String rentHql = "delete RentDetailModel r where r.room.id = '"+id+"'";
		String roomHql = "delete RoomModel r where r.id = '"+id+"'";
		int rent = this.dao.executeByHQL(rentHql);
		int room = this.dao.executeByHQL(roomHql);
		result.put("rent", rent);
		result.put("room", room);
		result.setStatusSuccess();
		return result;
	}
}
