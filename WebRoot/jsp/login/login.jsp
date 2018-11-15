<!DOCTYPE  PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<c:set var="imagesPath" value="${contextPath}/script/images" />
<html >
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>CRM</title>
<%-- <link rel="shortcut icon" href="${ctx}/script/images/title/s_title.png" type="image/x-icon" /> --%>
<link href="./css_js/login.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="./css_js/ajax.js"></script>
<script type="text/javascript">
	var xWithScroll = 0;
	var yWithScroll = 0;

	function getPageSizeWithScroll() {
		if (window.innerHeight && window.scrollMaxY) {// Firefox  
			yWithScroll = window.innerHeight + window.scrollMaxY;
			xWithScroll = window.innerWidth + window.scrollMaxX;
		} else if (document.body.scrollHeight > document.body.offsetHeight) { // all but Explorer Mac  
			yWithScroll = document.body.scrollHeight;
			xWithScroll = document.body.scrollWidth;
		} else { // works in Explorer 6 Strict, Mozilla (not FF) and Safari  
			yWithScroll = document.body.offsetHeight;
			xWithScroll = document.body.offsetWidth;
		}
		return [ xWithScroll, yWithScroll ];
	}
	function refreshMe(obj) {
		obj.src = "${ctx}/validateCode?t=" + Math.random();
	}

	function ajaxCheck() {
		var loginName = document.getElementById("loginName");
		var uPwd = document.getElementById("password");
		var validateCode = document.getElementById("validateCode");
		var errorMsg = document.getElementById("errorMsg");
		//初步页面校验
		if (loginName.value == '') {
			errorMsg.innerHTML = "用户名不能为空！";
			return false;
		} else if (uPwd.value == '') {
			errorMsg.innerHTML = "密码不能为空！";
			return false;
		} else if (validateCode.value == '') {
			errorMsg.innerHTML = "验证码不能为空！";
			return false;
		}
	}
</script>
</head>
<body onload="getPageSizeWithScroll()">
	<div id="login">
		<form action="${ctx}/login" method="post" onsubmit="return ajaxCheck();">
			<ul>
				<li><span>用户名：</span>
					<input name="loginName" id="loginName" value="" type="text" class="inp_tex1"
						onfocus="javascript:this.className='inp_tex1_f';" onblur="javascript:this.className='inp_tex1'" />
					<div class="tis1">
						<label style="color:red;font-size:12px;" id="errorMsg">${errorMsg}</label>
					</div>
				</li>
				<li><span>密&nbsp;&nbsp;码：</span>
					<input name="password" id="password" value="" type="password" class="inp_tex2"
						onfocus="javascript:this.className='inp_tex2_f';" onblur="javascript:this.className='inp_tex2'" />
				</li>
				<li class="li_btn clearfloat"><span>验证码：&nbsp;</span>
					<input name="validateCode" id="validateCode" type="text" class="inp_tex3"
						onfocus="javascript:this.className='inp_tex3_f';" onblur="javascript:this.className='inp_tex3'" /> 
					<img title="看不清楚，点击换一张" src="../validateCode" width="80" height="26" onclick="refreshMe(this);" style="border:1px solid black;"/> 
					<input value="" type="submit" class="btn1" onmouseover="javascript:this.className='btn1_m';"
						onmouseout="javascript:this.className='btn1';" />
				</li>
				
			</ul>
		</form>
	</div>
</body>
</html>
