package com.hk.project.controller;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hk.base.support.ResultsData;
import com.hk.project.model.RoomModel;
import com.hk.project.model.User;
import com.hk.project.service.BuildingService;
import com.hk.project.service.RentDetailService;
import com.hk.project.service.RoomService;
import com.hk.project.service.UserBaseService;

@Controller
@RequestMapping("/test")
public class TestController {
	@Autowired
	private BuildingService buildingService;
	@Autowired
	private RentDetailService rentDetailService;
	@Autowired
	private RoomService roomService;
	@Autowired
	private UserBaseService userBaseService;
	@RequestMapping(value="/saveUser")
	@ResponseBody
	public ResultsData saveBuilding(User model){
		ResultsData result = new ResultsData();
		userBaseService.save(model);
		result.setData(model);
		result.setStatusSuccess();
		return result;
	}
	@RequestMapping(value="/saveRoom")
	@ResponseBody
	public ResultsData saveRoom(RoomModel room){
		System.out.println("saveRoom");
		ResultsData result = new ResultsData();
		roomService.save(room);
		result.setData(room);
		result.setStatusSuccess();
		return result;
	}
}
