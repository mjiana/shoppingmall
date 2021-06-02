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
		//��� ���θ��̶�� �� ��ġ�� ���ڰ���(PG) �����̴�.
		
		//�ֹ��Է�  
		orderMgr.insertOrder(ob);
		
		//������ ����
		proMgr.reduceProduct(ob);
		
		//��ٱ��� ����
		cartMgr.deleteCart(ob);
	}//while
%>
<script type="text/javascript">
	alert("�ֹ��Ǿ����ϴ�.");
	location.href="../OrderList.jsp";
</script>
<%
}else{
%>
<script type="text/javascript">
	alert("��ٱ��ϰ� ��� �ֽ��ϴ�.");
	location.href="../OrderList.jsp";
</script>
<%
}
%>
