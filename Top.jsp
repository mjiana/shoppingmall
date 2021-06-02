<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% 
String mem_id2 = mem_id;
//
String log = "";
String conpath = application.getContextPath();
if(mem_id2 == null) log = "<a href="+conpath+"/login/Login.jsp>로그인</a>";
else log = "<a href="+conpath+"/login/Logout.jsp>로그아웃</a>";
//
String mem = "";
if(mem_id2 == null) mem = "<a href="+conpath+"/register/Register.jsp>회원가입</a>";
else mem = "<a href="+conpath+"/member/MemberView.jsp>마이페이지</a>";
%>    
<table>
	<tr>
		<td><b><%=log %></b></td>
		<td><b><%=mem %></b></td>
		<td><b><a href="<%=conpath %>/ProductList.jsp">상품목록</a></b></td>
		<td><b><a href="<%=conpath %>/cart/CartList.jsp">장바구니</a></b></td>
		<td><b><a href="<%=conpath %>/OrderList.jsp">구매목록</a></b></td>
	</tr>
</table>
<br>
