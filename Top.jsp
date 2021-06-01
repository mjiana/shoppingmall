<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% 
String mem_id = (String)session.getAttribute("idkey");
//
String log = "";
String conpath = application.getContextPath();
if(mem_id == null) log = "<a href="+conpath+"/login/Login.jsp>로그인</a>";
else log = "<a href='./login/Logout.jsp'>로그아웃</a>";
//
String mem = "";
if(mem_id == null) mem = "<a href="+conpath+"/register/Register.jsp>회원가입</a>";
else mem = "<a href="+conpath+"./member/MemberUpdate.jsp>로그아웃</a>";
%>    
<table>
	<tr>
		<td><b><%=log %></b></td>
		<td><b><%=mem %></b></td>
		<td><b><a href="<%=conpath %>/ProductList.jsp">상품목록</a></b></td>
		<td><b><a href="<%=conpath %>/cart/CartList.jsp">장바구니</a></b></td>
		<td><b><a href="<%=conpath %>/order/OrderList.jsp">구매목록</a></b></td>
	</tr>
</table>
<br>
