/**
 * ���ڵ� �̸� �ٲٱ�  UTF-8 -> EUC-KR
 */
function idCheck(id){
	var df = document.regForm;
	if(id == ""){
		alert("���̵� �ߺ�Ȯ���� ���ּ���");
		df.mem_id.focus();
	}else{
		df.idCk.value="yes";
		//document.getElementById('mem_id').readOnly = true;
		url = "IdCheck.jsp?mem_id="+id;
		window.open(url,"IDcheck","width=350,height=200");
	}
}
function zipCheck(){
	document.regForm.zipCk.value="yes";
	url = "ZipCheck.jsp?check=y";
	window.open(url,"ZipCheck","toolbar=no,width=450,height=500,directories=no,status=yes,scrollbars=yes,menubar=no");
}
function inputCheck(){
	var df = document.regForm;
	if(df.mem_id.value==""){
		alert("���̵� �Է����ּ���");
		df.mem_id.focus();
		return;
	}
	if(df.idCk.value == "no"){
		alert("���̵� �ߺ�Ȯ���� �������ּ���");
		df.mem_id.focus();
		return;
	}
	if(df.mem_passwd.value==""){
		alert("��й�ȣ�� �Է����ּ���");
		df.mem_passwd.focus();
		return;
	}
	if(df.mem_repasswd.value==""){
		alert("��й�ȣ Ȯ���� �Է����ּ���");
		df.mem_repasswd.focus();
		return;
	}
	if(df.mem_passwd.value != df.mem_repasswd.value){
		alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�");
		df.mem_repasswd.focus();
		return;
	}
	if(df.mem_name.value==""){
		alert("�̸��� �Է����ּ���");
		df.mem_name.focus();
		return;
	}
	/*if(df.mem_num1.value==""){
		alert("�ֹι�ȣ ���ڸ��� �Է����ּ���");
		df.mem_num1.focus();
		return;
	}
	if(df.mem_num2.value==""){
		alert("�ֹι�ȣ ���ڸ��� �Է����ּ���");
		df.mem_num2.focus();
		return;
	}*/
	if(df.mem_email.value==""){
		alert("�̸����� �Է����ּ���");
		df.mem_email.focus();
		return;
	}
	var str = df.mem_email.value;
	var atPos = str.indexOf('@');
	var atLastPos = str.lastIndexOf('@');
	var dotPos = str.indexOf('.'); // .
	var spacePos = str.indexOf(' '); // ����
	var commaPos = str.indexOf(','); // ,
	var eMailSize = str.length;
	
	//���϶� ���({}���� ����) �����϶� return
	if(atPos>1 && atPos==atLastPos && dotPos>3 && spacePos==-1 &&
		commaPos==-1 && atPos+1<dotPos && dotPos+1<eMailSize);
	else{
		alert("�̸��� �ּ������� �߸��Ǿ����ϴ�.\n�ٽ� �Է����ּ���");
		df.mem_email.focus();
		return;
	}
	if(df.mem_phone1.value==""){
		df.mem_phone1.value="";
		alert("��ȭ��ȣ�� �Է����ּ���");
		df.mem_phone1.focus();
		return;
	}
	if(df.mem_phone2.value==""){
		df.mem_phone2.value="";
		alert("��ȭ��ȣ�� �Է����ּ���");
		df.mem_phone2.focus();
		return;
	}
	if(df.mem_phone3.value==""){
		df.mem_phone3.value="";
		alert("��ȭ��ȣ�� �Է����ּ���");
		df.mem_phone3.focus();
		return;
	}
	if(df.mem_phone1.value !="" && df.mem_phone2.value!="" && df.mem_phone3.value!=""){
		df.mem_phone.value = df.mem_phone1.value+"-"+df.mem_phone2.value+"-"+df.mem_phone3.value;
		//alert(df.mem_phone.value);
	}
	if(df.zipCk.value == "no"){
		alert("�����ȣ ã�� ��ư�� ���� �����ȣ�� ã���ּ���");
		//df.mem_zipcode.focus();
		return;
	}
	if(df.mem_job.value=="0"){
		alert("������ �Է����ּ���");
		df.mem_job.focus();
		return;
	}
	document.regForm.submit();
}
////////////////////
// login Page js //
function logCheck(){
	document.location = "../login/Logout.jsp";
}
function loginCheck(){
	var df = document.login;
	if(df.mem_id.value==""){
		alert("���̵� �Է����ּ���");
		df.mem_id.focus();
		return;
	}
	if(df.mem_passwd.value==""){
		alert("��й�ȣ�� �Է����ּ���");
		df.mem_passwd.focus();
		return;
	}
	df.submit();
}
function memberReg(){
	document.location = "../register/Register.jsp";
}
////////////////////
// My Page js //
function viewPage(){
	document.location = "../member/MemberView.jsp";
}
////////////////////
function memUp(){
	//inputCheck();
	document.memform.flag.value = "update";
	document.memform.submit();
}
