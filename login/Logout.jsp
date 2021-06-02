<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<title>Simple Shopping mall</title>
<% session.invalidate(); %>
<script type="text/javascript">
alert("로그아웃 되었습니다.");
location.href = "Login.jsp";
</script>