<%@page import="ch14.ProductBean"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("euc-kr"); %>    
<jsp:useBean id="proMgr" class="ch14.ProductMgr"/>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Simple Shopping mall Manager</title>
<link rel="stylesheet" type="text/css" href="../style/shop.css">
<script type="text/javascript" src="../js/Script.js"></script>
<script type="text/javascript">
function pInsert(){
	location.href="ProductInsert.jsp";
}
</script>
</head>
<body>
<%@ include file="../Top.jsp" %>
<table class="type03">
	<tr>
		<td colspan="5"><font class="thfont">��ǰ ����</font></td>
	</tr>
	<tr>
		<th>�̸�</th>
		<th>����</th>
		<th>��¥</th>
		<th>���</th>
		<th>����</th>
	</tr>
	<%
	Vector vlist = proMgr.getProductList();
	if(vlist.size() == 0){
	%>
	<tr>
		<td colspan="5">��ϵ� ��ǰ�� �����ϴ�.</td>
	</tr>
	<%
	} else{
		for(int i=0; i<vlist.size(); i++){
			ProductBean pb = (ProductBean)vlist.get(i);
	%>
	<tr>
		<td><%=pb.getP_name() %></td>
		<td><%=pb.getP_price() %></td>
		<td><%=pb.getP_date().substring(0,10) %></td>
		<td><%=pb.getP_stock() %></td>
		<td><a href="javascript:pDtail('<%=pb.getP_no() %>')">�󼼺���</a></td>
	</tr>
	<%		
		}//for
	}//else
	%>
	<tr>
		<td colspan="5"><input type="button" class="btn1" value="���ο� ��ǰ����ϱ�" onclick="pInsert()"></td>
	</tr>
</table>
<%@ include file="../Bottom.jsp" %>
<form name="detail" method="post" action="ProductDetail.jsp">
	<input type="hidden" name="no">
</form>
</body>
</html>