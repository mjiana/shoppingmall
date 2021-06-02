<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="ch14.*, java.text.DecimalFormat"%>
<% 
String mem_id = (String)session.getAttribute("idKey"); 
if(mem_id != null && mem_id.equals("manager")){
	request.setCharacterEncoding("euc-kr"); 
%>
<jsp:useBean id="proMgr" class="ch14.ProductMgr"/>
<% 
ProductBean pb = proMgr.getProduct(request.getParameter("no")); 
//가격에 천단위마다 ,넣기
DecimalFormat df = new DecimalFormat("###,###");
String price = df.format(pb.getP_price());
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Simple Shopping mall Manager</title>
<link rel="stylesheet" type="text/css" href="../style/shop.css">
<script type="text/javascript" src="../js/Script.js"></script>
<script type="text/javascript" src="../js/Link.js"></script>
</head>
<body>
<%@ include file="../Top.jsp" %>
<table class="type02">
	<tr>
		<td colspan="2"><font class="thfont">상품 보기</font></td>
	</tr>
	<tr>
		<td colspan="2">
			<img src="../images/<%=pb.getP_image() %>" alt="상품 이미지" class="img">
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
		<th>재고</th>
		<td><%=pb.getP_stock() %>개</td>
	</tr>
	<tr>
		<th>입고일</th>
		<td><%=pb.getP_date().substring(0,10) %></td>
	</tr>
	<tr>
		<th>상세설명</th>
		<td><pre><%=pb.getP_detail() %></pre></td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="button" class="btn1" value="수정하기" onclick="pUpdate(<%=pb.getP_no() %>)">
			<input type="button" class="btn1" value="삭제하기" onclick="pDelete(<%=pb.getP_no() %>)">
			<input type="button" class="btn1" value="목록으로" onclick="pMgr()">
		</td>
	</tr>
</table>
<%@ include file="../Bottom.jsp" %>
<form name="update" method="post" action="ProductUpdate.jsp">
	<input type="hidden" name="no">
</form>
<form name="delete" method="post" action="ProductProc.jsp?flag=delete">
	<input type="hidden" name="no">
</form>
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