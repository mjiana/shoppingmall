<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<title>Simple Shopping mall</title>    
<!-- DAO �ҷ����� -->    
<jsp:useBean id="memMgr" class="ch14.MemberMgr"/>
<%
//Login.jsp���� �Ѿ�� �� �� ������ ����
String mem_id = request.getParameter("mem_id");
String mem_passwd = request.getParameter("mem_passwd");
//DAO ���� �� ��ȯ�� ���� ����
boolean loginCheck = memMgr.loginCheck(mem_id, mem_passwd);

if(loginCheck){ //loginCheck�� true�� ���
	//id������ ���� ���� �� Login.jsp�� �̵�
	session.setAttribute("idKey", mem_id);
	response.sendRedirect("Login.jsp");
}else{ //false�ΰ��
	//�α��� ������������ �̵�
	//response.sendRedirect("LogError.jsp");
%>
<script type="text/javascript">
	alert("�α��ο� �����Ͽ����ϴ�.");
	location.href="Login.jsp";
</script>
<%
}
%>