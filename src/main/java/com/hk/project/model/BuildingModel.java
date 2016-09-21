package com.hk.project.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
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
	@ManyToOne
	@JoinColumn(name = "parent_id")
	@NotFound(action=NotFoundAction.IGNORE)
	@JsonIgnoreProperties(value={"handler","hibernateLazyInitializer","name","parent","longCode"})//
	private BuildingModel parent;
	@Column(name = "long_code")
	private String longCode;
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
	public BuildingModel getParent() {
		return parent;
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
