package com.hk.project.dto;

import com.hk.project.model.BuildingModel;

public class BuildingDto {
	private String parentId;
	private BuildingModel buildingModel;
	public String getParentId() {
		return parentId;
	}
	public void setParentId(String parentId) {
		this.parentId = parentId;
	}
	public BuildingModel getBuildingModel() {
		return buildingModel;
	}
	public void setBuildingModel(BuildingModel buildingModel) {
		this.buildingModel = buildingModel;
	}
	
}
