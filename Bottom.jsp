<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>       
<br> 
<table>
	<tr>
		<td><b>Welcome Simple Shopping Mall</b></td>
		<%
		//String mem_id = (String)session.getAttribute("idkey");
		if(mem_id != null && mem_id.equals("manager")){
		%>
		<td><b><a href="<%=application.getContextPath() %>/manager/Index.jsp">관리자페이지</a></b></td>
		<%
		} 
		%>
	</tr>
</table>