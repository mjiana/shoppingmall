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
		<td><%=mem_id %>�� �湮�� ȯ���մϴ�.</td>
	</tr>
	<%
	}else{
	%>
	<tr>
		<td>�α��� �� �̿����ּ���.</td>
	</tr>
	<%
	}
	%>
</table>
<table class="type03">
  <tr>
    <th scope="row">�׸��</th>
    <td>������ ���ϴ�.</td>
  </tr>
  <tr>
    <th scope="row">�׸��</th>
    <td>������ ���ϴ�.</td>
  </tr>
  <tr>
    <th scope="row">�׸��</th>
    <td>������ ���ϴ�.</td>
  </tr>
</table>
<%@ include file="Bottom.jsp" %>
</body>
</html>