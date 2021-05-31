<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.Vector, ch14.*" %>
<% request.setCharacterEncoding("euc-kr"); %>    
<jsp:useBean id="proMgr" class="ch14.ProductMgr"/>
<jsp:useBean id="ls" class="ch14.ListSort"/>  
<%
//��� ����
String sort = request.getParameter("sort");
//String sort1 = request.getParameter("sort1");
//String sort2 = request.getParameter("sort2");
//out.print(sort+"/"+sort1+"/"+sort2);
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
<table class="type03">
	<tr>
		<td colspan="5"><font class="thfont">��ǰ ���</font></td>
	</tr>
	<tr>
		<td colspan="5" class="right">
		<form method="post" name="sortForm">
			<select name="selsort" onchange="selectCk()">
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
			<%-- 21.05.31 select name="selsort" ���� ����, ���߿� �ΰ��� ����� ���� �غ���
			<select name="sort1" onchange="sort1Ck()" >
				<option value="0">�����׸�</option>
				<option value="p_name" <%=sort1!=null&&sort1.equals("p_name") ? "selected" : "" %>>��ǰ��</option>
				<option value="p_price" <%=sort1!=null&&sort1.equals("p_price") ? "selected" : "" %>>����</option>
				<option value="p_date" <%=sort1!=null&&sort1.equals("p_date") ? "selected" : "" %>>��¥</option>
			</select>
			<select name="sort2" onchange="sortCk()">
				<option value="0">���ļ���</option>
				<option value="asc" <%=sort2!=null&&sort2.equals("asc") ? "selected" : "" %>>��������</option>
				<option value="desc" <%=sort2!=null&&sort2.equals("desc") ? "selected" : "" %>>��������</option>
			</select> --%>
			<input type="hidden" name="sort" value="">
		</form>
		</td>
	</tr>
	<tr>
		<th>no</th>
		<th>�̸�</th>
		<th>����</th>
		<th>���</th>
		<th>�԰���</th>
	</tr>
	<%
	Vector vlist = null;
	if(sort == null || sort == "") vlist = proMgr.getProductList();
	else vlist = ls.ProductSortList(sort); 
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
		<td><%=pb.getP_no() %></td>
		<td><a href="javascript:pDtail('<%=pb.getP_no() %>')"><%=pb.getP_name() %></a></td>
		<td><%=df.format(pb.getP_price()) %>��</td>
		<td><%=pb.getP_stock()%>��</td>
		<td><%=pb.getP_date().substring(0,10) %></td>
	</tr>
	<%		
		}//for
	}//else
	%>
	<tr>
		<td colspan="5">
			<input type="button" class="btn1" value="��ǰ���" onclick="pInsert()">
		</td>
	</tr>
	<!-- 21.05.31 �˻����� ������ �Ǹ� �����
	<tr>
		<td colspan="5">
			<form method="post" >
				<select name="find">
					<option value="name">��ǰ��</option>
					<option value="date">�԰���</option>
				</select>
				<input type="text" name="search">
				<input type="button" class="btn1" value="��ǰ�˻�" onclick="pSelect()">
			</form>
		</td>
	</tr>
	 -->
</table>

<%@ include file="../Bottom.jsp" %>
<form name="detail" method="post" action="ProductDetail.jsp">
	<input type="hidden" name="no">
</form>
</body>
</html>