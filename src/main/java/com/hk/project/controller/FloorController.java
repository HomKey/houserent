package com.hk.project.controller;
import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;

import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hk.base.support.Dto2Entity;
import com.hk.base.support.IgnoreFieldProcessorImpl;
import com.hk.base.support.ResultsData;
import com.hk.base.support.StringUtil;
import com.hk.project.dto.BuildingDto;
import com.hk.project.dto.FloorDto;
import com.hk.project.dto.RentDetailDto;
import com.hk.project.dto.RoomDto;
import com.hk.project.model.BuildingModel;
import com.hk.project.model.FloorModel;
import com.hk.project.model.RentDetailModel;
import com.hk.project.model.RoomModel;
import com.hk.project.service.BuildingService;
import com.hk.project.service.FloorService;
import com.hk.project.service.RoomService;

@Controller
@RequestMapping("/floor")
public class FloorController {
	@Autowired
	private FloorService floorService;

	@RequestMapping(value="/getData")
	@ResponseBody
	public ResultsData getData(){
		ResultsData result = new ResultsData();
		List<FloorModel> floors = floorService.criteria(FloorModel.class, null, null, null);
		JsonConfig config = new JsonConfig();
		config.setJsonPropertyFilter(new IgnoreFieldProcessorImpl(false,new String[]{"building"}));
		JSONArray fromArray = JSONArray.fromObject(floors, config);
		result.setData(fromArray);
		result.setStatusSuccess();
		return result;
	}
	@RequestMapping(value="/getByBuilding")
	@ResponseBody
	public ResultsData getByBuilding(String id){
		ResultsData result = new ResultsData();
		List<FloorModel> rooms = floorService.criteria(FloorModel.class, Restrictions.eq("building.id", id), null, null);
		JsonConfig config = new JsonConfig();
		config.setJsonPropertyFilter(new IgnoreFieldProcessorImpl(false,new String[]{"building"}));
		JSONArray fromArray = JSONArray.fromObject(rooms, config);
		result.setData(fromArray);
		result.setStatusSuccess();
		return result;
	}
	@RequestMapping(value="/save")
	@ResponseBody
	public ResultsData save(FloorDto model){
		ResultsData result = new ResultsData();
		FloorModel floor = new FloorModel();
		Dto2Entity.transalte(model, floor);
		BuildingModel building = new BuildingModel();
		building.setId(model.getBuildingId());
		floor.setBuilding(building);
		FloorModel newModel = floorService.save(floor);
		result.setStatusSuccess();
		result.setData(newModel);
		return result;
	}
	@RequestMapping(value="/remove")
	@ResponseBody
	public ResultsData remove(String id){
		return floorService.removeById(id);
	}
}
