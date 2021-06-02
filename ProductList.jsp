<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.Vector, ch14.*" %>
<% request.setCharacterEncoding("euc-kr"); %>    
<jsp:useBean id="proMgr" class="ch14.ProductMgr"/>
<%
String mem_id = (String)session.getAttribute("idKey"); 
//��� ����
String sort = request.getParameter("sort");
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Simple Shopping mall</title>
<link rel="stylesheet" type="text/css" href="./style/shop.css">
<script type="text/javascript" src="./js/Script.js"></script>
<script type="text/javascript" src="./js/Sort.js"></script>
</head>
<body>
<%@ include file="Top.jsp" %>
<table class="type03">
	<tr>
		<td colspan="5"><font class="thfont">��ǰ ���</font></td>
	</tr>
	<tr>
		<td colspan="5" class="right">
		<form method="post" name="psortForm">
			<select name="selsort" onchange="pselCk()">
				<option value="0">��ǰ����</option>
				<optgroup label="��ǰ��">
					<option value="nUp">��������</option>
					<option value="nDown">��������</option>
				</optgroup>
				<optgroup label="����">
					<option value="pUp">��������</option>
					<option value="pDown">��������</option>
				</optgroup>
				<optgroup label="�԰���">
					<option value="dUp">��������</option>
					<option value="dDown">��������</option>
				</optgroup>
			</select>
			<input type="hidden" name="sort" value="">
		</form>
		</td>
	</tr>
	<tr>
		<th>�̸�</th>
		<th>����</th>
		<th>���</th>
		<th>�԰���</th>
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
			//���ݿ� õ�������� ,�ֱ�
			java.text.DecimalFormat df = new java.text.DecimalFormat("###,###");
	%>
	<tr>
		<td><%=pb.getP_name() %></td>
		<td><%=df.format(pb.getP_price()) %>��</td>
		<td><%=pb.getP_stock()%>��</td>
		<td><%=pb.getP_date().substring(0,10) %></td>
		<td><a href="javascript:productDetail('<%=pb.getP_no() %>')">�󼼺���</a></td>
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