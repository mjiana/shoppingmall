<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("euc-kr"); %>    
<jsp:useBean id="oMgr" class="ch14.OrderMgr"/>
<title>Simple Shopping mall Manager</title>
<%
String flag = request.getParameter("flag");
String no = request.getParameter("no");
String state = request.getParameter("state");
//out.print(state);
boolean result = false;

if(flag.equals("update")){
	result = oMgr.updateOrder(no, state);
}else if(flag.equals("delete")){
	result = oMgr.deleteOrder(no);
}else{
	response.sendRedirect("OrderMgr.jsp");
}

if(result){
%>
<script type="text/javascript">
	alert("처리에 성공하였습니다.");
	location.href="OrderMgr.jsp";
</script>
<%
} else{
%>
<script type="text/javascript">
	alert("처리에 실패하였습니다.");
	location.href="OrderMgr.jsp";
</script>
<%
}
%>