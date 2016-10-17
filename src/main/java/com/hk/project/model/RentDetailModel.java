package com.hk.project.model;


import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;
import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@Table(name = "rent_detail")
@DynamicInsert
@DynamicUpdate
public class RentDetailModel {
	@Id
	@Column(name = "id")
	private String id;
	@ManyToOne
	@JoinColumn(name = "building_id")
	@NotFound(action=NotFoundAction.IGNORE)
	@JsonIgnoreProperties(value={"handler","hibernateLazyInitializer","name","parent","longCode","remark"})//
	private BuildingModel building;
	@ManyToOne
	@JoinColumn(name = "room_id")
	@NotFound(action=NotFoundAction.IGNORE)
	@JsonIgnoreProperties(value={"handler","hibernateLazyInitializer","roomNumber","floorNumber","building","remark"})//
	private RoomModel room;
	@Column(name = "rent_date")
	private Date rentDate;
	//收入
	@Column(name = "rent",nullable=false,columnDefinition="float default 0")
	private float rent;
	@Column(name = "water",nullable=false,columnDefinition="float default 0")
	private float water;
	@Column(name = "electricity",nullable=false,columnDefinition="float default 0")
	private float electricity;
	@Column(name = "incidental",nullable=false,columnDefinition="float default 0")
	private float incidental;
	@Column(name = "deposit",nullable=false,columnDefinition="float default 0")
	private float deposit;
	@Column(name = "gate",nullable=false,columnDefinition="float default 0")
	private float gate;
	//支出
	@Column(name = "electricity_pay",nullable=false,columnDefinition="float default 0")
	private float electricityPay;
	@Column(name = "water_pay",nullable=false,columnDefinition="float default 0")
	private float waterPay;
	@Column(name = "incidental_pay",nullable=false,columnDefinition="float default 0")
	private float incidentalPay;
	@Column(name = "deposit_pay",nullable=false,columnDefinition="float default 0")
	private float depositPay;
	@Column(name = "gate_pay",nullable=false,columnDefinition="float default 0")
	private float gatePay;

	@Column(name = "check_in")
	private String checkIn;
	@Column(name = "remark")
	private String remark;

	//@Temporal(TemporalType.TIMESTAMP)
	//@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss") 
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss")
	public Date getRentDate() {
		return rentDate;
	}
	public void setRentDate(Date rentDate) {
		this.rentDate = rentDate;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	public RoomModel getRoom() {
		return room;
	}
	public String getRoomName(){
		if(room == null){
			return null;
		}
		return room.getRoomNumber();
	}
	public void setRoom(RoomModel room) {
		this.room = room;
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
		return this.rent + this.water + this.electricity + this.incidental + this.deposit + this.gate;
	}
	public float getPay(){
		return this.depositPay + this.gatePay + this.electricityPay + this.waterPay + this.incidentalPay;
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
	public float getDeposit() {
		return deposit;
	}
	public void setDeposit(float deposit) {
		this.deposit = deposit;
	}
	public float getGate() {
		return gate;
	}
	public void setGate(float gate) {
		this.gate = gate;
	}
	public float getElectricityPay() {
		return electricityPay;
	}
	public void setElectricityPay(float electricityPay) {
		this.electricityPay = electricityPay;
	}
	public float getWaterPay() {
		return waterPay;
	}
	public void setWaterPay(float waterPay) {
		this.waterPay = waterPay;
	}
	public float getIncidentalPay() {
		return incidentalPay;
	}
	public void setIncidentalPay(float incidentalPay) {
		this.incidentalPay = incidentalPay;
	}
	public float getDepositPay() {
		return depositPay;
	}
	public void setDepositPay(float depositPay) {
		this.depositPay = depositPay;
	}
	public float getGatePay() {
		return gatePay;
	}
	public void setGatePay(float gatePay) {
		this.gatePay = gatePay;
	}
}
