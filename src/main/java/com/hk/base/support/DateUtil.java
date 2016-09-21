package com.hk.base.support;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateUtil {
	public static Calendar toCalendar(String dateString,String format) throws ParseException{
		SimpleDateFormat myDateFormat = new SimpleDateFormat(format);
		Date dateDate = myDateFormat.parse(dateString);
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(dateDate);
		return calendar;
	}
}
