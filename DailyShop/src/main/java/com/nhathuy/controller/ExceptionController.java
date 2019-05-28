package com.nhathuy.controller;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.NoHandlerFoundException;

@ControllerAdvice
public class ExceptionController {

	// bắt lỗi 404
	@ExceptionHandler(value = { NoHandlerFoundException.class })
	public String Default(Exception ex) {
		return "404";
	}
}
