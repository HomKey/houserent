package com.hk.project.controller;





import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hk.base.support.Dto2Entity;
import com.hk.base.support.ResultsData;
import com.hk.project.dto.RentDetailDto;
import com.hk.project.model.BuildingModel;
import com.hk.project.model.RentDetailModel;
import com.hk.project.model.RoomModel;
import com.hk.project.service.BuildingService;
import com.hk.project.service.RentDetailService;

@Controller
@RequestMapping("/rent")
public class RentDetailController {
	@Autowired
	private RentDetailService rentDetailService;

	//不分页
	@RequestMapping(value="/getData")
	@ResponseBody
	public ResultsData getData(int limit,int offset,String order){
		System.out.println("limit:"+limit+",offset:"+offset+",order:"+order);
		ResultsData result = new ResultsData();
		List<RentDetailModel> rentDetail = rentDetailService.criteria(RentDetailModel.class, null, null, null);
		result.setStatusSuccess();
		result.setData(rentDetail);
		return result;
	}
	@RequestMapping(value="/save", method = RequestMethod.POST)
	@ResponseBody
	public ResultsData save(RentDetailDto model){
		ResultsData result = new ResultsData();
		RentDetailModel rent = new RentDetailModel();
		Dto2Entity.transalte(model, rent);
		BuildingModel building = new BuildingModel();
		building.setId(model.getBuildingId());
		rent.setBuilding(building);
		RoomModel room = new RoomModel();
		room.setId(model.getRoomId());
		rent.setRoom(room);
		RentDetailModel newModel = rentDetailService.save(rent);
		result.setStatusSuccess();
		result.setData(newModel);
		return result;
	}
	@RequestMapping(value="/remove", method = RequestMethod.POST)
	@ResponseBody
	public ResultsData remove(String id){
		ResultsData result = new ResultsData();
		rentDetailService.removeById(RentDetailModel.class, id);
		result.setStatusSuccess();
		return result;
	}
}
