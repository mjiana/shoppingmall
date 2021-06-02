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
���丮 �����ϱ� 
zipCode�� ���
--%>
<meta charset="EUC-KR">
<title>ȸ����� ����ϱ�</title>
<link rel="stylesheet" type="text/css" href="Reg_style.css">
</head>
<body>
<table border="1">
	<tr>
		<td colspan="3"><b>ȸ�� ���</b></td>
	</tr>
	<tr>
		<td>��ȣ</td>
		<td>���̵�</td>
		<td>�̸�</td>
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