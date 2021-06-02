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
		<td colspan="5"><font class="thfont">�ֹ� ���</font></td>
	</tr>
	<tr>
		<th>�ֹ���ȣ</th>
		<th>��ǰ��</th>
		<th>���ż���</th>
		<th>������</th>
		<th>�ֹ�����</th>
	</tr>
	<%
	mem_id = "LoverBoy";
	Vector vlist = orderMgr.getOrder(mem_id);
	if(vlist.size() == 0){
	%>
	<tr>
		<td colspan="5">�ֹ� ������ �����ϴ�.</td>
	</tr>
	<%
	} else{
		for(int i=0; i<vlist.size(); i++){
			OrderBean ob = (OrderBean)vlist.get(i);
			ProductBean pb = proMgr.getProduct(Integer.toString(ob.getP_no()));
			//���ݿ� õ�������� ,�ֱ�
			java.text.DecimalFormat df = new java.text.DecimalFormat("###,###");
			String state = "";
			switch(ob.getO_state()){
			 case 1 : state = "������"; break;
			 case 2 : state = "�����Ϸ�"; break;
			 case 3 : state = "�Ա�Ȯ��"; break;
			 case 4 : state = "����غ�"; break;
			 case 5 : state = "�����"; break;
			 default : state = "��ۿϷ�"; break;
			}
	%>
	<tr>
		<td><%=ob.getO_no() %></td>
		<td><a href="javascript:productDetail('<%=pb.getP_no() %>')"><%=pb.getP_name() %></a></td>
		<td><%=ob.getO_quantity() %>��</td>
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