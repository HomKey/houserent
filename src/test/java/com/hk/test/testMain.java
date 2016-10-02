package com.hk.test;

import java.text.ParseException;
import java.text.SimpleDateFormat;

public class testMain {
	public static void main(String[] args) throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
		System.out.println(sdf.parse("2016-08"));
	}
}
