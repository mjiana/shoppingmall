<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("euc-kr"); 
String mem_id = (String)session.getAttribute("idKey"); %>
<jsp:useBean id="memMgr" class="ch14.MemberMgr"/>
<jsp:useBean id="regBean" class="ch14.RegisterBean"/>
<jsp:setProperty property="*" name="regBean"/>
<% boolean flag = memMgr.memberInsert(regBean); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Simple Shopping mall</title>
</head>
<body>
<%
if(flag){
%>
	<script type="text/javascript">
	alert("ȸ�������� �Ϸ�Ǿ����ϴ�.\n�α��� �������� �̵��մϴ�.");
	location.href="../login/Login.jsp";
	</script>

<%
} else{
%>
<script type="text/javascript">
	alert("�ٽ� �Է����ּ���.");
	location.href="Register.jsp";
</script>
<%
}
%>
</body>
</html>