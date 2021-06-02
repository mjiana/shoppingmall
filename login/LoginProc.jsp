<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<title>Simple Shopping mall</title>    
<!-- DAO 불러오기 -->    
<jsp:useBean id="memMgr" class="ch14.MemberMgr"/>
<%
//Login.jsp에서 넘어온 폼 값 변수에 저장
String mem_id = request.getParameter("mem_id");
String mem_passwd = request.getParameter("mem_passwd");
//DAO 실행 및 반환값 변수 저장
boolean loginCheck = memMgr.loginCheck(mem_id, mem_passwd);

if(loginCheck){ //loginCheck가 true인 경우
	//id값으로 세션 설정 후 Login.jsp로 이동
	session.setAttribute("idKey", mem_id);
	response.sendRedirect("Login.jsp");
}else{ //false인경우
	//로그인 에러페이지로 이동
	//response.sendRedirect("LogError.jsp");
%>
<script type="text/javascript">
	alert("로그인에 실패하였습니다.");
	location.href="Login.jsp";
</script>
<%
}
%>