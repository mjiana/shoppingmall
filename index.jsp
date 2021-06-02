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
		<td><%=mem_id %>님 방문을 환영합니다.</td>
	</tr>
	<%
	}else{
	%>
	<tr>
		<td><input type="button" class="btn1" value="로그인" onclick="login()"></td>
		<td><input type="button" class="btn1" value="상품목록보기" onclick="pList()"></td>
	</tr>
	<%
	}
	%>
</table>

<%@ include file="Bottom.jsp" %>
</body>
</html>