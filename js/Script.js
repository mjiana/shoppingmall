/**
 * 
 */
//js �����׽�Ʈ
function test(){
	alert("test");
}
////////////////////////////////////////////////////////////////
//���� ȸ������ �Լ��� ��ĥ ��
function productDetail(no){
	document.detail.no.value = no;
	document.detail.submit();
}
function cartUpdate(form){
	form.flag.value="update";
	form.submit();
}
function cartDelete(form){
	form.flag.value="delete";
	form.submit();
}
////////////////////////////////////////////////////////////////
///// PRODUCT ///// 
//ProductInsert.jsp
function productCk(){
	var pf = document.pform;
	
	if(pf.name.value==""){
		alert("��ǰ���� �Է����ּ���");
		pf.name.focus();
		return;
	}
	if(pf.price.value==""){
		alert("��ǰ������ �Է����ּ���");
		pf.price.focus();
		return;
	}
	if(pf.detail.value==""){
		alert("��ǰ������ �Է����ּ���");
		pf.detail.focus();
		return;
	}
	if(pf.stock.value==""){
		alert("��ǰ������ �Է����ּ���");
		pf.stock.focus();
		return;
	}
	pf.submit();
}

//ProductMgr.jsp
function pDtail(no){
	document.detail.no.value=no;
	document.detail.submit();
}
//
function pUpdate(no){
	document.update.no.value=no;
	document.update.submit();
}
function pDelete(no){
	document.delete.no.value=no;
	document.delete.submit();
}

////////////////////////////////////////////////////////////////
///// ORDER  ///// 
function oDtail(no){
	document.detail.no.value=no;
	document.detail.submit();
}
function oUpdate(no){
	document.update.no.value=no;
	document.update.submit();
}
function oDelete(no){
	document.delete.no.value=no;
	document.delete.submit();
}

////////////////////////////////////////////////////////////////
/////  ///// 
//
function update(mem_id){
	document.update.mem_id.value = mem_id;
	document.update.submit();
}
function zipCheck(){
	url = "../ZipCheck.jsp?check=y";
	window.open(url,"ZipCheck","toolbar=no,width=500,height=300,directories=no,status=yes,scrollbar=yes,menubar=no");
}