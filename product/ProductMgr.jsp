<%@page import="ch14.ProductBean"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("euc-kr"); %>    
<jsp:useBean id="proMgr" class="ch14.ProductMgr"/>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Simple Shopping mall Manager</title>
<link rel="stylesheet" type="text/css" href="../style/shop.css">
<script type="text/javascript" src="../js/Script.js"></script>
<script type="text/javascript">
function pInsert(){
	location.href="ProductInsert.jsp";
}
</script>
</head>
<body>
<%@ include file="../Top.jsp" %>
<table class="type03">
	<tr>
		<td colspan="5"><font class="thfont">상품 보기</font></td>
	</tr>
	<tr>
		<th>이름</th>
		<th>가격</th>
		<th>날짜</th>
		<th>재고</th>
		<th>내용</th>
	</tr>
	<%
	Vector vlist = proMgr.getProductList();
	if(vlist.size() == 0){
	%>
	<tr>
		<td colspan="5">등록된 상품이 없습니다.</td>
	</tr>
	<%
	} else{
		for(int i=0; i<vlist.size(); i++){
			ProductBean pb = (ProductBean)vlist.get(i);
	%>
	<tr>
		<td><%=pb.getP_name() %></td>
		<td><%=pb.getP_price() %></td>
		<td><%=pb.getP_date().substring(0,10) %></td>
		<td><%=pb.getP_stock() %></td>
		<td><a href="javascript:pDtail('<%=pb.getP_no() %>')">상세보기</a></td>
	</tr>
	<%		
		}//for
	}//else
	%>
	<tr>
		<td colspan="5"><input type="button" class="btn1" value="새로운 상품등록하기" onclick="pInsert()"></td>
	</tr>
</table>
<%@ include file="../Bottom.jsp" %>
<form name="detail" method="post" action="ProductDetail.jsp">
	<input type="hidden" name="no">
</form>
</body>
</html>