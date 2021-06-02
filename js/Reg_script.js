/**
 * 인코딩 미리 바꾸기  UTF-8 -> EUC-KR
 */
function idCheck(id){
	var df = document.regForm;
	if(id == ""){
		alert("아이디 중복확인을 해주세요");
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
		alert("아이디를 입력해주세요");
		df.mem_id.focus();
		return;
	}
	if(df.idCk.value == "no"){
		alert("아이디 중복확인을 진행해주세요");
		df.mem_id.focus();
		return;
	}
	if(df.mem_passwd.value==""){
		alert("비밀번호를 입력해주세요");
		df.mem_passwd.focus();
		return;
	}
	if(df.mem_repasswd.value==""){
		alert("비밀번호 확인을 입력해주세요");
		df.mem_repasswd.focus();
		return;
	}
	if(df.mem_passwd.value != df.mem_repasswd.value){
		alert("비밀번호가 일치하지 않습니다");
		df.mem_repasswd.focus();
		return;
	}
	if(df.mem_name.value==""){
		alert("이름을 입력해주세요");
		df.mem_name.focus();
		return;
	}
	/*if(df.mem_num1.value==""){
		alert("주민번호 앞자리를 입력해주세요");
		df.mem_num1.focus();
		return;
	}
	if(df.mem_num2.value==""){
		alert("주민번호 뒷자리를 입력해주세요");
		df.mem_num2.focus();
		return;
	}*/
	if(df.mem_email.value==""){
		alert("이메일을 입력해주세요");
		df.mem_email.focus();
		return;
	}
	var str = df.mem_email.value;
	var atPos = str.indexOf('@');
	var atLastPos = str.lastIndexOf('@');
	var dotPos = str.indexOf('.'); // .
	var spacePos = str.indexOf(' '); // 공백
	var commaPos = str.indexOf(','); // ,
	var eMailSize = str.length;
	
	//참일때 통과({}블럭이 없다) 거짓일때 return
	if(atPos>1 && atPos==atLastPos && dotPos>3 && spacePos==-1 &&
		commaPos==-1 && atPos+1<dotPos && dotPos+1<eMailSize);
	else{
		alert("이메일 주소형식이 잘못되었습니다.\n다시 입력해주세요");
		df.mem_email.focus();
		return;
	}
	if(df.mem_phone1.value==""){
		df.mem_phone1.value="";
		alert("전화번호를 입력해주세요");
		df.mem_phone1.focus();
		return;
	}
	if(df.mem_phone2.value==""){
		df.mem_phone2.value="";
		alert("전화번호를 입력해주세요");
		df.mem_phone2.focus();
		return;
	}
	if(df.mem_phone3.value==""){
		df.mem_phone3.value="";
		alert("전화번호를 입력해주세요");
		df.mem_phone3.focus();
		return;
	}
	if(df.mem_phone1.value !="" && df.mem_phone2.value!="" && df.mem_phone3.value!=""){
		df.mem_phone.value = df.mem_phone1.value+"-"+df.mem_phone2.value+"-"+df.mem_phone3.value;
		//alert(df.mem_phone.value);
	}
	if(df.zipCk.value == "no"){
		alert("우편번호 찾기 버튼을 눌러 우편번호를 찾아주세요");
		//df.mem_zipcode.focus();
		return;
	}
	if(df.mem_job.value=="0"){
		alert("직업을 입력해주세요");
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
		alert("아이디를 입력해주세요");
		df.mem_id.focus();
		return;
	}
	if(df.mem_passwd.value==""){
		alert("비밀번호를 입력해주세요");
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
