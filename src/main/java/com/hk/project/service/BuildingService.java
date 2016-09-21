package com.hk.project.service;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.hk.base.service.BaseService;
import com.hk.base.support.ResultsData;
import com.hk.project.model.BuildingModel;
@Service
@Transactional
public class BuildingService extends BaseService<BuildingModel>{
	public ResultsData save(String parentId,BuildingModel model){
		ResultsData result = new ResultsData();
		BuildingModel parent = this.dao.get(BuildingModel.class, parentId);
		model.setParent(parent);
		model.setLongCode(parent.getLongCode()+","+parent.getId());
		this.dao.save(model);
		result.put("parent", parent);
		result.put("model", model);
		result.setStatusSuccess();
		return result;
	}
}
