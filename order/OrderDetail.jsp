<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.Vector, ch14.*, java.text.DecimalFormat" %>
<% request.setCharacterEncoding("euc-kr"); %>  
<jsp:useBean id="pMgr" class="ch14.ProductMgr"/>
<jsp:useBean id="oMgr" class="ch14.OrderMgr"/>
<%
OrderBean ob = oMgr.getOrderDetail(Integer.parseInt(request.getParameter("no")));
ProductBean pb = pMgr.getProduct(Integer.toString(ob.getP_no()));
//천단위마다 ,넣기
DecimalFormat df = new DecimalFormat("###,###");
//상품 가격
String price = df.format(pb.getP_price());
//주문 금액
int total = ob.getO_quantity() * pb.getP_price();
String totalPrice = df.format(total);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Simple Shopping mall Manager</title>
<link rel="stylesheet" type="text/css" href="../style/shop.css">
<script type="text/javascript" src="../js/Script.js"></script>
<script type="text/javascript" src="../js/Link.js"></script>
<script type="text/javascript" src="../js/Sort.js"></script>
</head>
<body>
<%@ include file="../Top.jsp" %>
<form method="post" name="order" action="OrderProc.jsp">
<table class="type02">
	<tr>
		<td colspan="2"><font class="thfont">주문내역 상세보기</font></td>
	</tr>
	<tr>
		<th>고객아이디</th>
		<td><%=ob.getM_id() %></td>
	</tr>
	<tr>
		<th>주문번호</th>
		<td><%=ob.getO_no() %></td>
	</tr>
	<tr>
		<th>제품번호</th>
		<td><%=pb.getP_no() %></td>
	</tr>
	<tr>
		<th>제품이름</th>
		<td>
			<img src="../images/<%=pb.getP_image() %>" width="50" height="50" class="img2" alt="상품 이미지">
			<%=pb.getP_name() %>
		</td>
	</tr>
	<tr>
		<th>제품가격</th>
		<td><%=price %>원</td>
	</tr>
	<tr>
		<th>주문수량</th>
		<td><%=ob.getO_quantity() %>개</td>
	</tr>
	<tr>
		<th>재고수량</th>
		<td><%=pb.getP_stock() %>개</td>
	</tr>
	<tr>
		<th>주문일</th>
		<td><%=ob.getO_date().substring(0, 10) %></td>
	</tr>
	<tr>
		<th>주문금액</th>
		<td><%=totalPrice %>원</td>
	</tr>
	<tr>
		<th>주문상태</th>
		<td>
			<select name="state">
				<option value="1">접수중</option>
				<option value="2">접수완료</option>
				<option value="3">입금확인</option>
				<option value="4">배송준비</option>
				<option value="5">배송중</option>
				<option value="6">배송완료</option>
			</select>
			<script type="text/javascript">
				document.order.state.value = <%=ob.getO_state()%>;
			</script>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="button" class="btn1" value="수정하기" onclick="oUpdate(this.form)">
			<input type="button" class="btn1" value="삭제하기" onclick="oDelete(this.form)">
			<input type="button" class="btn1" value="목록으로" onclick="oMgr()">
		</td>
	</tr>
</table>
<input type="hidden" name="no" value="<%=ob.getO_no()%>">
<input type="hidden" name="flag">
</form>
<%@ include file="../Bottom.jsp" %>
</body>
</html>