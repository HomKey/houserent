package com.hk.project.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;


@Entity
@Table(name = "building")
@DynamicInsert
@DynamicUpdate
public class BuildingModel {

	@Id
	@GenericGenerator(name = "UUIDGenerator", strategy = "com.hk.base.support.hibernate.UUIDGenerator")
	@GeneratedValue(generator = "UUIDGenerator")
	@Column(name = "id")
	private String id;
	@Column(name = "name")
	private String name;
	@Column(name = "remark")
	private String remark;
	@ManyToOne
	@JoinColumn(name = "parent_id")
	@NotFound(action=NotFoundAction.IGNORE)
	@JsonIgnoreProperties(value={"handler","hibernateLazyInitializer","parent","longCode","remark"})//
	private BuildingModel parent;
	@Column(name = "long_code")
	private String longCode;
	@OneToMany(mappedBy="parent",cascade = { CascadeType.ALL }, fetch = FetchType.LAZY)
	private List<BuildingModel> children;
	/*
	@OneToMany(mappedBy="building",cascade = { CascadeType.ALL }, fetch = FetchType.LAZY)
	private List<RoomModel> rooms;
	@OneToMany(mappedBy="building",cascade = { CascadeType.ALL }, fetch = FetchType.LAZY)
	private List<RentDetailModel> rents;
	
	public List<RoomModel> getRooms() {
		return rooms;
	}
	public void setRooms(List<RoomModel> rooms) {
		this.rooms = rooms;
	}
	public List<RentDetailModel> getRents() {
		return rents;
	}
	public void setRents(List<RentDetailModel> rents) {
		this.rents = rents;
	}
	*/
	public List<BuildingModel> getChildren() {
		return children;
	}
	public void setChildren(List<BuildingModel> children) {
		this.children = children;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public BuildingModel getParent() {
		return parent;
	}
	public String getParentName(){
		if(parent == null){
			return null;
		}
		return parent.getName();
	}
	public void setParent(BuildingModel parent) {
		this.parent = parent;
	}
	public String getLongCode() {
		return longCode;
	}
	public void setLongCode(String longCode) {
		this.longCode = longCode;
	}
}
