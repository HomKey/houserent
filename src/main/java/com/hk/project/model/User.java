package com.hk.project.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.GenericGenerator;

@Entity
@DynamicInsert
@DynamicUpdate
public class User {

	@Id
	@GenericGenerator(name = "UUIDGenerator", strategy = "com.hk.base.support.hibernate.UUIDGenerator")
	@GeneratedValue(generator = "UUIDGenerator")
	@Column(name = "id")
	private String id;
	@Column(name = "name")
	private String name;
	@Column(name = "age")
	private String age;
	@Column(name = "birthday")
	private String birthday;
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
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	
}
