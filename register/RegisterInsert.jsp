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
	alert("회원가입이 완료되었습니다.\n로그인 페이지로 이동합니다.");
	location.href="../login/Login.jsp";
	</script>

<%
} else{
%>
<script type="text/javascript">
	alert("다시 입력해주세요.");
	location.href="Register.jsp";
</script>
<%
}
%>
</body>
</html>