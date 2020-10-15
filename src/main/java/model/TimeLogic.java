package model;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class TimeLogic {
	public String timeLogic() {
	LocalDateTime dt = LocalDateTime.now();
	DateTimeFormatter dtformat = DateTimeFormatter.ofPattern("MM月dd日 HH時mm分");
	String formatdt = dt.format(dtformat);
	return formatdt;
	}
}