<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.Vector, ch14.*, java.text.DecimalFormat" %>
<% request.setCharacterEncoding("euc-kr"); %>  
<jsp:useBean id="pMgr" class="ch14.ProductMgr"/>
<jsp:useBean id="oMgr" class="ch14.OrderMgr"/>
<%
OrderBean ob = oMgr.getOrderDetail(Integer.parseInt(request.getParameter("no")));
ProductBean pb = pMgr.getProduct(Integer.toString(ob.getP_no()));
//õ�������� ,�ֱ�
DecimalFormat df = new DecimalFormat("###,###");
//��ǰ ����
String price = df.format(pb.getP_price());
//�ֹ� �ݾ�
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
		<td colspan="2"><font class="thfont">�ֹ����� �󼼺���</font></td>
	</tr>
	<tr>
		<th>�����̵�</th>
		<td><%=ob.getM_id() %></td>
	</tr>
	<tr>
		<th>�ֹ���ȣ</th>
		<td><%=ob.getO_no() %></td>
	</tr>
	<tr>
		<th>��ǰ��ȣ</th>
		<td><%=pb.getP_no() %></td>
	</tr>
	<tr>
		<th>��ǰ�̸�</th>
		<td>
			<img src="../images/<%=pb.getP_image() %>" width="50" height="50" class="img2" alt="��ǰ �̹���">
			<%=pb.getP_name() %>
		</td>
	</tr>
	<tr>
		<th>��ǰ����</th>
		<td><%=price %>��</td>
	</tr>
	<tr>
		<th>�ֹ�����</th>
		<td><%=ob.getO_quantity() %>��</td>
	</tr>
	<tr>
		<th>������</th>
		<td><%=pb.getP_stock() %>��</td>
	</tr>
	<tr>
		<th>�ֹ���</th>
		<td><%=ob.getO_date().substring(0, 10) %></td>
	</tr>
	<tr>
		<th>�ֹ��ݾ�</th>
		<td><%=totalPrice %>��</td>
	</tr>
	<tr>
		<th>�ֹ�����</th>
		<td>
			<select name="state">
				<option value="1">������</option>
				<option value="2">�����Ϸ�</option>
				<option value="3">�Ա�Ȯ��</option>
				<option value="4">����غ�</option>
				<option value="5">�����</option>
				<option value="6">��ۿϷ�</option>
			</select>
			<script type="text/javascript">
				document.order.state.value = <%=ob.getO_state()%>;
			</script>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="button" class="btn1" value="�����ϱ�" onclick="oUpdate(this.form)">
			<input type="button" class="btn1" value="�����ϱ�" onclick="oDelete(this.form)">
			<input type="button" class="btn1" value="�������" onclick="oMgr()">
		</td>
	</tr>
</table>
<input type="hidden" name="no" value="<%=ob.getO_no()%>">
<input type="hidden" name="flag">
</form>
<%@ include file="../Bottom.jsp" %>
</body>
</html>