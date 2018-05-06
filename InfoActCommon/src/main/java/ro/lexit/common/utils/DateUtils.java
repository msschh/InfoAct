package ro.lexit.common.utils;

import java.time.LocalDate;
import java.time.Period;
import java.time.ZoneId;
import java.util.Date;

public class DateUtils {
	
	public static Integer getVarsta(Date birthdate) {
		
		LocalDate birthday = birthdate.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
		LocalDate today = LocalDate.now();
		Period p = Period.between(birthday, today);
		return p.getYears();
	}

}

