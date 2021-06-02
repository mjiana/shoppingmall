<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="ch14.*" %>
<title>Simple Shopping mall</title>    
<% request.setCharacterEncoding("euc-kr"); %> 
<jsp:useBean id="rb" class="ch14.RegisterBean"/> 
<jsp:setProperty property="*" name="rb"/>
<jsp:useBean id="memMgr" class="ch14.MemberMgr"/> 
<%
String mem_id = (String)session.getAttribute("idKey");
String flag = request.getParameter("flag");
boolean result = false;
if(flag.equals("update")){
	rb.setMem_id(mem_id);
	rb.setMem_name(request.getParameter("mem_name"));
	rb.setMem_num1(request.getParameter("mem_num1"));
	rb.setMem_num2(request.getParameter("mem_num2"));
	rb.setMem_email(request.getParameter("mem_email"));
	String mem_phone = request.getParameter("mem_phone1")+"-"+
			request.getParameter("mem_phone2")+"-"+request.getParameter("mem_phone3");
	rb.setMem_phone(mem_phone);
	rb.setMem_zipcode(request.getParameter("mem_zipcode"));
	rb.setMem_address(request.getParameter("mem_address"));
	rb.setMem_job(request.getParameter("mem_job"));
	result = memMgr.memberUpdate(rb);
	if(result){
%>
		<script type="text/javascript">
			 alert("수정되었습니다.");
			 location.href="MemberView.jsp";
		</script>
<%
	}else{
%>
		<script type="text/javascript">
			 alert("수정에 실패하였습니다.");
			 location.href="MemberView.jsp";
		</script>
<%
	}
}
%>