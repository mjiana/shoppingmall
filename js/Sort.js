//select box 하나로 목록 정렬하기
function pselCk(){
	//alert();
	var sortForm = document.psortForm; //form
	var sort = sortForm.sort; //input type = hidden
	var sel = sortForm.selsort;
	
	switch (sel.value){
		case "nUp" : sort.value = "p_name asc"; break;
		case "nDown" : sort.value = "p_name desc"; break;
		case "pUp" : sort.value = "p_price asc"; break;
		case "pDown" : sort.value = "p_price desc"; break;
		case "dUp" : sort.value = "p_date asc"; break;
		case "dDown" : sort.value = "p_date desc"; break;
		default : sort.value = "p_no desc";
	}	
	//alert(sort.value);
	sortForm.submit();
}
function oselCk(){
	//alert();
	var sortForm = document.osortForm; //form
	var sort = sortForm.sort; //input type = hidden
	var sel = sortForm.selsort;
	
	switch (sel.value){
		case "dUp" : sort.value = "o_date asc"; break;
		case "dDown" : sort.value = "o_date desc"; break;
		case "qUp" : sort.value = "o_quantity asc"; break;
		case "qDown" : sort.value = "o_quantity desc"; break;
		case "sUp" : sort.value = "o_state asc"; break;
		case "sDown" : sort.value = "o_state desc"; break;
		default : sort.value = "o_no desc";
	}	
	//alert(sort.value);
	sortForm.submit();
}
/*
//select box 두개로 구분해서 정렬하기
function sortCk(){
	var sortForm = document.sortForm; //form
	var sort = sortForm.sort; //input type = hidden
	var sort1 = sortForm.sort1; //select1
	var sort2 = sortForm.sort2; //select2
	
	if(sort1.value == "0"){
		alert("정렬항목을 선택해주세요.");
		sort2.value = "0";
		sort1.focus();
		return;
	}else{
		sort.value = sort1.value+" "+sort2.value;
		//
		sortForm.submit();
	}
}
//첫번째 select box onchange시 호출
function sort1Ck(){
	//alert(document.sortForm.sort1.value);
	document.sortForm.sort2.value = "0";
	document.sortForm.submit();
}*/