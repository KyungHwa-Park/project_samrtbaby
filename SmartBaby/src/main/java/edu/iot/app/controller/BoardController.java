package edu.iot.app.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.fasterxml.jackson.databind.ObjectMapper;

import edu.iot.common.exception.PasswordMissmatchException;
import edu.iot.common.model.Board;
import edu.iot.common.model.Member;
import edu.iot.common.model.SleepType;
import edu.iot.common.service.BoardService;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/board")
@Slf4j
public class BoardController {
	@Autowired
	BoardService service;

	@Autowired
	ServletContext context;

	@RequestMapping("/list")
	public void list(@RequestParam(value = "page", defaultValue = "1") int page, Model model, HttpSession session)
			throws Exception {

//		model.addAttribute("today", Util.getToday());
		try {
			Member member = (Member) session.getAttribute("USER");
			if (member != null) {
				String userId = member.getUserId();
				System.out.println("userId : " + userId);
				model.addAllAttributes(service.getPage1(page, userId));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public void createForm(Board board) {
	}

	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public String createSubmit(@Valid Board board, BindingResult result, MultipartHttpServletRequest request)
			throws Exception {

		if (result.hasErrors())
			return "board/create";

		service.create(board);

		return "redirect:list";
	}

	@RequestMapping(method = RequestMethod.POST, value = "/android/create")
	public @ResponseBody String androidCreate(HttpServletRequest httpServletRequest) throws Exception {
		String userId = httpServletRequest.getParameter("userId");
		String flag = httpServletRequest.getParameter("flag");

		Date date = new Date();
		SimpleDateFormat sdf1 = new SimpleDateFormat("HH:mm:ss");
		SimpleDateFormat sdf2 = new SimpleDateFormat("yy/MM/dd");
		SimpleDateFormat sdf3 = new SimpleDateFormat("HH");
		SimpleDateFormat sdf4 = new SimpleDateFormat("yy/MM/dd HH:mm:ss");

		String result = "";
		Date time = new Date();
		Date regDate = sdf4.parse(sdf4.format(time));
		String nowTime = sdf1.format(time);
		String regDateStr = sdf2.format(time);
		int nowHour = Integer.parseInt(sdf3.format(time));
		SleepType dayNight;
		if (nowHour < 20 && nowHour > 9) {
			dayNight = SleepType.DAY;
		} else {
			dayNight = SleepType.NIGHT;
		}

		if (flag.equals("1")) {
			// userId, sleepTime 추가하여 insert
			Board board = new Board();
			board.setUserId(userId);
			board.setRegDate(regDate);
			board.setRegDateStr(regDateStr);
			board.setSleepTime(nowTime);
			board.setDayNight(dayNight);
			board.setUpdateDate(regDate);

			service.create(board);
			System.out.println(board);
			result = "아기의 잠든 시간 : " + nowTime;
		}
		if (flag.equals("2")) {
			// userId 확인해서 wakeupTime update하기
			// service 추가
			Board board = service.getLastBoard(userId);
			if (board == null) {
				throw new Exception();
			}
			board.setWakeupTime(nowTime);
			board.setUpdateDate(regDate);
			String sleepTime = board.getSleepTime();

			long diff = sdf1.parse(nowTime).getTime() - sdf1.parse(sleepTime).getTime();
			long sec = diff / 1000;
			long hour = sec / 3600;
			sec = sec % 3600;
			long min = sec / 60;
			sec = sec % 60;

			String hourStr, minStr, secStr;
			if (hour < 10) {
				hourStr = "0" + Long.toString(hour);
			} else {
				hourStr = Long.toString(hour);
			}

			if (min < 10) {
				minStr = "0" + Long.toString(min);
			} else {
				minStr = Long.toString(min);
			}

			if (sec < 10) {
				secStr = "0" + Long.toString(sec);
			} else {
				secStr = Long.toString(sec);
			}
			String totalTime = hourStr + ":" + minStr + ":" + secStr;
			board.setTotalTime(totalTime);

			service.updateWakeup(board);
			System.out.println(board);
			result = "아기의 수면 시간 : " + totalTime;
		}
		return result;
	}

	@RequestMapping(method = RequestMethod.POST, value = "/android/list")
	public @ResponseBody String androidList(HttpServletRequest httpServletRequest) throws Exception {
		String userId = httpServletRequest.getParameter("userId");

		ArrayList<Board> array = service.getPage2(userId);
		System.out.println(array);

		ObjectMapper mapper = new ObjectMapper();
		String jsonString = mapper.writeValueAsString(array);
		System.out.println(jsonString);
		return jsonString;
	}

	@RequestMapping(method = RequestMethod.GET, value = "/android/view/{boardId}")
	public @ResponseBody String androidView(HttpServletRequest httpServletRequest) throws Exception {
		Long boardId = Long.parseLong(httpServletRequest.getParameter("boardId"));
		Board board = service.findById(boardId);
		ObjectMapper mapper = new ObjectMapper();
		String jsonString = mapper.writeValueAsString(board);
		return jsonString;
	}

	@RequestMapping(value = "/view/{boardId}", method = RequestMethod.GET)
	public String view(@PathVariable long boardId, Model model) throws Exception {
		Board board = service.findById(boardId);
		model.addAttribute("board", board);

		return "board/view";
	}

	@RequestMapping(method = RequestMethod.POST, value = "/android/editMemo")
	public @ResponseBody String androidEditMemo(HttpServletRequest httpServletRequest) throws Exception {
		Long boardId = Long.parseLong(httpServletRequest.getParameter("boardId"));
		String memo = httpServletRequest.getParameter("memo");

		System.out.println(boardId + " : " + memo);
		if (memo != null) {
			Board board = service.findById(boardId);

			System.out.println(board);

			board.setMemo(memo);
//			board.setUpdateDate(new Date());

			service.updateMemo(board);

			System.out.println("memo update 완료");
			return "ok";
		} else {
			return "fail";
		}
	}

	@RequestMapping(value = "/editMemo", method = RequestMethod.GET)
	public String editForm(@PathVariable long boardId, Model model) throws Exception {
		Board board = service.findById(boardId);
		model.addAttribute("board", board);
		return "board/editMemo";
	}

	@RequestMapping(value = "/editMemo", method = RequestMethod.POST)
	public String editSubmit(@Valid Board board, BindingResult result, 
			@RequestParam("page") int page,
			MultipartHttpServletRequest request) throws Exception {
		if (result.hasErrors())
			return "board/editMemo";

		try {
			service.updateMemo(board);
		} catch (PasswordMissmatchException e) {
			result.reject("updateFail", e.getMessage());

			return "board/editMemo";
		}

		return "redirect:/board/view/" + board.getBoardId() + "?page=" + page;
	}

	@ResponseBody
	@RequestMapping(value = "/delete/{boardId}", method = RequestMethod.GET)
	public String delete(@PathVariable long boardId) throws Exception {
		service.delete(boardId);
		return "redirect:/board/list";
	}

}
