<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, ch14.* "%>
<jsp:useBean id="memMgr" class="ch14.MemberMgr"/>
<% 
String mem_id = (String)session.getAttribute("idKey");
if(mem_id == null)response.sendRedirect("../login/Login.jsp");
RegisterBean rb = memMgr.memberView(mem_id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Simple Shopping mall</title>
<link rel="stylesheet" type="text/css" href="../style/shop.css">
<script type="text/javascript" src="../js/Reg_script.js"></script>
</head>
<body>
<%@ include file="../Top.jsp" %>
<form method="post" name="memform" action="MemberUpdate.jsp">
<table class="type02">
	<tr>
		<td colspan="2"><font class="thfont">My Page</font></td>
	</tr>
	<tr>
		<th>아이디</th>
		<td><%=rb.getMem_id() %></td>
	</tr>
	<tr>
		<th>이름</th>
		<td><%=rb.getMem_name() %></td>
	</tr>
	<tr>
		<th>생년월일</th>
		<td><%=rb.getMem_num1() %></td>
	</tr>
	<tr>
		<th>이메일</th>
		<td><%=rb.getMem_email() %></td>
	</tr>
	<tr>
		<th>전화번호</th>
		<td><%=rb.getMem_phone() %></td>
	</tr>
	<tr>
		<th>주소</th>
		<td><%=rb.getMem_zipcode() %>&nbsp;<%=rb.getMem_address() %></td>
	</tr>
	<tr>
		<th>직업</th>
		<td><%=rb.getMem_job() %></td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="submit" class="btn1" value="회원정보 수정"> 
			<input type="button" class="btn1" value="로그아웃" onclick="logCheck()"> 
		</td>
	</tr>
</table>
</form>
<%@ include file="../Bottom.jsp" %>	
</body>
</html>