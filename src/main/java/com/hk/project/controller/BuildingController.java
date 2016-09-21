package com.hk.project.controller;





import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hk.base.support.ResultsData;
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
		System.out.println("limit:"+limit+",offset:"+offset+",order:"+order);
		ResultsData result = new ResultsData();
		List<BuildingModel> buildings = buildingService.criteria(BuildingModel.class, null, null, null);
		result.setStatusSuccess();
		result.setData(buildings);
		return result;
	}
}
