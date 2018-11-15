package com.isoft.crm.controller;

import java.util.List;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.isoft.crm.bean.MenuBean;
import com.isoft.crm.bean.UserSession;
import com.isoft.crm.service.LoginService;
import com.isoft.crm.util.SessionUtils;

/**
 * 
 *@Title: LoginController.java
 *@Package: com.isoft.crm.controller
 *@Description:
 *		The controller of user sessions. (Login in & login out)
 *@author: Nina Zhao
 *@date:下午5:00:14
 */

@Controller
public class LoginController {
	
	@Resource(name="loginService")
	private LoginService loginService;
	
	@RequestMapping("/login")
	public String login(HttpSession session, Model model,
						@RequestParam("loginName")String loginName,
						@RequestParam("password")String upwd,
						@RequestParam("validateCode")String validateCode) {
		String errorMsg = "";
		//If ValidateCode is right checking the validity of this user.
		if(SessionUtils.checkValidateCode(validateCode, session)) {
			//Searching the user by pwd and uname
			UserSession userSession = loginService.getUserSession(loginName, upwd);
			System.out.println(userSession.getStatus());
			if(userSession!=null) {
				//Checking if the account number is dead status.
				if("启用".equals(userSession.getStatus())) {
					//1.Getting user's menu
					List<MenuBean> menus = loginService.getMenu(userSession);
					//2.Getting user's authority code
					Set<Integer> functionIds = loginService.getFunctionIdByRoleId(userSession.getRoleId());
					userSession.setMenus(menus);
					userSession.setFunctionIds(functionIds);
					SessionUtils.saveUserSession(session, userSession);
					//Redirect to mian page.
					return "redirect:/toMain";
				}else {
					errorMsg = "用户已经被停用";
				}
			}else {
				errorMsg = "用户名或密码错误";
			}
		}else {
			errorMsg = "验证码错误";
			System.out.println("验证码："+validateCode);
		}
		model.addAttribute("errorMsg", errorMsg);
		return "/jsp/login/login.jsp";
	}
	
	@RequestMapping("/toMain")
	public ModelAndView toMain(){
		return new ModelAndView("/jsp/main/main.jsp");
	}
}
