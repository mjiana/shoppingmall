<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="ch14.*, java.text.DecimalFormat"%>
<% request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id="proMgr" class="ch14.ProductMgr"/>
<% 
String mem_id = (String)session.getAttribute("idKey"); 
ProductBean pb = proMgr.getProduct(request.getParameter("no")); 
//가격에 천단위마다 ,넣기
DecimalFormat df = new DecimalFormat("###,###");
String price = df.format(pb.getP_price());
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Simple Shopping mall</title>
<link rel="stylesheet" type="text/css" href="./style/shop.css">
<script type="text/javascript" src="./js/Script.js"></script>
</head>
<body>
<%@ include file="Top.jsp" %>
<form method="post" name="cart" action="./cart/CartProc.jsp">
<table class="type02">
	<tr>
		<td colspan="2"><font class="thfont">상품 보기</font></td>
	</tr>
	<tr>
		<td colspan="2">
			<img src="./images/<%=pb.getP_image() %>" alt="상품 이미지" class="img">
		</td>
	</tr>
	<tr>
		<th>상품명</th>
		<td><%=pb.getP_name() %></td>
	</tr>
	<tr>
		<th>가격</th>
		<td><%=price %>원</td>
	</tr>
	<tr>
		<th>수량</th>
		<td><input type="text" name="quantity" size="2" value="1" maxlength="2">개</td>
	</tr>
	<tr>
		<th>상세설명</th>
		<td><pre><%=pb.getP_detail() %></pre></td>
	</tr>
	<tr>
		<td colspan="2">
		<% if(mem_id != null){ %>
			<input type="hidden" name="no" value="<%=pb.getP_no() %>">
			<input type="submit" class="btn1" value="장바구니 담기">
		<%} %>
			<input type="button" class="btn1" value="목록으로" onclick="history.back()">
		</td>
	</tr>
</table>
</form>
<%@ include file="Bottom.jsp" %>
</body>
</html>