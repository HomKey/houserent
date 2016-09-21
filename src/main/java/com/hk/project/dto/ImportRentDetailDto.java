package com.hk.project.dto;

import java.util.List;

import com.hk.project.model.RentDetailModel;
import com.hk.project.model.RoomModel;

public class ImportRentDetailDto {
	private List<RoomModel> rooms;
	private List<RentDetailModel> rentDetails;
	public List<RoomModel> getRooms() {
		return rooms;
	}
	public void setRooms(List<RoomModel> rooms) {
		this.rooms = rooms;
	}
	public List<RentDetailModel> getRentDetails() {
		return rentDetails;
	}
	public void setRentDetails(List<RentDetailModel> rentDetails) {
		this.rentDetails = rentDetails;
	}
	
}
