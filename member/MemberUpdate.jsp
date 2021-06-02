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
		<td colspan="2"><font class="thfont">ȸ������ ����</font></td>
	</tr>
	<tr>
		<th>���̵�</th>
		<td><%=rb.getMem_id() %></td>
	</tr>
	<tr>
		<th>�̸�</th>
		<td><input type="text" class="txt1" name="mem_name" value="<%=rb.getMem_name() %>"></td>
	</tr>
	<tr>
		<th>�������</th>
		<td><input type="text" class="txt1" name="mem_num1" maxlength="6" onkeyup="if(this.value.length==6)regForm.mem_email.focus()" value="<%=rb.getMem_num1() %>">
		</td>
	</tr>
	<tr>
		<th>�̸���</th>
		<td><input type="text" class="txt1" name="mem_email" value="<%=rb.getMem_email() %>"></td>
	</tr>
	<tr>
		<th>��ȭ��ȣ</th>
		<td><input type="text" class="txt3" name="mem_phone1" size="5" maxlength="3" onkeyup="if(this.value.length==3)regForm.mem_phone2.focus()" value="<%=rb.getMem_phone().substring(0,3) %>"> 
			- <input type="text" class="txt3" name="mem_phone2" size="5" maxlength="4" onkeyup="if(this.value.length==4)regForm.mem_phone3.focus()" value="<%=rb.getMem_phone().substring(4,8) %>"> 
			- <input type="text" class="txt3" name="mem_phone3" size="5" maxlength="4" value="<%=rb.getMem_phone().substring(9) %>">
		<input type="hidden" name="mem_phone">
		</td>
	</tr>
	<tr>
		<th>�����ȣ</th>
		<td><input type="text" class="txt2" name="mem_zipcode" readonly="readonly" value="<%=rb.getMem_zipcode() %>">
			<input type="hidden" name="zipCk" value="no">
			<input type="button" class="btn1" value="�����ȣ ã��" onclick="zipCheck()">
		</td>
	</tr>
	<tr>
		<th>�ּ�</th>
		<td><input type="text" class="txt1" name="mem_address" value="<%=rb.getMem_address() %>"></td>
	</tr>
	<tr>
		<th>����</th>
		<td>
			<select name="mem_job">
				<option value="<%=rb.getMem_job() %>"><%=rb.getMem_job() %></option>
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
			<input type="hidden" name="flag">
			<input type="button" class="btn1" value="ȸ������ ����" onclick="memUp()"> 
			<input type="button" class="btn1" value="�ڷ� ����" onclick="history.back()"> 
		</td>
	</tr>
</table>
</form>
<%@ include file="../Bottom.jsp" %>	
</body>
</html>