<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
String mem_id = (String)session.getAttribute("idKey"); 
if(mem_id != null && mem_id.equals("manager")){
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Simple Shopping mall Manager</title>
<link rel="stylesheet" type="text/css" href="../style/shop.css">
</head>
<body>
<%@ include file="../Top.jsp" %>
<table class="type03">
	<tr>
		<td colspan="3"><font class="thfont">������������</font></td>
	</tr>
	<tr>
		<th>��ǰ��Ȳ</th>
		<th>�ֹ���Ȳ</th>
		<th>ȸ����Ȳ</th>
	</tr>
	<tr>
		<td><input type="button" class="btn1" value="����" onclick="location.href='../product/ProductMgr.jsp'"></td>
		<td><input type="button" class="btn1" value="����" onclick="location.href='../order/OrderMgr.jsp'"></td>
		<td><input type="button" class="btn1" value="����" onclick="location.href='MemberList.jsp'"></td>
	</tr>
</table>
<%@ include file="../Bottom.jsp" %>
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