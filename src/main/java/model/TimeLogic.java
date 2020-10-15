package model;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;

public class TimeLogic {
	public String timeLogic() {
	LocalDateTime dt = LocalDateTime.now(ZoneId.of("Asia/Tokyo"));
	DateTimeFormatter dtformat = DateTimeFormatter.ofPattern("MM月dd日HH時mm分");
	String formatdt = dt.format(dtformat);
	return formatdt;
	}
}