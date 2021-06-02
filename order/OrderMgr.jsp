<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.Vector, ch14.*" %>
<% 
String mem_id = (String)session.getAttribute("idKey"); 
if(mem_id != null && mem_id.equals("manager")){
request.setCharacterEncoding("euc-kr"); %>  
<jsp:useBean id="pMgr" class="ch14.ProductMgr"/>
<jsp:useBean id="oMgr" class="ch14.OrderMgr"/>
<jsp:useBean id="ls" class="ch14.ListSort"/>  
<%
//��� ����
String sort = request.getParameter("sort");
//out.print(sort);
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
		<td colspan="6"><font class="thfont">�ֹ� ��Ȳ</font></td>
	</tr>
	<tr>
		<td colspan="6" class="right">
		<a href="javascript:pMgr()">��ǰ ��Ȳ</a>
		&nbsp;
		<form method="post" name="osortForm">
			<select name="selsort" onchange="oselCk()">
				<option value="0">��ǰ����</option>
				<optgroup label="������">
					<option value="dUp">��������</option>
					<option value="dDown">��������</option>
				</optgroup>
				<optgroup label="���ż���">
					<option value="qUp">��������</option>
					<option value="qDown">��������</option>
				</optgroup>
				<optgroup label="�ֹ�����">
					<option value="sUp">��������</option>
					<option value="sDown">��������</option>
				</optgroup>
			</select>
			<input type="hidden" name="sort" value="">
		</form>
		</td>
	</tr>
	<tr>
		<th>�ֹ�<br>��ȣ</th>
		<th>������</th>
		<th>��ǰ��</th>
		<th>����<br>����</th>
		<th>������</th>
		<th>�ֹ�<br>����</th>
	</tr>
	<%
	Vector vlist = null;
	vlist = oMgr.getOrderList();
	if(sort == null || sort == "") vlist = oMgr.getOrderList();
	else vlist = ls.OrderSortList(sort); 
	
	if(vlist.size() == 0){
	%>
	<tr>
		<td colspan="6">�ֹ� ������ �����ϴ�.</td>
	</tr>
	<%
	} else{
		for(int i=0; i<vlist.size(); i++){
			OrderBean ob = (OrderBean)vlist.get(i);
			String no = Integer.toString(ob.getP_no());
			ProductBean pb = pMgr.getProduct(no);
			
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
		<td><%=ob.getM_id() %></td>
		<td><a href="javascript:oDtail('<%=ob.getO_no() %>')"><%=pb.getP_name() %></a></td>
		<td><%=ob.getO_quantity() %>��</td>
		<td><%=ob.getO_date().substring(0,10) %></td>
		<td><%=state%></td>
	</tr>
	<%		
		}//for
	}//else
	%>
</table>
<%@ include file="../Bottom.jsp" %>
<form name="detail" method="post" action="OrderDetail.jsp">
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