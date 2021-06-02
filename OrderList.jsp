<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.Vector, ch14.*" %>
<jsp:useBean id="proMgr" class="ch14.ProductMgr"/>
<jsp:useBean id="orderMgr" class="ch14.OrderMgr"/>   
<%
String mem_id = (String)session.getAttribute("idKey"); 
if(mem_id == null){
	response.sendRedirect("./login/Login.jsp");
}else{
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
<table class="type03">
	<tr>
		<td colspan="5"><font class="thfont">주문 목록</font></td>
	</tr>
	<tr>
		<th>주문번호</th>
		<th>제품명</th>
		<th>구매수량</th>
		<th>구매일</th>
		<th>주문상태</th>
	</tr>
	<%
	mem_id = "LoverBoy";
	Vector vlist = orderMgr.getOrder(mem_id);
	if(vlist.size() == 0){
	%>
	<tr>
		<td colspan="5">주문 내역이 없습니다.</td>
	</tr>
	<%
	} else{
		for(int i=0; i<vlist.size(); i++){
			OrderBean ob = (OrderBean)vlist.get(i);
			ProductBean pb = proMgr.getProduct(Integer.toString(ob.getP_no()));
			//가격에 천단위마다 ,넣기
			java.text.DecimalFormat df = new java.text.DecimalFormat("###,###");
			String state = "";
			switch(ob.getO_state()){
			 case 1 : state = "접수중"; break;
			 case 2 : state = "접수완료"; break;
			 case 3 : state = "입금확인"; break;
			 case 4 : state = "배송준비"; break;
			 case 5 : state = "배송중"; break;
			 default : state = "배송완료"; break;
			}
	%>
	<tr>
		<td><%=ob.getO_no() %></td>
		<td><a href="javascript:productDetail('<%=pb.getP_no() %>')"><%=pb.getP_name() %></a></td>
		<td><%=ob.getO_quantity() %>개</td>
		<td><%=ob.getO_date().substring(0,10)%></td>
		<td><%=state %></td>
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
<%
}//else
%>