<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% String mem_id = (String)session.getAttribute("idKey");  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Simple Shopping mall</title>
<link rel="stylesheet" type="text/css" href="../style/shop.css">
<script type="text/javascript" src="../js/Reg_script.js"></script>
</head>
<body onload="regForm.mem_id.focus()">
<%@ include file="../Top.jsp" %>
<form name="regForm" method="post" action="RegisterProc.jsp"> 
<table class="type02">
	<tr>
		<td colspan="2"><font class="thfont">회원가입</font></td>
	</tr>
	<tr>
		<th>아이디</th>
		<td>
			<input type="text" class="txt1" name="mem_id" id="mem_id">
			<input type="hidden" name="idCk" value="no">
			<input type="button" class="btn1" value="ID중복확인" onclick="idCheck(this.form.mem_id.value)">
		</td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td><input type="password" class="txt1" name="mem_passwd"></td>
	</tr>
	<tr>
		<th>비밀번호 확인</th>
		<td><input type="password" class="txt1" name="mem_repasswd"></td>
	</tr>
	<tr>
		<th>이름</th>
		<td><input type="text" class="txt1" name="mem_name"></td>
	</tr>
	<tr>
		<th>생년월일</th>
		<td><input type="text" class="txt1" name="mem_num1" maxlength="6" onkeyup="if(this.value.length==6)regForm.mem_email.focus()"></td>
	</tr>
	<tr>
		<th>이메일</th>
		<td><input type="text" class="txt1" name="mem_email"></td>
	</tr>
	<tr>
		<th>전화번호</th>
		<td>
			<input type="hidden" name="mem_phone">
			<input type="text" class="txt3" name="mem_phone1" size="5" maxlength="3" onkeyup="if(this.value.length==3)regForm.mem_phone2.focus()"> 
			- <input type="text" class="txt3" name="mem_phone2" size="5" maxlength="4" onkeyup="if(this.value.length==4)regForm.mem_phone3.focus()"> 
			- <input type="text" class="txt3" name="mem_phone3" size="5" maxlength="4">
		</td>
	</tr>
	<tr>
		<th>우편번호</th>
		<td>
			<input type="text" class="txt2" name="mem_zipcode" readonly="readonly">
			<input type="hidden" name="zipCk" value="no">
			<input type="button" class="btn1" value="우편번호 찾기" onclick="zipCheck()">
		</td>
	</tr>
	<tr>
		<th>주소</th>
		<td><input type="text" class="txt1" name="mem_address"></td>
	</tr>
	<tr>
		<th>직업</th>
		<td>
			<select name="mem_job">
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
			<input type="button" class="btn1" value="회원가입" onclick="inputCheck()">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="reset" class="btn1" value="다시쓰기">
		</td>
	</tr>
</table>
</form>
</body>
</html>