//select box �ϳ��� ��� �����ϱ�
function selectCk(){
	var sortForm = document.sortForm; //form
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
/*
//select box �ΰ��� �����ؼ� �����ϱ�
function sortCk(){
	var sortForm = document.sortForm; //form
	var sort = sortForm.sort; //input type = hidden
	var sort1 = sortForm.sort1; //select1
	var sort2 = sortForm.sort2; //select2
	
	if(sort1.value == "0"){
		alert("�����׸��� �������ּ���.");
		sort2.value = "0";
		sort1.focus();
		return;
	}else{
		sort.value = sort1.value+" "+sort2.value;
		//
		sortForm.submit();
	}
}
//ù��° select box onchange�� ȣ��
function sort1Ck(){
	//alert(document.sortForm.sort1.value);
	document.sortForm.sort2.value = "0";
	document.sortForm.submit();
}*/