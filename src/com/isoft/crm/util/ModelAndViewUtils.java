package com.isoft.crm.util;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJacksonJsonView;

public class ModelAndViewUtils {
	public static ModelAndView view(String path){
		return new ModelAndView(path);
	}
	/**
	 * return = 1 正确
	 * return = 0 错误结果
	 */
	public static ModelAndView Json_ok(){
		ModelAndView mav = new ModelAndView(
				new MappingJacksonJsonView());
		mav.addObject("result","1");
		return mav;
	}
	public static ModelAndView Json_error(){
		ModelAndView mav = new ModelAndView(
				new MappingJacksonJsonView());
		mav.addObject("resutl","0");
		return mav;
	}
	
	public static ModelAndView Json_error(
			String message,Integer result){
		ModelAndView mav = new ModelAndView(
				new MappingJacksonJsonView());
		mav.addObject("result",result);
		mav.addObject("mess",message);
		return mav;
	}
}
