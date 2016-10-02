package com.hk.project.controller;
import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;

import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hk.base.support.IgnoreFieldProcessorImpl;
import com.hk.base.support.ResultsData;
import com.hk.base.support.StringUtil;
import com.hk.project.model.BuildingModel;
import com.hk.project.service.BuildingService;

@Controller
@RequestMapping("/building")
public class BuildingController {
	@Autowired
	private BuildingService buildingService;
	//不分页
	@RequestMapping(value="/getData")
	@ResponseBody
	public ResultsData getData(int limit,int offset,String order){
		ResultsData result = new ResultsData();
		List<BuildingModel> buildings = buildingService.criteria(BuildingModel.class, null, null, null);
		JsonConfig config = new JsonConfig();
		config.setJsonPropertyFilter(new IgnoreFieldProcessorImpl(true,new String[]{"parent","children"}));
		JSONArray fromArray = JSONArray.fromObject(buildings, config);
		result.setStatusSuccess();
		result.setData(fromArray);
		return result;
	}
	//只获取当前building对象
	@RequestMapping(value="/getTreeById")
	@ResponseBody
	public ResultsData getTreeById(String parentId){
		ResultsData result = new ResultsData();
		List<BuildingModel> buildings = new ArrayList<BuildingModel>();
		if(StringUtil.isEmpty(parentId)){
			buildings = buildingService.criteria(BuildingModel.class, Restrictions.isNull("parent.id"), null, null);
		}else{
			buildings = buildingService.criteria(BuildingModel.class, Restrictions.eq("parent.id",parentId), null, null);
		}
		JsonConfig config = new JsonConfig();
		config.setJsonPropertyFilter(new IgnoreFieldProcessorImpl(true,new String[]{"parent","children"}));
		JSONArray fromArray = JSONArray.fromObject(buildings, config);
		result.setStatusSuccess();
		result.setData(fromArray);
		return result;
	}
	//级联获取子对象
	@RequestMapping(value="/getTree")
	@ResponseBody
	public ResultsData getTree(){
		ResultsData result = new ResultsData();
		List<BuildingModel> buildings = buildingService.criteria(BuildingModel.class, Restrictions.isNull("parent.id"), null, null);
		JsonConfig config = new JsonConfig();
		config.setJsonPropertyFilter(new IgnoreFieldProcessorImpl(true,new String[]{"parent"}));
		JSONArray fromArray = JSONArray.fromObject(buildings, config);
		result.setStatusSuccess();
		result.setData(fromArray);
		return result;
	}
}
