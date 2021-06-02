<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="memMgr" class="ch14.MemberMgr" />
<% 
String mem_id = request.getParameter("mem_id");
boolean check = memMgr.checkId(mem_id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Simple Shopping mall</title>
<link rel="stylesheet" type="text/css" href="../style/shop.css">
<script type="text/javascript">

function yesId(){
	//alert("���̵� ����մϴ�.");
	opener.document.regForm.mem_id.readOnly = true;
	opener.document.regForm.mem_passwd.focus();
	//��Ŀ���� �������� �����ٵ�
	self.close();
}
function noId(){
	//alert("�ۼ��� ���̵� �ʱ�ȭ �˴ϴ�.");
	opener.document.regForm.mem_id.readOnly = false;
	opener.document.regForm.mem_id.value="";
	opener.document.regForm.mem_id.focus();
	self.close();
}
</script>
</head>
<body>
<br>
<table class="type01">
	<tr>
		<th><%=mem_id %></th>
	</tr>
<%
if(check) {
%>
	<tr>
		<td>�̹� �����ϴ� ID�Դϴ�.</td>
	</tr>
	<tr>
		<td><input type="button" class="btn1" value="�ݱ�" onclick="self.close()"></td>
	</tr>
<%
}
else {
%>
	<tr>
		<td>��밡���� ID�Դϴ�.<br>����Ͻðڽ��ϱ�?</td>
	</tr>
	<tr>
		<td>
			<input type="button" class="btn1" value="yes" onclick="yesId()">
			<input type="button" class="btn1" value="no" onclick="noId()">
		</td>
	</tr>
<%
}
%>
</table>
</body>
</html>