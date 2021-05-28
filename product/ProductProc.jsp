<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("euc-kr"); %>    
<jsp:useBean id="proMgr" class="ch14.ProductMgr"/>
<title>Simple Shopping mall Manager</title>
<%
String flag = request.getParameter("flag");
boolean result = false;

if(flag.equals("insert")){
	result = proMgr.insertProduct(request);
}else if(flag.equals("update")){
	//result = proMgr.
}else if(flag.equals("delete")){
	//result = proMgr.
}else{
	response.sendRedirect("ProductMgr.jsp");
}

if(result){
%>
<script type="text/javascript">
	alert("처리에 성공하였습니다.");
	location.href="ProductMgr.jsp";
</script>
<%
} else{
%>
<script type="text/javascript">
	alert("처리에 실패하였습니다.");
	location.href="ProductMgr.jsp";
</script>
<%
}
%>