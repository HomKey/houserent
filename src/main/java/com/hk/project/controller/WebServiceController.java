package com.hk.project.controller;





import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hk.base.dao.IBaseDao;
import com.hk.base.service.BaseService;
import com.hk.base.support.ResultsData;
import com.hk.base.support.StringUtil;
import com.hk.project.dto.BuildingDto;
import com.hk.project.model.BuildingModel;
import com.hk.project.model.RentDetailModel;
import com.hk.project.service.BuildingService;
import com.hk.project.service.RentDetailService;

@Controller
@RequestMapping("/webservice")
public class WebServiceController {
	@Autowired
	private BuildingService buildingService;
	@Autowired
	private RentDetailService rentDetailService;
	@Autowired
	private BaseService baseService;
	@RequestMapping(value="/saveBuilding")
	@ResponseBody
	public ResultsData saveBuilding(BuildingDto model){
		return buildingService.save(model.getParentId(), model.getBuildingModel());
	}
	@RequestMapping(value="/getBuildingByLongCode")
	@ResponseBody
	public ResultsData getBuildingByLongCode(String id){
		ResultsData result = new ResultsData();
		Criterion criteria = null;
		if(StringUtil.isEmpty(id)){
			criteria = Restrictions.isNull("longCode");			
		}else{
			criteria = Restrictions.like("longCode", "%"+id+"%");
		}
		List<BuildingModel> buildings = buildingService.criteria(BuildingModel.class, criteria, null, null);
		result.setStatusSuccess();
		result.setData(buildings);
		return result;
	}

	@RequestMapping(value="/getData")
	@ResponseBody
	public ResultsData getData(String modelClass){
		ResultsData result = new ResultsData();
		try {
			Class<?> model = Class.forName("com.hk.project.model."+modelClass);
			List<?> rentDetail = baseService.criteria(model, null, null, null);
			result.setStatusSuccess();
			result.setData(rentDetail);
			return result;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			result.setStatusFail();
			return result;
		}
	}
	
	
//	@RequestMapping(value="/getDetailByBuildingId")
//	@ResponseBody
//	public ResultsData getDetailByBuildingId(String id,String year,String month){
//		ResultsData result = new ResultsData();
//		Criterion criteria = null;
//		if(StringUtil.isEmpty(id)){
//			criteria = Restrictions.isNull("longCode");			
//		}else{
//			criteria = Restrictions.like("longCode", "%"+id+"%");
//		}
//		List<BuildingModel> buildings = buildingService.criteria(BuildingModel.class, criteria, null, null);
//		result.setStatusSuccess();
//		result.setData(buildings);
//		return result;
//	}
}
