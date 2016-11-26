package com.hk.project.controller;





import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;

import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hk.base.support.Dto2Entity;
import com.hk.base.support.IgnoreFieldProcessorImpl;
import com.hk.base.support.ResultsData;
import com.hk.project.dto.RoomDto;
import com.hk.project.model.BuildingModel;
import com.hk.project.model.FloorModel;
import com.hk.project.model.RentDetailModel;
import com.hk.project.model.RoomModel;
import com.hk.project.service.BuildingService;
import com.hk.project.service.RoomService;

@Controller
@RequestMapping("/room")
public class RoomController {
	@Autowired
	private RoomService roomService;

	@RequestMapping(value="/getData")
	@ResponseBody
	public ResultsData getData(){
		ResultsData result = new ResultsData();
		List<RoomModel> rooms = roomService.criteria(RoomModel.class, null, null, null);
		JsonConfig config = new JsonConfig();
		config.setJsonPropertyFilter(new IgnoreFieldProcessorImpl(false,new String[]{"building"}));
		JSONArray fromArray = JSONArray.fromObject(rooms, config);
		result.setData(fromArray);
		result.setStatusSuccess();
		return result;
	}
	@RequestMapping(value="/getByBuilding")
	@ResponseBody
	public ResultsData getByBuilding(String id){
		ResultsData result = new ResultsData();
		List<RoomModel> rooms = roomService.criteria(RoomModel.class, Restrictions.eq("building.id", id), null, null);
		JsonConfig config = new JsonConfig();
		config.setJsonPropertyFilter(new IgnoreFieldProcessorImpl(false,new String[]{"building"}));
		JSONArray fromArray = JSONArray.fromObject(rooms, config);
		result.setData(fromArray);
		result.setStatusSuccess();
		return result;
	}
	@RequestMapping(value="/save")
	@ResponseBody
	public ResultsData save(RoomDto model){
		ResultsData result = new ResultsData();
		RoomModel room = new RoomModel();
		Dto2Entity.transalte(model, room);
		BuildingModel building = new BuildingModel();
		FloorModel floor = new FloorModel();
		building.setId(model.getBuildingId());
		floor.setId(model.getFloorId());
		room.setFloor(floor);
		room.setBuilding(building);
		RoomModel newModel = roomService.save(room);
		result.setStatusSuccess();
		result.setData(newModel);
		return result;
	}
	@RequestMapping(value="/remove")
	@ResponseBody
	public ResultsData remove(String id){
		return roomService.removeById(id);
	}
	@RequestMapping(value="/getById")
	@ResponseBody
	public ResultsData getById(String id){
		ResultsData result = new ResultsData();
		RoomModel room = roomService.get(id);
		if(room == null){
			result.setStatusFail("该房间不存在!");
		}else{
			JsonConfig config = new JsonConfig();
			config.setJsonPropertyFilter(new IgnoreFieldProcessorImpl(false,new String[]{"building","floor"}));
			JSONArray fromArray = JSONArray.fromObject(room, config);
			result.setData(fromArray);
			result.setStatusSuccess();
		}
		return result;
	}
}
