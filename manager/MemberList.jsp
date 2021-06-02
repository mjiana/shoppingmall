<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, ch14.*" %>
<jsp:useBean id="members" class="ch14.MemberMgr"/>
<% 
String mem_id = (String)session.getAttribute("idKey"); 
if(mem_id != null && mem_id.equals("manager")){
List mList = members.memberList();
int mcnt = mList.size();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Simple Shopping mall Manager</title>
<link rel="stylesheet" type="text/css" href="../style/shop.css">
</head>
<body>
<table class="type03">
	<tr>
		<td colspan="3"><b>ȸ�� ���</b></td>
	</tr>
	<tr>
		<th>��ȣ</th>
		<th>���̵�</th>
		<th>�̸�</th>
	</tr>
	<%
		for(int i=0; i<mcnt; i++){
			RegisterBean rb = (RegisterBean)mList.get(i);
			String id = rb.getMem_id();
			String name = rb.getMem_name();
			//String date = rb.get;
	%>
	<tr>
		<td><%=i+1 %></td>
		<td><%=id %></td>
		<td><%=name %></td>
	</tr>
	<%
		}
	%>
</table>
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