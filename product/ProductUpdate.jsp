<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="ch14.*" %>
<% request.setCharacterEncoding("euc-kr"); 
String mem_id = (String)session.getAttribute("idKey"); %>    
<jsp:useBean id="proMgr" class="ch14.ProductMgr"/>    
<% ProductBean pb = proMgr.getProduct(request.getParameter("no"));  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Simple Shopping mall Manager</title>
<link rel="stylesheet" type="text/css" href="../style/shop.css">
<script type="text/javascript" src="../js/Script.js"></script>
<script type="text/javascript" src="../js/Link.js"></script>
</head>
<body onload="pform.name.focus()">
<%@ include file="../Top.jsp" %>
<form method="post" name="pform" action="ProductProc.jsp?flag=update" enctype="multipart/form-data">
<table class="type02">
	<tr>
		<td colspan="2"><font class="thfont">상품 수정</font></td>
	</tr>
	<tr>
		<th>상품명</th>
		<td><input type="text" class="txt1" name="name" value="<%=pb.getP_name()%>"></td>
	</tr>
	<tr>
		<th>상품가격</th>
		<td><input type="text" class="txt1" name="price" value="<%=pb.getP_price()%>" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');"></td>
	</tr>
	<tr>
		<th>상품설명</th>
		<td><textarea class="txtarea1" name="detail"><%=pb.getP_detail()%></textarea> </td>
	</tr>
	<tr>
		<th>상품수량</th>
		<td><input type="text" class="txt1" name="stock" value="<%=pb.getP_stock()%>" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');"></td>
	</tr>
	<tr>
		<th>상품 이미지</th>
		<td>
			<img src="../images/<%=pb.getP_image() %>" alt="상품 이미지">
			<br>현재 : <%=pb.getP_image() %>
			<input type="file" name="image">
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="hidden" name="no" value="<%=pb.getP_no()%>">
			<input type="reset" class="btn1" value="다시쓰기">
			<input type="button" class="btn1" value="상품수정" onclick="productCk()">
			<input type="button" class="btn1" value="목록으로" onclick="pMgr()">
		</td>
	</tr>
</table>
</form>
<%@ include file="../Bottom.jsp" %>
</body>
</html>