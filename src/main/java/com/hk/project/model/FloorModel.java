package com.hk.project.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@Table(name = "floor")
@DynamicInsert
@DynamicUpdate
public class FloorModel implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@Column(name = "id")
	private String id;
	@Column(name = "floor_name")
	private String floorName;
	@Column(name = "floor_number")
	private int floorNumber;
	@Column(name = "remark")
	private String remark;
	@ManyToOne
	@JoinColumn(name = "building_id")
	@NotFound(action=NotFoundAction.IGNORE)
	@JsonIgnoreProperties(value={"handler","hibernateLazyInitializer","name","parent","longCode","remark"})
	private BuildingModel building;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	public String getFloorName() {
		return floorName;
	}
	public void setFloorName(String floorName) {
		this.floorName = floorName;
	}
	public int getFloorNumber() {
		return floorNumber;
	}
	public void setFloorNumber(int floorNumber) {
		this.floorNumber = floorNumber;
	}
	public BuildingModel getBuilding() {
		return building;
	}
	public String getBuildingName(){
		if(building == null){
			return null;
		}
		return building.getName();
	}
	public void setBuilding(BuildingModel building) {
		this.building = building;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
}
