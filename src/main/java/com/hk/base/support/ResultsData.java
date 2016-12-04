package com.hk.base.support;

import java.util.HashMap;


public class ResultsData  extends HashMap<String, Object>{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public static final String STATUS_SUCCESS = "success";
	public static final String STATUS_FAIL = "fail";
	public static final String STATUS_EXCEPTION = "exception";
	public ResultsData setStatusSuccess(String message) {
		this.put("status", STATUS_SUCCESS);
		this.put("message",message);
		return this;
	}
	public ResultsData setStatusFail(String message) {
		this.put("status", STATUS_FAIL);
		this.put("message",message);
		return this;
	}
	public ResultsData setStatusException(String message) {
		this.put("status", STATUS_EXCEPTION);
		this.put("message",message);
		return this;
	}
	public ResultsData setStatusSuccess() {
		this.put("status", STATUS_SUCCESS);
		return this;
	}
	public ResultsData setStatusFail() {
		this.put("status", STATUS_FAIL);
		return this;
	}
	public ResultsData setStatusException() {
		this.put("status", STATUS_EXCEPTION);
		return this;
	}
	public ResultsData setData(Object data) {
		this.put("data", data);
		return this;
	}
	public Object getData() {
		return this.get("data");
	}
	public Object getStatus() {
		return this.get("status");
	}
}
