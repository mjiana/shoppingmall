<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% 
//세션값을 받아온다
String mem_id = (String)session.getAttribute("idKey"); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Simple Shopping mall</title>
<link rel="stylesheet" type="text/css" href="../style/shop.css">
<script type="text/javascript" src="../js/Reg_script.js"></script>
</head>
<body onload="login.mem_id.focus()">
<%@ include file="../Top.jsp" %>

<br>
<%
if(mem_id != null){ //세션값이 null이 아닐때 회원전용 뷰 표시
%>
	<table class="type03">
		<tr>
			<th><%=mem_id %>님 환영합니다. </th>
		</tr>
		<tr>
			<td>
				<input type="button" class="btn1" value="내 정보보기" onclick="viewPage()">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" class="btn1" value="로그아웃" onclick="logCheck()">
			</td>
		</tr>
	</table>
<%
} else{ //세션값이 null일때 로그인 폼 표시
%>
<form name="login" method="post" action="LoginProc.jsp">
<table class="type02">
	<tr>
		<td colspan="2"><font class="thfont">Login</font></td>
	</tr>
	<tr>
		<th>아이디</th>
		<td><input type="text" name="mem_id"></td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td><input type="password" name="mem_passwd"></td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="button" class="btn1" value="로그인" onclick="loginCheck()">
			<div align="right"><a href="javascript:memberReg()">회원가입</a></div>
		</td>
	</tr>
</table>
</form>
<%
}
%>
<%@ include file="../Bottom.jsp" %>
</body>
</html>