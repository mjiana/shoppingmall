<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% 
String mem_id2 = mem_id;
//
String log = "";
String mem = "";
String conpath = application.getContextPath();
if(mem_id2 == null) {
	log = "<a href="+conpath+"/login/Login.jsp>�α���</a>";
	mem = "<a href="+conpath+"/register/Register.jsp>ȸ������</a>";
%>
<table>
	<tr>
		<td><b><%=log %></b></td>
		<td><b><%=mem %></b></td>
		<td><b><a href="<%=conpath %>/ProductList.jsp">��ǰ���</a></b></td>
	</tr>
</table>
<%
}else {
	log = "<a href="+conpath+"/login/Logout.jsp>�α׾ƿ�</a>";
	mem = "<a href="+conpath+"/member/MemberView.jsp>����������</a>";
%>
<table>
	<tr>
		<td><b><%=log %></b></td>
		<td><b><%=mem %></b></td>
		<td><b><a href="<%=conpath %>/ProductList.jsp">��ǰ���</a></b></td>
		<td><b><a href="<%=conpath %>/cart/CartList.jsp">��ٱ���</a></b></td>
		<td><b><a href="<%=conpath %>/OrderList.jsp">�ֹ����</a></b></td>
	</tr>
</table>
<%
}
%>    
<br>
