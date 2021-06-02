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
		<td colspan="6"><font class="thfont">��ٱ���</font></td>
	</tr>
	<tr>
		<th>��ǰ</th>
		<th>����</th>
		<th>�ܰ�</th>
		<th>����</th>
		<th>����/����</th>
		<th>��ȸ</th>
	</tr>
	<%
	int totalPrice = 0; //��ٱ��� �� �ݾ�
	int cnt = 0; //��ٱ��� �� ����
	Hashtable hCart = cartMgr.getCartList();
	if(hCart.size() == 0){
	%>
	<tr>
		<td colspan="6">��ٱ��ϰ� ����ֽ��ϴ�.</td>
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
		<td><input type="text" name="quantity" value="<%=ob.getO_quantity() %>" size="2" maxlength="2">��</td>
		<td><%=df.format(price) %>��</td>
		<td><%=df.format(subTotal) %>��</td>
		<td>
			<input type="hidden" name="no" value="<%=pb.getP_no()%>">
			<input type="hidden" name="flag">
			<input type="button" class="btn1" value="����" onclick="cUpdate(this.form)">
			<input type="button" class="btn1" value="����" onclick="cDelete(this.form)">
		</td>
		<td><a href="javascript:pDtail(<%=pb.getP_no()%>)">�󼼺���</a></td>
	</tr>
	</form>
	<%
		}//while
	}//else
	if(cnt > 0){
	%>
	<tr>
		<td colspan="6" class="right">
			�� <%=df.format(cnt) %>��,&nbsp;
			<%=df.format(totalPrice) %>�� &nbsp;&nbsp;
			<input type="button" class="btn1" value="�ֹ��ϱ�" onclick="location.href='CartOrderProc.jsp'">
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