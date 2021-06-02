<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="memMgr" class="ch14.MemberMgr" />
<% 
String mem_id = request.getParameter("mem_id");
boolean check = memMgr.checkId(mem_id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Simple Shopping mall</title>
<link rel="stylesheet" type="text/css" href="../style/shop.css">
<script type="text/javascript">

function yesId(){
	//alert("아이디를 사용합니다.");
	opener.document.regForm.mem_id.readOnly = true;
	opener.document.regForm.mem_passwd.focus();
	//포커스도 안잡히면 좋을텐데
	self.close();
}
function noId(){
	//alert("작성한 아이디가 초기화 됩니다.");
	opener.document.regForm.mem_id.readOnly = false;
	opener.document.regForm.mem_id.value="";
	opener.document.regForm.mem_id.focus();
	self.close();
}
</script>
</head>
<body>
<br>
<table class="type01">
	<tr>
		<th><%=mem_id %></th>
	</tr>
<%
if(check) {
%>
	<tr>
		<td>이미 존재하는 ID입니다.</td>
	</tr>
	<tr>
		<td><input type="button" class="btn1" value="닫기" onclick="self.close()"></td>
	</tr>
<%
}
else {
%>
	<tr>
		<td>사용가능한 ID입니다.<br>사용하시겠습니까?</td>
	</tr>
	<tr>
		<td>
			<input type="button" class="btn1" value="yes" onclick="yesId()">
			<input type="button" class="btn1" value="no" onclick="noId()">
		</td>
	</tr>
<%
}
%>
</table>
</body>
</html>