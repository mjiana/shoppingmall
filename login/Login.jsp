<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% 
//���ǰ��� �޾ƿ´�
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
if(mem_id != null){ //���ǰ��� null�� �ƴҶ� ȸ������ �� ǥ��
%>
	<table class="type03">
		<tr>
			<th><%=mem_id %>�� ȯ���մϴ�. </th>
		</tr>
		<tr>
			<td>
				<input type="button" class="btn1" value="�� ��������" onclick="viewPage()">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" class="btn1" value="�α׾ƿ�" onclick="logCheck()">
			</td>
		</tr>
	</table>
<%
} else{ //���ǰ��� null�϶� �α��� �� ǥ��
%>
<form name="login" method="post" action="LoginProc.jsp">
<table class="type02">
	<tr>
		<td colspan="2"><font class="thfont">Login</font></td>
	</tr>
	<tr>
		<th>���̵�</th>
		<td><input type="text" name="mem_id"></td>
	</tr>
	<tr>
		<th>��й�ȣ</th>
		<td><input type="password" name="mem_passwd"></td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="button" class="btn1" value="�α���" onclick="loginCheck()">
			<div align="right"><a href="javascript:memberReg()">ȸ������</a></div>
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