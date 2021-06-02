<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
String mem_id = (String)session.getAttribute("idKey"); 
if(mem_id != null && mem_id.equals("manager")){
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Simple Shopping mall Manager</title>
<link rel="stylesheet" type="text/css" href="../style/shop.css">
</head>
<body>
<%@ include file="../Top.jsp" %>
<table class="type03">
	<tr>
		<td colspan="3"><font class="thfont">관리자페이지</font></td>
	</tr>
	<tr>
		<th>상품현황</th>
		<th>주문현황</th>
		<th>회원현황</th>
	</tr>
	<tr>
		<td><input type="button" class="btn1" value="보기" onclick="location.href='../product/ProductMgr.jsp'"></td>
		<td><input type="button" class="btn1" value="보기" onclick="location.href='../order/OrderMgr.jsp'"></td>
		<td><input type="button" class="btn1" value="보기" onclick="location.href='MemberList.jsp'"></td>
	</tr>
</table>
<%@ include file="../Bottom.jsp" %>
</body>
</html>
<%
}else{
%>
<script type="text/javascript">
alert("관리자만 접속 가능합니다.");
location.href="../index.jsp";
</script>
<%	
}
%>