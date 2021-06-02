<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="ch14.*, java.text.DecimalFormat"%>
<% 
String mem_id = (String)session.getAttribute("idKey"); 
if(mem_id != null && mem_id.equals("manager")){
	request.setCharacterEncoding("euc-kr"); 
%>
<jsp:useBean id="proMgr" class="ch14.ProductMgr"/>
<% 
ProductBean pb = proMgr.getProduct(request.getParameter("no")); 
//���ݿ� õ�������� ,�ֱ�
DecimalFormat df = new DecimalFormat("###,###");
String price = df.format(pb.getP_price());
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Simple Shopping mall Manager</title>
<link rel="stylesheet" type="text/css" href="../style/shop.css">
<script type="text/javascript" src="../js/Script.js"></script>
<script type="text/javascript" src="../js/Link.js"></script>
</head>
<body>
<%@ include file="../Top.jsp" %>
<table class="type02">
	<tr>
		<td colspan="2"><font class="thfont">��ǰ ����</font></td>
	</tr>
	<tr>
		<td colspan="2">
			<img src="../images/<%=pb.getP_image() %>" alt="��ǰ �̹���" class="img">
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
		<th>���</th>
		<td><%=pb.getP_stock() %>��</td>
	</tr>
	<tr>
		<th>�԰���</th>
		<td><%=pb.getP_date().substring(0,10) %></td>
	</tr>
	<tr>
		<th>�󼼼���</th>
		<td><pre><%=pb.getP_detail() %></pre></td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="button" class="btn1" value="�����ϱ�" onclick="pUpdate(<%=pb.getP_no() %>)">
			<input type="button" class="btn1" value="�����ϱ�" onclick="pDelete(<%=pb.getP_no() %>)">
			<input type="button" class="btn1" value="�������" onclick="pMgr()">
		</td>
	</tr>
</table>
<%@ include file="../Bottom.jsp" %>
<form name="update" method="post" action="ProductUpdate.jsp">
	<input type="hidden" name="no">
</form>
<form name="delete" method="post" action="ProductProc.jsp?flag=delete">
	<input type="hidden" name="no">
</form>
</body>
</html>
<%
}else{
%>
<script type="text/javascript">
alert("�����ڸ� ���� �����մϴ�.");
location.href="../index.jsp";
</script>
<%	
}
%>