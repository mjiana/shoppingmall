<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% String mem_id = (String)session.getAttribute("idKey"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Simple Shopping mall</title>
<link rel="stylesheet" type="text/css" href="./style/shop.css">
<script type="text/javascript" src="./js/Script.js"></script>
<script type="text/javascript" src="./js/Link.js"></script>
</head>
<body>
<%@ include file="Top.jsp" %>
<table>
	<%
	if(mem_id != null){
	%>
	<tr>
		<td><%=mem_id %>�� �湮�� ȯ���մϴ�.</td>
	</tr>
	<%
	}else{
	%>
	<tr>
		<td><input type="button" class="btn1" value="�α���" onclick="login()"></td>
		<td><input type="button" class="btn1" value="��ǰ��Ϻ���" onclick="pList()"></td>
	</tr>
	<%
	}
	%>
</table>

<%@ include file="Bottom.jsp" %>
</body>
</html>