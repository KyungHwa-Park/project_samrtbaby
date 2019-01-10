package edu.iot.common.model;

import java.util.Date;

import org.hibernate.validator.constraints.NotEmpty;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Board {
	private String userId;
	
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
