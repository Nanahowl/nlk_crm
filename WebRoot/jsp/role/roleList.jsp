<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>角色新建</title>
<link href="css_js/index.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="css_js/jquery/jquery-1.3.2.min.js"></script>
<script src="css_js/popup4exExcel.js" type="text/javascript"></script>
<link href="css_js/general.css" rel="stylesheet" type="text/css"></link>
<script type="text/javascript">
/* $(function(){
	initPageSize();
});
//初始化每页显示几条数据
function initPageSize(){
	var pageSize="${pager.pageSize}";//获得每页显示几条数据
	var options=$("#_pageSize_down option");//获得下拉菜单所有的选项
	
	for(var i=0;i<options.length;i++){
		var p=options[i];
		if(pageSize==p.value){
			p.selected=true;
			break;
		}
	}
}
//添加错误提示信息
function addErrorInfo(mess){
	$("#errorInfo").text(mess);
	//定时执行
	window.setTimeout(function(){
		$("#errorInfo").text("");
	},1000);
}
//新建
function toAdd(){
	window.location.href="role/toAdd";
	//window.open("role/toAdd","_blank","width=740,height=680,location=no,toolbar=no,menubar=no,resizable=no,status=no,scrollbars=yes");
}
//修改
function toUpdate(){
	//获得选中的数目
	var checkNum=$("input[name='role_id']:checked").length;
	if(checkNum==1){
		var select_id=$("input[name='role_id']:checked")[0].value;
		window.location.href="role/toUpdate?roleId="+select_id;
	}else{
		addErrorInfo("请选择一个！");
	}
}
//删除
function toDel(){
	var cbNum = checkBoxNum();
	if(cbNum == 1){
		if(window.confirm("确定删除？")){
			$("#form1").attr("action","role/delete");
			document.forms[0].submit();
		}
	}else{
		//addErrorInfo("请先选择，再删除！");
		addErrorInfo("请选择一个！");
	}
}
//判断列表复选框选中个数是否大于0，是：返回个数，否：返回0
function checkBoxNum(){
	return $("input[name='role_id']:checked").length;
}
function exportExcel(){
	loadPopup_excel('导出Excel');
}
function exportExcel2(){
	$("#form1").attr("action","role/exportExcel");
	document.forms[0].submit();
	$("#form1").attr("action","role");
}
//页码下拉菜单
function changePage(page_select_id){
	var page=$("#"+page_select_id+" option:selected").val();
	$("#hiddenPageNum").val(page);
	document.forms[0].submit();
}
//pageSize(每页显示几条数据)下拉菜单
function changePageSize(page_size_select_id){
	var pageSize=$("#"+page_size_select_id+" option:selected").val();
	$("#hiddenPageSize").val(pageSize);
	$("#hiddenPageNum").val(1);
	document.forms[0].submit();

}
//下一页
function nextPage(){
	var hiddenPageNum = document.getElementById("hiddenPageNum");
	if("" != hiddenPageNum.value){
		//获得总页数
		var totalPage="${pager.totalPage}";
		if((hiddenPageNum.value - 0)<(totalPage-0)){
			hiddenPageNum.value = hiddenPageNum.value - 0 + 1;
			document.forms[0].submit();
		}
	}
}
//上一页
function prePage(){
	var hiddenPageNum = document.getElementById("hiddenPageNum");
	if("" != hiddenPageNum.value){
		var curpage = hiddenPageNum.value - 0;
		if(curpage > 1){
			hiddenPageNum.value = curpage-1;
			document.forms[0].submit();
		}
	}
}
//首页
function firstPage(){
	var hiddenPageNum = document.getElementById("hiddenPageNum");
	if("" != hiddenPageNum.value){
		hiddenPageNum.value = 1;
		document.forms[0].submit();
	}
}
//末页
function lastPage(){
	var hiddenPageNum = document.getElementById("hiddenPageNum");
	if("" != hiddenPageNum.value){
		hiddenPageNum.value = "${pager.totalPage}";
		document.forms[0].submit();
	}
}
//提交表单
function submitForm(){
	document.forms[0].submit();
}
//搜索
function toSearch(){
	//把页码置为1
	$("#hiddenPageNum").val("1");
	//去空格
	var role_name=$("input[name='name']").val().trim();
	$("input[name='name']").val(role_name);
	
	document.forms[0].submit();
}
//清空搜索条件
function clearSearchArea(){
	$("#selectTable input").val("");
	
	//把页码置为1
	$("#hiddenPageNum").val("1");
	document.forms[0].submit();
}
function resetForm(){
	document.forms[0].reset();
}

function openTreeWindow(role_id){
	window.open("role/functionTree?roleId="+role_id,"_blank",
	"width=740,height=680,toolbar=no,menubar=no,resizable=no,status=no,scrollbars=yes");
	//window.open("role/functionTree?roleId="+role_id,"_blank");
}

//更改选中的数目
function updateNum(){
	//获得选中的数目
	var checkNum=$("input[name='role_id']:checked").length;
	//赋值
	$(".select_num").html(checkNum);
	//获得多选框的总数目
	var totalNum=$("input[name='role_id']").length;
	if(checkNum==totalNum){
		$("#ids").attr("checked",true);
	}else{
		$("#ids").attr("checked",false);
	}
}
//全选或全不选
function toChange(){
	var flag=$("#ids").attr("checked");//获得id为ids的多选框的状态
	$("input[name='role_id']").attr("checked",flag);
	
	//获得选中的数目
	var checkNum=$("input[name='role_id']:checked").length;
	//赋值
	$(".select_num").html(checkNum);
} */

	$(function(){
		var options=$("#_pageSize_down option");//获得所有选项
		var pageSize="${pager.pageSize}";
		for(var i=0;i<options.length;i++){
			/*if(options[i].value==pageSize){
				options[i].selected=true;
				break;
			}*/
			if($(options[i]).val()==pageSize){
				$(options[i]).attr("selected",true);
				break;
			}
			
		}
		
	
	});
	//下一页
	function nextPage(){
		var curpage=$("#hiddenPageNum").val()-0;//当前页码
		var totalPage="${pager.totalPage}"-0;//总页数
		if(curpage<totalPage){
			$("#hiddenPageNum").val(curpage+1);//页码加1存入隐藏域
			document.getElementById("form1").reset();
			$("#form1").submit();//提交
		}
	}
	//上一页
	function prePage(){
		var curpage=$("#hiddenPageNum").val()-0;//当前页码
		if(curpage>1){
			$("#hiddenPageNum").val(curpage-1);
			document.getElementById("form1").reset();
			$("#form1").submit();//提交
		}
	}
	//首页
	function firstPage(){
		var curpage=$("#hiddenPageNum").val()-0;//当前页码
		if(curpage>1){
			$("#hiddenPageNum").val(1);
			document.getElementById("form1").reset();
			$("#form1").submit();//提交
		}
	}
	//末页
	function lastPage(){
		var curpage=$("#hiddenPageNum").val()-0;//当前页码
		var totalPage="${pager.totalPage}"-0;//总页数
		if(curpage<totalPage){
			$("#hiddenPageNum").val(totalPage);
			document.getElementById("form1").reset();
			$("#form1").submit();//提交
		}
	}
	//选择新页码时调用
	function changePage(select_id){
		var page=$("#"+select_id).val();//获得页码下拉菜单被选中的选项的value值
		$("#hiddenPageNum").val(page);
		document.getElementById("form1").reset();
		$("#form1").submit();//提交
	}
	
	function changePageSize(select_id){
		var page=$("#"+select_id).val();//获得“条数”的下拉菜单被选中的选项的value值
		$("#hiddenPageSize").val(page);
		$("#hiddenPageNum").val(1);//页码置为1
		document.getElementById("form1").reset();
		$("#form1").submit();//提交
	}
	//点“搜索”时调用
	function toSearch(){
		var roleName=$("input[name='name']").val().trim();
		$("input[name='name']").val(roleName);
	
		$("#hiddenPageNum").val(1);//页码置为1
		$("#form1").submit();//提交
	}
	//清空
	function clearSearchArea(){
		$(".inputTextStyle").val("");
		$("#form1").submit();//提交
	}
	//新建
	function toAdd(){
		//window.location.href="jsp/role/roleAdd.jsp";
		window.location.href="role/toAdd";
	}
	//更改选择条目的数目
	function updateNum(){
		//获得选中的数目
		var checked_num=$("input[name='role_id']:checked").length;
		//更改选择条目的数目
		$(".select_num").text(checked_num);
		//获得多选框总数目(不包含角色名称旁边的多选框)
		var all=$("input[name='role_id']").length;
		
		if(checked_num<all){
			$("#ids").attr("checked",false);
		}else{
			$("#ids").attr("checked",true);
		}
		
	}
	//全选/取消
	function toChange(){
		//获得角色名称旁边的多选框的选中状态
		var flag=$("#ids").attr("checked");
		//把下面的多选框设置为和“角色名称旁边的多选框”相同的状态
		$("input[name='role_id']").attr("checked",flag);
		
		//获得选中的数目
		var checked_num=$("input[name='role_id']:checked").length;
		//更改选择条目的数目
		$(".select_num").text(checked_num);
	}
	function showError(id,err,time){
		$("#"+id).text(err);//添加提示
		setTimeout(function(){
			$("#"+id).text("");
		},time);
	}
	
	//点“修改”
	function toUpdate(){
		//获得选中的数目
		var checked_num=$("input[name='role_id']:checked").length;
		if(checked_num!=1){
			/* $("#errorInfo").text("只能选择一条！");//添加提示
			setTimeout(function(){
				$("#errorInfo").text("");
			},1500); */
			showError("errorInfo","只能选择一条！",1500);
			return;
		}
		//获得id
		var roleId=$("input[name='role_id']:checked")[0].value;
		//window.location.href="role/toUpdate?roleId="+roleId;
		window.open("role/toUpdate?roleId="+roleId,"_blank");//此方法还可设置新窗口样式等
	}
	//点“删除”
	function toDel(){
		var num=$("input[name='role_id']:checked").length;//获得选中的数目
		if(num<1){
			showError("errorInfo","至少选择一条！",1500);
			return;
		}
		$("#form1").attr("action","${pageContext.request.contextPath }/role/delete");
		$("#form1").submit();//提交
		
	}
	//导出Excel
	function exportExcel2(){
		$("#form1").attr("action","${pageContext.request.contextPath }/role/exportExcel");
		$("#form1").submit();//提交
		$("#form1").attr("action","${pageContext.request.contextPath }/role");
	}
	//点击“设置权限”
	function openTreeWindow(roleId){
		window.open("role/showFunction?roleId="+roleId,"_blank");
	}
	
</script>
</head>
<body>
	<form action="${pageContext.request.contextPath }/role" method="post" name="form1" id="form1">
		<input type="hidden" name="page" value="${pager.page}" id="hiddenPageNum" />
		<input type="hidden" name="pageSize" value="${pager.pageSize}" id="hiddenPageSize" />
		<input type="hidden" name="exportType" value="" id="exportType" />
		<table width="99%" srole="0" cellspacing="0" cellpadding="0" id="index_content">
			<tr>
				<td valign="middle" >
					<table width="100%" srole="0" cellspacing="0" cellpadding="0" id="index_main_div1">
						<tr>
							<td height="21" background="image/index_main_div_titleBg.gif"><img style="margin-left:5px;" src="image/index_main_div_left.gif" width="6" height="2" align="absmiddle">&nbsp;<span style="font-weight:bold;font-size:12px;">角色列表</span></td>
						</tr>
					</table>
					
					<table width="100%" srole="0" cellspacing="0" cellpadding="0" id="index_main_div1">
						<tr>
							<td height="21" background="image/index_main_div_titleBg.gif"><img style="margin-left:5px;" src="image/index_main_div_left.gif" width="6" height="2" align="absmiddle">&nbsp;<span style="font-weight:bold;font-size:12px;">角色搜索</span></td>
						</tr>
						<tr>
							<td height="56" align="left" valign="top" bgcolor="#f7fbfc">
								<table width="100%" srole="0" cellspacing="0" cellpadding="0" height="100%" id="selectTable">
									<tr>
										<td width="11%" height="41">名称:</td>
										<td width="17%"><input type="text" name="name" class="inputTextStyle" value="${role.name }"></td>
										<td width="11%">&nbsp;</td>
										<td width="17%">&nbsp;</td>
										<td width="11%">&nbsp;</td>
										<td width="17%">&nbsp;</td>
										<td width="5%">
											<img src="image/s1.gif" width="59" height="22" onclick="toSearch();">
										</td>
										<td width="10%" align="left">
											<img src="image/s2.gif" width="62" height="22" onclick="clearSearchArea();">
										</td>
										<td width="1%" align="left">&nbsp;</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>		
					
					
					<table width="100%" srole="0" cellspacing="0" cellpadding="0" id="select_table">
						<tr>
							<td height="10" bgcolor="#f7fbfc">&nbsp;</td>
						</tr>
						<tr>
							<td height="11"><img src="image/t1.gif" align="absmiddle">
								<span style="font-size:14; font-weight:bold;">角色列表</span>
							</td>
						</tr>
						<tr>
							<td height="16" valign="top"><br /> 
								<img src="image/s3.gif" width="62" style="cursor: pointer" height="22" alt="新建按钮" onclick="toAdd();">
								<img src="image/s13.gif" width="59" style="cursor: pointer" height="22" alt="修改按钮" onclick="toUpdate();">
								<img src="image/s7.gif" width="59" style="cursor: pointer" height="22" alt="删除按钮" onclick="toDel();">
								<img src="image/s14.gif" width="59" style="cursor: pointer" height="22" alt="导出按钮" onclick="exportExcel2();">
								
							</td>
						</tr>
						<tr>
							<td height="5" valign="top"><span id="errorInfo" style="font-size:14px;color:red;">${mess }</span></td>
						</tr>
						<tr>
							<td height="28" valign="top">
								<table width="100%" srole="0" cellspacing="0" cellpadding="0"
									id="selectTable_content">
									<tr>
										<td width="40%" height="19" bgcolor="#f2faff" style="font-size: 12px;">&nbsp;
											<img src="image/t2.gif" align="absmiddle" width="15" height="16"> 
											<!-- <span onclick="exportExcel()" class="pager" style="cursor: pointer">导出 </span> | --> 选择条目:<span class="select_num">0</span>
										</td>
										<td width="3%" bgcolor="#f2faff" style="font-size: 12px;">&nbsp;</td>
										<td width="57%" bgcolor="#f2faff" align="right" style="font-size: 12px;">
											共${pager.totalRecord}条 
											<span class="pager" onclick="firstPage();" style="cursor: pointer">首页</span>
											<span class="pager" onclick="prePage();" style="cursor: pointer">上一页</span>
											${pager.page}/${pager.totalPage} 
											<span onclick="nextPage()" class="pager" style="cursor: pointer">下一页</span> 
											<span onclick="lastPage()" class="pager" style="cursor: pointer">末页</span>
											<select onchange="changePage('_pageNum_up');" id="_pageNum_up">
												<c:forEach begin="1" end="${pager.totalPage }" var="p">
												<option value="${p }" <c:if test="${pager.page==p }">selected</c:if>>第${p }页</option>
												</c:forEach>
											</select> 
											<select onchange="changePageSize('_pageSize_up')" id="_pageSize_up">
												<option value="5" <c:if test="${pager.pageSize==5 }">selected="selected"</c:if>>5条</option>
												<option value="6" <c:if test="${pager.pageSize==6 }">selected="selected"</c:if>>6条</option>
												<option value="7" <c:if test="${pager.pageSize==7 }">selected="selected"</c:if>>7条</option>
												<option value="8" <c:if test="${pager.pageSize==8 }">selected="selected"</c:if>>8条</option>
												<option value="9" <c:if test="${pager.pageSize==9 }">selected="selected"</c:if>>9条</option>
												<option value="10" <c:if test="${pager.pageSize==10 }">selected="selected"</c:if>>10条</option>
												<option value="15" <c:if test="${pager.pageSize==15 }">selected="selected"</c:if>>15条</option>
												<option value="20" <c:if test="${pager.pageSize==20 }">selected="selected"</c:if>>20条</option>
												<option value="25" <c:if test="${pager.pageSize==25 }">selected="selected"</c:if>>25条</option>
												<option value="30" <c:if test="${pager.pageSize==30 }">selected="selected"</c:if>>30条</option>
												<option value="50" <c:if test="${pager.pageSize==50 }">selected="selected"</c:if>>50条</option>
											</select>
										</td>
									</tr>
									<tr>
										<td colspan="3" bgcolor="#f2faff">
											<table width="100%" srole="0" cellspacing="0" cellpadding="0"
												id="select_row">
												<tr>
													<td width="4%" height="28" align="center" background="image/select_title_title.jpg">
														<input id="ids" type="checkbox" name="checkbox" value="checkbox" onclick="toChange();">
													</td>
													<td width="39%" align="left"
														background="image/select_title_title.jpg"><strong>角色名称</strong>
													</td>
													<td width="57%" align="center"
														background="image/select_title_title.jpg"><strong>可进行的操作</strong>
													</td>
												</tr>
											
												<c:forEach items="${roleList }" var="r">
													<tr class="select_content_bg">
														<td align="center">
															<input type="checkbox" name="role_id" value="${r.id }" onclick="updateNum();">
														</td>
														<td>${r.name }</td>
														<td align="center">
															<span onclick="openTreeWindow('${r.id}')" style="cursor: pointer">设置权限</span>
														</td>
													</tr>
												</c:forEach>
												<tr>
													<td colspan="3">&nbsp;</td>
												</tr>
											</table>
										</td>
									</tr>
									<tr>
										<td width="40%" height="19" bgcolor="#f2faff" style="font-size: 12px;">&nbsp;
											<img src="image/t2.gif" align="absmiddle" width="15" height="16"> 
											<span onclick="exportExcel()" class="pager" style="cursor: pointer">导出 </span> | 选择条目:<span class="select_num">0</span>
										</td>
										<td width="3%" bgcolor="#f2faff" style="font-size: 12px;">&nbsp;</td>
										<td width="57%" bgcolor="#f2faff" align="right" style="font-size: 12px;">
											共${pager.totalRecord}条 
											<span class="pager" onclick="firstPage();" style="cursor: pointer">首页</span>
											<span class="pager" onclick="prePage();" style="cursor: pointer">上一页</span>
											${pager.page}/${pager.totalPage} 
											<span onclick="nextPage()" class="pager" style="cursor: pointer">下一页</span> 
											<span onclick="lastPage()" class="pager" style="cursor: pointer">末页</span>
											<select onchange="changePage('_pageNum_down');" id="_pageNum_down">
												<c:forEach begin="1" end="${pager.totalPage }" var="i">
													<option value="${i}"
														<c:if test="${pager.page==i}">selected="selected"</c:if>>第${i}页</option>
												</c:forEach>
											</select> 
											<select onchange="changePageSize('_pageSize_down')" id="_pageSize_down">
												<option value="5">5条</option>
												<option value="6">6条</option>
												<option value="7">7条</option>
												<option value="8">8条</option>
												<option value="9">9条</option>
												<option value="10">10条</option>
												<option value="15">15条</option>
												<option value="20">20条</option>
												<option value="25">25条</option>
												<option value="30">30条</option>
												<option value="50">50条</option>
											</select>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
					
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
