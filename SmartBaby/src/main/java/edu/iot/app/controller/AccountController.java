package edu.iot.app.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.iot.common.dao.MemberDao;
import edu.iot.common.exception.LoginFailException;
import edu.iot.common.model.Member;
import edu.iot.common.service.MemberService;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/account")
public class AccountController {

	@Autowired
	MemberService service;

	@Autowired
	MemberDao dao;

	SimpleDateFormat sdf1 = new SimpleDateFormat("yyMMddHHmmss");
	SimpleDateFormat sdf2 = new SimpleDateFormat("yyMMdd");

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void loginForm(Member member) {
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginSubmit(Member member, HttpSession session, Model model) throws Exception {
		try {
			member = service.login(member.getUserId(), member.getPassword());
			// 성공하면
			session.setAttribute("USER", member);
			
			return "redirect:/board/list";
		} catch (LoginFailException e) {
			// 실패하면
			model.addAttribute("error", e.getMessage());
			return "account/login";
		}
	}

	@RequestMapping(method = RequestMethod.POST, value = "/android/login")
	public @ResponseBody String androidLogin(HttpServletRequest httpServletRequest) throws Exception {

		String userId = httpServletRequest.getParameter("userId");
		String password = httpServletRequest.getParameter("password");

		Member member = dao.findById(userId);
		if (member == null) {
			System.out.println("login fail");
			return "fail";
		} else {
			if (password.equals(member.getPassword())) {
				System.out.println("login ok");
				return "ok";
			} else {
				System.out.println("login fail");
				return "fail";
			}
		}
	}

	@RequestMapping(value = "/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public void joinForm(Member member) {
	}

	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String joinSubmit(@Valid Member member, BindingResult result) throws Exception {
		if (result.hasErrors()) { // 유효성 검사 실패
			return "account/join";
		}
		service.join(member);
		return "redirect:/";
//		return "account/join_success";
	}

	@RequestMapping(method = RequestMethod.POST, value = "/android/join")
	public @ResponseBody String androidJoin(HttpServletRequest httpServletRequest) throws Exception {
		String userId = httpServletRequest.getParameter("userId");
		String password = httpServletRequest.getParameter("password");
		String parName = httpServletRequest.getParameter("parName");
		String babyName = httpServletRequest.getParameter("babyName");
		String email = httpServletRequest.getParameter("email");
		Date regDate, updateDate;

		regDate = sdf1.parse(sdf1.format(new Date()));

		updateDate = sdf1.parse(sdf1.format(new Date()));

		Member member = new Member(userId, password, parName, babyName, email, regDate, updateDate);
		if (member != null) {
			try {
				service.join(member);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return "fail";
			}
			System.out.println("android join success");
			return "ok";
		} else {
			return "fail";
		}
	}

	@RequestMapping(method = RequestMethod.POST, value = "/android/join/idcheck")
	public @ResponseBody String idcheck(HttpServletRequest httpServletRequest) throws Exception {
		String userId = httpServletRequest.getParameter("userId");
		System.out.println("id확인 요청 : " + userId);
		return service.idcheck(userId);
	}

	// id 중복 체크
	// json 자동 변환 - gson 의존성 추가
	@RequestMapping(value = "/idcheck", method = RequestMethod.GET)
	@ResponseBody
	public String checkUserId(@RequestParam("userId") String userId) throws Exception {
		return service.idcheck(userId);
	}

	@RequestMapping(value = "/join_success", method = RequestMethod.GET)
	public void checkUserId() throws Exception {
	}

}
