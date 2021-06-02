<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, ch14.*"  %>
<title>Simple Shopping mall</title>
<% request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id="cartMgr" class="ch14.CartMgr" scope="session"/>
<jsp:useBean id="orderMgr" class="ch14.OrderMgr"/>    
<jsp:useBean id="proMgr" class="ch14.ProductMgr"/>   
<%
Hashtable hCart = cartMgr.getCartList();
Enumeration hCartKey = hCart.keys();

if(hCart.size() != 0){
	while(hCartKey.hasMoreElements()){
		OrderBean ob = (OrderBean)hCart.get(hCartKey.nextElement());
		//상용 쇼핑몰이라면 이 위치가 전자결제(PG) 시점이다.
		
		//주문입력  
		orderMgr.insertOrder(ob);
		
		//재고수량 감소
		proMgr.reduceProduct(ob);
		
		//장바구니 삭제
		cartMgr.deleteCart(ob);
	}//while
%>
<script type="text/javascript">
	alert("주문되었습니다.");
	location.href="../OrderList.jsp";
</script>
<%
}else{
%>
<script type="text/javascript">
	alert("장바구니가 비어 있습니다.");
	location.href="../OrderList.jsp";
</script>
<%
}
%>
