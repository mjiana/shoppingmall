<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, ch14.* "%>
<jsp:useBean id="memMgr" class="ch14.MemberMgr"/>
<% 
String mem_id = (String)session.getAttribute("idKey");
if(mem_id == null)response.sendRedirect("Login.jsp");
RegisterBean rb = memMgr.memberView(mem_id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Simple Shopping mall</title>
<link rel="stylesheet" type="text/css" href="../style/shop.css">
<script type="text/javascript" src="../js/Reg_script.js"></script>
</head>
<body>
<%@ include file="../Top.jsp" %>
<form method="post" name="memform" action="MemberProc.jsp">
<table class="type02">
	<tr>
		<td colspan="2"><font class="thfont">회원정보 수정</font></td>
	</tr>
	<tr>
		<th>아이디</th>
		<td><%=rb.getMem_id() %></td>
	</tr>
	<tr>
		<th>이름</th>
		<td><input type="text" class="txt1" name="mem_name" value="<%=rb.getMem_name() %>"></td>
	</tr>
	<tr>
		<th>생년월일</th>
		<td><input type="text" class="txt1" name="mem_num1" maxlength="6" onkeyup="if(this.value.length==6)regForm.mem_email.focus()" value="<%=rb.getMem_num1() %>">
		</td>
	</tr>
	<tr>
		<th>이메일</th>
		<td><input type="text" class="txt1" name="mem_email" value="<%=rb.getMem_email() %>"></td>
	</tr>
	<tr>
		<th>전화번호</th>
		<td><input type="text" class="txt3" name="mem_phone1" size="5" maxlength="3" onkeyup="if(this.value.length==3)regForm.mem_phone2.focus()" value="<%=rb.getMem_phone().substring(0,3) %>"> 
			- <input type="text" class="txt3" name="mem_phone2" size="5" maxlength="4" onkeyup="if(this.value.length==4)regForm.mem_phone3.focus()" value="<%=rb.getMem_phone().substring(4,8) %>"> 
			- <input type="text" class="txt3" name="mem_phone3" size="5" maxlength="4" value="<%=rb.getMem_phone().substring(9) %>">
		<input type="hidden" name="mem_phone">
		</td>
	</tr>
	<tr>
		<th>우편번호</th>
		<td><input type="text" class="txt2" name="mem_zipcode" readonly="readonly" value="<%=rb.getMem_zipcode() %>">
			<input type="hidden" name="zipCk" value="no">
			<input type="button" class="btn1" value="우편번호 찾기" onclick="zipCheck()">
		</td>
	</tr>
	<tr>
		<th>주소</th>
		<td><input type="text" class="txt1" name="mem_address" value="<%=rb.getMem_address() %>"></td>
	</tr>
	<tr>
		<th>직업</th>
		<td>
			<select name="mem_job">
				<option value="<%=rb.getMem_job() %>"><%=rb.getMem_job() %></option>
				<option value="0">선택하세요</option>
				<option value="회사원">회사원</option>
				<option value="연구전문직">연구전문직</option>
				<option value="교수학생">교수학생</option>
				<option value="일반자영업">일반자영업</option>
				<option value="공무원">공무원</option>
				<option value="의료인">의료인</option>
				<option value="법조인">법조인</option>
				<option value="종교,언론,예술인">종교,언론,예술인</option>
				<option value="농,축,수산,광업인">농,축,수산,광업인</option>
				<option value="주부">주부</option>
				<option value="무직">무직</option>
				<option value="기타">기타</option>
			</select>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="hidden" name="flag">
			<input type="button" class="btn1" value="회원정보 수정" onclick="memUp()"> 
			<input type="button" class="btn1" value="뒤로 가기" onclick="history.back()"> 
		</td>
	</tr>
</table>
</form>
<%@ include file="../Bottom.jsp" %>	
</body>
</html>