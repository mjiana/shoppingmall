<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% 
request.setCharacterEncoding("euc-kr"); 
String mem_id = (String)session.getAttribute("idKey"); 
%>
<jsp:useBean id="rb" class="ch14.RegisterBean"/>
<jsp:setProperty property="*" name="rb"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Simple Shopping mall</title>
<link rel="stylesheet" type="text/css" href="../style/shop.css">
</head>
<body>
<%@ include file="../Top.jsp" %>
<form name="regForm" method="post" action="RegisterInsert.jsp"> 
<table class="type02">
	<tr>
		<td colspan="2"><font class="thfont">�������� Ȯ��</font></td>
	</tr>
	<tr>
		<th>���̵�</th>
		<td><input type="hidden" name="mem_id" value="<%=rb.getMem_id() %>"><%=rb.getMem_id() %></td>
	</tr>
	<tr>
		<th>��й�ȣ</th>
		<td><input type="hidden" name="mem_passwd" value="<%=rb.getMem_passwd() %>"><%=rb.getMem_passwd() %></td>
	</tr>
	<tr>
		<th>�̸�</th>
		<td><input type="hidden" name="mem_name" value="<%=rb.getMem_name() %>"><%=rb.getMem_name() %></td>
	</tr>
	<tr>
		<th>�������</th>
		<td><input type="hidden" name="mem_num1" value="<%=rb.getMem_num1() %>"><%=rb.getMem_num1() %></td>
	</tr>
	<tr>
		<th>�̸���</th>
		<td><input type="hidden" name="mem_email" value="<%=rb.getMem_email() %>"><%=rb.getMem_email() %></td>
	</tr>
	<tr>
		<th>��ȭ��ȣ</th>
		<td><input type="hidden" name="mem_phone" value="<%=rb.getMem_phone() %>"><%=rb.getMem_phone() %></td>
	</tr>
	<tr>
		<th>�ּ�</th>
		<td><input type="hidden" name="mem_zipcode" value="<%=rb.getMem_zipcode() %>"><%=rb.getMem_zipcode() %>
		&nbsp;<input type="hidden" name="mem_address" value="<%=rb.getMem_address() %>"><%=rb.getMem_address() %></td>
	</tr>
	<tr>
		<th>����</th>
		<td><input type="hidden" name="mem_job" value="<%=rb.getMem_job() %>"><%=rb.getMem_job() %></td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="submit" class="btn1" value="ȸ������">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="button" class="btn1" value="���ư���" onclick="history.back()">
		</td>
	</tr>
</table>
</form>
<%@ include file="../Bottom.jsp" %>
</body>
</html>