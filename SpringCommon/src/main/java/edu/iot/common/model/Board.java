package edu.iot.common.model;

import java.util.Date;

import org.hibernate.validator.constraints.NotEmpty;

import lombok.Data;

@Data
public class Board {
	
	
	@NotEmpty
	private long boardId;
	
	private Date regDate;
	
	private Date sleepTime;
	
	private Date wakeupTime;
	
	private Date totalTime;
	
	private SleepType dayNight;
	
	private String	memo;
	
	private Date	updateDate;
}
