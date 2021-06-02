<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.Vector, ch14.*" %>
<% 
String mem_id = (String)session.getAttribute("idKey"); 
if(mem_id != null && mem_id.equals("manager")){
request.setCharacterEncoding("euc-kr"); %>  
<jsp:useBean id="pMgr" class="ch14.ProductMgr"/>
<jsp:useBean id="oMgr" class="ch14.OrderMgr"/>
<jsp:useBean id="ls" class="ch14.ListSort"/>  
<%
//목록 정렬
String sort = request.getParameter("sort");
//out.print(sort);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Simple Shopping mall Manager</title>
<link rel="stylesheet" type="text/css" href="../style/shop.css">
<script type="text/javascript" src="../js/Script.js"></script>
<script type="text/javascript" src="../js/Link.js"></script>
<script type="text/javascript" src="../js/Sort.js"></script>
</head>
<body>
<%@ include file="../Top.jsp" %>
<table class="type03">
	<tr>
		<td colspan="6"><font class="thfont">주문 현황</font></td>
	</tr>
	<tr>
		<td colspan="6" class="right">
		<a href="javascript:pMgr()">상품 현황</a>
		&nbsp;
		<form method="post" name="osortForm">
			<select name="selsort" onchange="oselCk()">
				<option value="0">상품정렬</option>
				<optgroup label="구매일">
					<option value="dUp">오름차순</option>
					<option value="dDown">내림차순</option>
				</optgroup>
				<optgroup label="구매수량">
					<option value="qUp">오름차순</option>
					<option value="qDown">내림차순</option>
				</optgroup>
				<optgroup label="주문상태">
					<option value="sUp">오름차순</option>
					<option value="sDown">내림차순</option>
				</optgroup>
			</select>
			<input type="hidden" name="sort" value="">
		</form>
		</td>
	</tr>
	<tr>
		<th>주문<br>번호</th>
		<th>구매자</th>
		<th>제품명</th>
		<th>구매<br>수량</th>
		<th>구매일</th>
		<th>주문<br>상태</th>
	</tr>
	<%
	Vector vlist = null;
	vlist = oMgr.getOrderList();
	if(sort == null || sort == "") vlist = oMgr.getOrderList();
	else vlist = ls.OrderSortList(sort); 
	
	if(vlist.size() == 0){
	%>
	<tr>
		<td colspan="6">주문 내역이 없습니다.</td>
	</tr>
	<%
	} else{
		for(int i=0; i<vlist.size(); i++){
			OrderBean ob = (OrderBean)vlist.get(i);
			String no = Integer.toString(ob.getP_no());
			ProductBean pb = pMgr.getProduct(no);
			
			String state = "";
			switch(ob.getO_state()){
			 case 1 : state = "접수중"; break;
			 case 2 : state = "접수완료"; break;
			 case 3 : state = "입금확인"; break;
			 case 4 : state = "배송준비"; break;
			 case 5 : state = "배송중"; break;
			 default : state = "배송완료"; break;
			}
	%>
	<tr>
		<td><%=ob.getO_no() %></td>
		<td><%=ob.getM_id() %></td>
		<td><a href="javascript:oDtail('<%=ob.getO_no() %>')"><%=pb.getP_name() %></a></td>
		<td><%=ob.getO_quantity() %>개</td>
		<td><%=ob.getO_date().substring(0,10) %></td>
		<td><%=state%></td>
	</tr>
	<%		
		}//for
	}//else
	%>
</table>
<%@ include file="../Bottom.jsp" %>
<form name="detail" method="post" action="OrderDetail.jsp">
	<input type="hidden" name="no">
</form>
</body>
</html>
<%
}else{
%>
<script type="text/javascript">
alert("관리자만 접속 가능합니다.");
location.href="../index.jsp";
</script>
<%	
}
%>