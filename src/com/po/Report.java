package com.po;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Report {
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date startdate;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date enddate;
	public Date getStartdate() {
		return startdate;
	}
	public void setStartdate(Date startdate) {
		this.startdate = startdate;
	}
	public Date getEnddate() {
		return enddate;
	}
	public void setEnddate(Date enddate) {
		this.enddate = enddate;
	}
}
