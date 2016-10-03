package com.hk.project.dto;



public class RentDetailDto {
	private String id;
	private String buildingId;
	private String roomId;
	private String rentDate;
	private float rent;
	private float water;
	private float electricity;
	private float incidental;
	private String checkIn;
	private String remark;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getBuildingId() {
		return buildingId;
	}
	public void setBuildingId(String buildingId) {
		this.buildingId = buildingId;
	}
	public String getRoomId() {
		return roomId;
	}
	public void setRoomId(String roomId) {
		this.roomId = roomId;
	}
	public String getRentDate() {
		return rentDate;
	}
	public void setRentDate(String rentDate) {
		this.rentDate = rentDate;
	}
	public float getRent() {
		return rent;
	}
	public void setRent(float rent) {
		this.rent = rent;
	}
	public float getWater() {
		return water;
	}
	public void setWater(float water) {
		this.water = water;
	}
	public float getElectricity() {
		return electricity;
	}
	public void setElectricity(float electricity) {
		this.electricity = electricity;
	}
	public float getIncidental() {
		return incidental;
	}
	public void setIncidental(float incidental) {
		this.incidental = incidental;
	}
	public float getTotal(){
		return this.rent + this.water + this.electricity + this.incidental;
	}
	public String getCheckIn() {
		return checkIn;
	}
	public void setCheckIn(String checkIn) {
		this.checkIn = checkIn;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	
}
