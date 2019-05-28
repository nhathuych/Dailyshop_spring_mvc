package com.nhathuy.utils;

import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class HuyUtil {

	public String numFormat(String value) {
		DecimalFormat decimalFormat = new DecimalFormat("###,###.###");
		return decimalFormat.format(Double.parseDouble(value));
	}

	// year - month - day
	public String dateToString(Date date) {
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		date = Calendar.getInstance().getTime();
		return df.format(date);
	}

//	// year - month - day
//	public java.sql.Date getCurrentTimeStamp() {
//		return new java.sql.Date(Calendar.getInstance().getTime().getTime());
//	}
}
