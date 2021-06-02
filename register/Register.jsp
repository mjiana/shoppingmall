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
		<td colspan="2"><font class="thfont">ȸ������</font></td>
	</tr>
	<tr>
		<th>���̵�</th>
		<td>
			<input type="text" class="txt1" name="mem_id" id="mem_id">
			<input type="hidden" name="idCk" value="no">
			<input type="button" class="btn1" value="ID�ߺ�Ȯ��" onclick="idCheck(this.form.mem_id.value)">
		</td>
	</tr>
	<tr>
		<th>��й�ȣ</th>
		<td><input type="password" class="txt1" name="mem_passwd"></td>
	</tr>
	<tr>
		<th>��й�ȣ Ȯ��</th>
		<td><input type="password" class="txt1" name="mem_repasswd"></td>
	</tr>
	<tr>
		<th>�̸�</th>
		<td><input type="text" class="txt1" name="mem_name"></td>
	</tr>
	<tr>
		<th>�������</th>
		<td><input type="text" class="txt1" name="mem_num1" maxlength="6" onkeyup="if(this.value.length==6)regForm.mem_email.focus()"></td>
	</tr>
	<tr>
		<th>�̸���</th>
		<td><input type="text" class="txt1" name="mem_email"></td>
	</tr>
	<tr>
		<th>��ȭ��ȣ</th>
		<td>
			<input type="hidden" name="mem_phone">
			<input type="text" class="txt3" name="mem_phone1" size="5" maxlength="3" onkeyup="if(this.value.length==3)regForm.mem_phone2.focus()"> 
			- <input type="text" class="txt3" name="mem_phone2" size="5" maxlength="4" onkeyup="if(this.value.length==4)regForm.mem_phone3.focus()"> 
			- <input type="text" class="txt3" name="mem_phone3" size="5" maxlength="4">
		</td>
	</tr>
	<tr>
		<th>�����ȣ</th>
		<td>
			<input type="text" class="txt2" name="mem_zipcode" readonly="readonly">
			<input type="hidden" name="zipCk" value="no">
			<input type="button" class="btn1" value="�����ȣ ã��" onclick="zipCheck()">
		</td>
	</tr>
	<tr>
		<th>�ּ�</th>
		<td><input type="text" class="txt1" name="mem_address"></td>
	</tr>
	<tr>
		<th>����</th>
		<td>
			<select name="mem_job">
				<option value="0">�����ϼ���</option>
				<option value="ȸ���">ȸ���</option>
				<option value="����������">����������</option>
				<option value="�����л�">�����л�</option>
				<option value="�Ϲ��ڿ���">�Ϲ��ڿ���</option>
				<option value="������">������</option>
				<option value="�Ƿ���">�Ƿ���</option>
				<option value="������">������</option>
				<option value="����,���,������">����,���,������</option>
				<option value="��,��,����,������">��,��,����,������</option>
				<option value="�ֺ�">�ֺ�</option>
				<option value="����">����</option>
				<option value="��Ÿ">��Ÿ</option>
			</select>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="button" class="btn1" value="ȸ������" onclick="inputCheck()">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="reset" class="btn1" value="�ٽþ���">
		</td>
	</tr>
</table>
</form>
</body>
</html>