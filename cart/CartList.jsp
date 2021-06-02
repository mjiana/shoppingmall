<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, ch14.*" %>
<% request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id="proMgr" class="ch14.ProductMgr"/>
<jsp:useBean id="cartMgr" class="ch14.CartMgr" scope="session"/>
<%
String mem_id = (String)session.getAttribute("idKey"); 
java.text.DecimalFormat df = new java.text.DecimalFormat("###,###");
/* if(id == null){
response.sendRedirect("../login/Login.jsp");
} else{ */
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Simple Shopping mall</title>
<link rel="stylesheet" type="text/css" href="../style/shop.css">
<script type="text/javascript" src="../js/Script.js"></script>
<script type="text/javascript" src="../js/Sort.js"></script>
</head>
<body>
<%@ include file="../Top.jsp" %>

<table class="type03">
	<tr>
		<td colspan="6"><font class="thfont">장바구니</font></td>
	</tr>
	<tr>
		<th>제품</th>
		<th>수량</th>
		<th>단가</th>
		<th>가격</th>
		<th>수정/삭제</th>
		<th>조회</th>
	</tr>
	<%
	int totalPrice = 0; //장바구니 총 금액
	int cnt = 0; //장바구니 총 갯수
	Hashtable hCart = cartMgr.getCartList();
	if(hCart.size() == 0){
	%>
	<tr>
		<td colspan="6">장바구니가 비어있습니다.</td>
	</tr>
	<%
	} else{
		Enumeration hCartKey = hCart.keys();
		while(hCartKey.hasMoreElements()){
			OrderBean ob = (OrderBean)hCart.get(hCartKey.nextElement());
			ProductBean pb = proMgr.getProduct(Integer.toString(ob.getP_no()));
			int price = pb.getP_price();
			int qtity = ob.getO_quantity();
			int subTotal = price * qtity;
			totalPrice += subTotal; 
			cnt++;
	%>
	<form method="post" action="CartProc.jsp">
	<tr>
		<td><%=pb.getP_name() %></td>
		<td><input type="text" name="quantity" value="<%=ob.getO_quantity() %>" size="2" maxlength="2">개</td>
		<td><%=df.format(price) %>원</td>
		<td><%=df.format(subTotal) %>원</td>
		<td>
			<input type="hidden" name="no" value="<%=pb.getP_no()%>">
			<input type="hidden" name="flag">
			<input type="button" class="btn1" value="수정" onclick="cUpdate(this.form)">
			<input type="button" class="btn1" value="삭제" onclick="cDelete(this.form)">
		</td>
		<td><a href="javascript:pDtail(<%=pb.getP_no()%>)">상세보기</a></td>
	</tr>
	</form>
	<%
		}//while
	}//else
	if(cnt > 0){
	%>
	<tr>
		<td colspan="6" class="right">
			총 <%=df.format(cnt) %>개,&nbsp;
			<%=df.format(totalPrice) %>원 &nbsp;&nbsp;
			<input type="button" class="btn1" value="주문하기" onclick="location.href='CartOrderProc.jsp'">
		</td>
	</tr>
	<%} %>
</table>
<%@ include file="../Bottom.jsp" %>
<form name="detail" method="post" action="../ProductListDetail.jsp">
	<input type="hidden" name="no">
</form>
</body>
</html>
<%
//} //if(id == null) end
%>