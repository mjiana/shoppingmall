<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, ch14.*" %>
<jsp:useBean id="members" class="ch14.MemberMgr"/>
<%
String mem_id = (String)session.getAttribute("idKey"); 
List mList = members.memberList();
int mcnt = mList.size();
%>
<!DOCTYPE html>
<html>
<head>
<%--
스토리 구상하기 
zipCode와 비슷
--%>
<meta charset="EUC-KR">
<title>회원목록 출력하기</title>
<link rel="stylesheet" type="text/css" href="Reg_style.css">
</head>
<body>
<table border="1">
	<tr>
		<td colspan="3"><b>회원 목록</b></td>
	</tr>
	<tr>
		<td>번호</td>
		<td>아이디</td>
		<td>이름</td>
	</tr>
	<%
		for(int i=0; i<mcnt; i++){
			RegisterBean rb = (RegisterBean)mList.get(i);
			String id = rb.getMem_id();
			String name = rb.getMem_name();
			String str;
	%>
	<tr>
		<td><%=i+1 %></td>
		<td><%=id %></td>
		<td><%=name %></td>
	</tr>
	<%
		}
	%>
</table>
</body>
</html>