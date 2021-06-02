<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.Vector, ch14.*" %>
<% request.setCharacterEncoding("euc-kr"); %>    
<jsp:useBean id="proMgr" class="ch14.ProductMgr"/>
<%
String mem_id = (String)session.getAttribute("idKey"); 
//목록 정렬
String sort = request.getParameter("sort");
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Simple Shopping mall</title>
<link rel="stylesheet" type="text/css" href="./style/shop.css">
<script type="text/javascript" src="./js/Script.js"></script>
<script type="text/javascript" src="./js/Sort.js"></script>
</head>
<body>
<%@ include file="Top.jsp" %>
<table class="type03">
	<tr>
		<td colspan="5"><font class="thfont">상품 목록</font></td>
	</tr>
	<tr>
		<td colspan="5" class="right">
		<form method="post" name="psortForm">
			<select name="selsort" onchange="pselCk()">
				<option value="0">상품정렬</option>
				<optgroup label="상품명">
					<option value="nUp">오름차순</option>
					<option value="nDown">내림차순</option>
				</optgroup>
				<optgroup label="가격">
					<option value="pUp">오름차순</option>
					<option value="pDown">내림차순</option>
				</optgroup>
				<optgroup label="입고일">
					<option value="dUp">오름차순</option>
					<option value="dDown">내림차순</option>
				</optgroup>
			</select>
			<input type="hidden" name="sort" value="">
		</form>
		</td>
	</tr>
	<tr>
		<th>이름</th>
		<th>가격</th>
		<th>재고</th>
		<th>입고일</th>
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
			//가격에 천단위마다 ,넣기
			java.text.DecimalFormat df = new java.text.DecimalFormat("###,###");
	%>
	<tr>
		<td><%=pb.getP_name() %></td>
		<td><%=df.format(pb.getP_price()) %>원</td>
		<td><%=pb.getP_stock()%>개</td>
		<td><%=pb.getP_date().substring(0,10) %></td>
		<td><a href="javascript:productDetail('<%=pb.getP_no() %>')">상세보기</a></td>
	</tr>
	<%		
		}//for
	}//else
	%>
</table>
<form name="detail" method="post" action="ProductListDetail.jsp">
	<input type="hidden" name="no">
</form>
<%@ include file="Bottom.jsp" %>
</body>
</html>