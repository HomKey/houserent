package com.hk.project.dto;

import java.util.List;


public class RoomRentDetailDto {
	private List<RoomDto> rooms;
	private List<RentDetailDto> rentDetails;
	public List<RoomDto> getRooms() {
		return rooms;
	}
	public void setRooms(List<RoomDto> rooms) {
		this.rooms = rooms;
	}
	public List<RentDetailDto> getRentDetails() {
		return rentDetails;
	}
	public void setRentDetails(List<RentDetailDto> rentDetails) {
		this.rentDetails = rentDetails;
	}
	
}
