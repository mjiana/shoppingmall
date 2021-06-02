<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% String mem_id = (String)session.getAttribute("idKey");  %>    
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
<form method="post" name="pform" action="ProductProc.jsp?flag=insert" enctype="multipart/form-data">
<table class="type02">
	<tr>
		<td colspan="2"><font class="thfont">상품 등록</font></td>
	</tr>
	<tr>
		<th>상품명</th>
		<td><input type="text" class="txt1" name="name"></td>
	</tr>
	<tr>
		<th>상품가격</th>
		<td><input type="text" class="txt1" name="price" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');"></td>
	</tr>
	<tr>
		<th>상품설명</th>
		<td><textarea class="txtarea1" name="detail" ></textarea> </td>
	</tr>
	<tr>
		<th>상품수량</th>
		<td><input type="text" class="txt1" name="stock" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');"></td>
	</tr>
	<tr>
		<th>상품 이미지</th>
		<td><input type="file" name="image"></td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="reset" class="btn1" value="다시쓰기">
			<input type="button" class="btn1" value="상품등록" onclick="productCk()">
			<input type="button" class="btn1" value="목록으로" onclick="pMgr()">
		</td>
	</tr>
</table>
</form>
<%@ include file="../Bottom.jsp" %>
</body>
</html>