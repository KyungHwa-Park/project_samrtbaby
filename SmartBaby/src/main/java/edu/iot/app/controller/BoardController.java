package edu.iot.app.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import edu.iot.common.exception.PasswordMissmatchException;
import edu.iot.common.model.Board;
import edu.iot.common.service.BoardService;
import edu.iot.common.util.Util;
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
	public void list(
			@RequestParam(value="page", defaultValue="1") int page,
			Model model) throws Exception {
		
//		model.addAttribute("today", Util.getToday());
		model.addAllAttributes(service.getPage(page));
	}
	
	@RequestMapping(value="/create", method=RequestMethod.GET)
	public void createForm(Board board) {
	}
	
	@RequestMapping(value="/create", method=RequestMethod.POST)
	public String createSubmit(
			@Valid Board board, BindingResult result,
			MultipartHttpServletRequest request) throws Exception {
		
		if(result.hasErrors()) return "board/create";
		
		service.create(board);
		
		return "redirect:list";
	}
	
	@RequestMapping(value="/view/{boardId}", method=RequestMethod.GET)
	public String view(@PathVariable long boardId, Model model) throws Exception {
		Board board = service.findById(boardId);
		model.addAttribute("board", board);
		
		return "board/view";
	}
	
	
	@RequestMapping(value="/edit/{boardId}", method=RequestMethod.GET)
	public String editForm(@PathVariable int boardId, Model model) 
													throws Exception {
		Board board = service.findById(boardId);
		model.addAttribute("board", board);
		return "board/edit";
	}
	
	@RequestMapping(value="/edit/{boardId}", method=RequestMethod.POST)
	public String editSubmit(@Valid Board board, BindingResult result,
			@RequestParam("page") int page,
			MultipartHttpServletRequest request) throws Exception {
		if(result.hasErrors()) return "board/edit";
		
		try {
			service.update(board);
		} catch(PasswordMissmatchException e) {
			result.reject("updateFail", e.getMessage());
			
			return "board/edit";
		}
		
		return "redirect:/board/view/" + board.getId() +
						"?page=" + page;
	}
	
	@ResponseBody
	@RequestMapping(value="/delete",
					method=RequestMethod.GET,
					produces="text/plain; charset=utf8")
	public String delete(Board board) {
		try {
			service.delete(board);
			return "ok";
		} catch (Exception e) {
			return e.getMessage();
		}
	}
}
