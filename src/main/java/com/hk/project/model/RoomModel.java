package com.hk.project.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@Table(name = "room")
@DynamicInsert
@DynamicUpdate
public class RoomModel implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@Column(name = "id")
	private String id;
	@Column(name = "floor_number")
	private String floorNumber;
	@Column(name = "room_number")
	private String roomNumber;
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
	public String getFloorNumber() {
		return floorNumber;
	}
	public void setFloorNumber(String floorNumber) {
		this.floorNumber = floorNumber;
	}
	public String getRoomNumber() {
		return roomNumber;
	}
	public void setRoomNumber(String roomNumber) {
		this.roomNumber = roomNumber;
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
