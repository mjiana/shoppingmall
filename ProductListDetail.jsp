<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="ch14.*, java.text.DecimalFormat"%>
<% request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id="proMgr" class="ch14.ProductMgr"/>
<% 
String mem_id = (String)session.getAttribute("idKey"); 
ProductBean pb = proMgr.getProduct(request.getParameter("no")); 
//���ݿ� õ�������� ,�ֱ�
DecimalFormat df = new DecimalFormat("###,###");
String price = df.format(pb.getP_price());
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
<form method="post" name="cart" action="./cart/CartProc.jsp">
<table class="type02">
	<tr>
		<td colspan="2"><font class="thfont">��ǰ ����</font></td>
	</tr>
	<tr>
		<td colspan="2">
			<img src="./images/<%=pb.getP_image() %>" alt="��ǰ �̹���" class="img">
		</td>
	</tr>
	<tr>
		<th>��ǰ��</th>
		<td><%=pb.getP_name() %></td>
	</tr>
	<tr>
		<th>����</th>
		<td><%=price %>��</td>
	</tr>
	<tr>
		<th>����</th>
		<td><input type="text" name="quantity" size="2" value="1" maxlength="2">��</td>
	</tr>
	<tr>
		<th>�󼼼���</th>
		<td><pre><%=pb.getP_detail() %></pre></td>
	</tr>
	<tr>
		<td colspan="2">
		<% if(mem_id != null){ %>
			<input type="hidden" name="no" value="<%=pb.getP_no() %>">
			<input type="submit" class="btn1" value="��ٱ��� ���">
		<%} %>
			<input type="button" class="btn1" value="�������" onclick="history.back()">
		</td>
	</tr>
</table>
</form>
<%@ include file="Bottom.jsp" %>
</body>
</html>