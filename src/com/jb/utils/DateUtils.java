package com.jb.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtils {

	public static String getNowTime(){
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date = format.format(new Date());
		return date;
	}
	
}
