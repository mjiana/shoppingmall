<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Simple Shopping mall</title>
<link rel="stylesheet" type="text/css" href="./style/shop.css">
<script type="text/javascript" src="./js/Script.js"></script>
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
		<td>로그인 후 이용해주세요.</td>
	</tr>
	<%
	}
	%>
</table>
<table class="type03">
  <tr>
    <th scope="row">항목명</th>
    <td>내용이 들어갑니다.</td>
  </tr>
  <tr>
    <th scope="row">항목명</th>
    <td>내용이 들어갑니다.</td>
  </tr>
  <tr>
    <th scope="row">항목명</th>
    <td>내용이 들어갑니다.</td>
  </tr>
</table>
<%@ include file="Bottom.jsp" %>
</body>
</html>