<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% 
String mem_id2 = mem_id;
//
String log = "";
String mem = "";
String conpath = application.getContextPath();
if(mem_id2 == null) {
	log = "<a href="+conpath+"/login/Login.jsp>로그인</a>";
	mem = "<a href="+conpath+"/register/Register.jsp>회원가입</a>";
%>
<table>
	<tr>
		<td><b><%=log %></b></td>
		<td><b><%=mem %></b></td>
		<td><b><a href="<%=conpath %>/ProductList.jsp">상품목록</a></b></td>
	</tr>
</table>
<%
}else {
	log = "<a href="+conpath+"/login/Logout.jsp>로그아웃</a>";
	mem = "<a href="+conpath+"/member/MemberView.jsp>마이페이지</a>";
%>
<table>
	<tr>
		<td><b><%=log %></b></td>
		<td><b><%=mem %></b></td>
		<td><b><a href="<%=conpath %>/ProductList.jsp">상품목록</a></b></td>
		<td><b><a href="<%=conpath %>/cart/CartList.jsp">장바구니</a></b></td>
		<td><b><a href="<%=conpath %>/OrderList.jsp">주문목록</a></b></td>
	</tr>
</table>
<%
}
%>    
<br>
