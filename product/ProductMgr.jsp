<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.Vector, ch14.*" %>
<% request.setCharacterEncoding("euc-kr"); %>    
<jsp:useBean id="proMgr" class="ch14.ProductMgr"/>
<jsp:useBean id="ls" class="ch14.ListSort"/>  
<%
//목록 정렬
String sort = request.getParameter("sort");
//String sort1 = request.getParameter("sort1");
//String sort2 = request.getParameter("sort2");
//out.print(sort+"/"+sort1+"/"+sort2);
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
		<td colspan="5"><font class="thfont">상품 목록</font></td>
	</tr>
	<tr>
		<td colspan="5" class="right">
		<form method="post" name="sortForm">
			<select name="selsort" onchange="selectCk()">
				<option value="0">상품정렬</option>
				<optgroup label="상품명">
					<option value="nUp">오름차순</option>
					<option value="nDown">내림차순</option>
				</optgroup>
				<optgroup label="가격">
					<option value="pUp">오름차순</option>
					<option value="pDown">내림차순</option>
				</optgroup>
				<optgroup label="입고일">
					<option value="dUp">오름차순</option>
					<option value="dDown">내림차순</option>
				</optgroup>
			</select>
			<%-- 21.05.31 select name="selsort" 정렬 성공, 나중에 두개로 나누어서 정렬 해보기
			<select name="sort1" onchange="sort1Ck()" >
				<option value="0">정렬항목</option>
				<option value="p_name" <%=sort1!=null&&sort1.equals("p_name") ? "selected" : "" %>>상품명</option>
				<option value="p_price" <%=sort1!=null&&sort1.equals("p_price") ? "selected" : "" %>>가격</option>
				<option value="p_date" <%=sort1!=null&&sort1.equals("p_date") ? "selected" : "" %>>날짜</option>
			</select>
			<select name="sort2" onchange="sortCk()">
				<option value="0">정렬순서</option>
				<option value="asc" <%=sort2!=null&&sort2.equals("asc") ? "selected" : "" %>>오름차순</option>
				<option value="desc" <%=sort2!=null&&sort2.equals("desc") ? "selected" : "" %>>내림차순</option>
			</select> --%>
			<input type="hidden" name="sort" value="">
		</form>
		</td>
	</tr>
	<tr>
		<th>no</th>
		<th>이름</th>
		<th>가격</th>
		<th>재고</th>
		<th>입고일</th>
	</tr>
	<%
	Vector vlist = null;
	if(sort == null || sort == "") vlist = proMgr.getProductList();
	else vlist = ls.ProductSortList(sort); 
	if(vlist.size() == 0){
	%>
	<tr>
		<td colspan="5">등록된 상품이 없습니다.</td>
	</tr>
	<%
	} else{
		for(int i=0; i<vlist.size(); i++){
			ProductBean pb = (ProductBean)vlist.get(i);
			//가격에 천단위마다 ,넣기
			java.text.DecimalFormat df = new java.text.DecimalFormat("###,###");
	%>
	<tr>
		<td><%=pb.getP_no() %></td>
		<td><a href="javascript:pDtail('<%=pb.getP_no() %>')"><%=pb.getP_name() %></a></td>
		<td><%=df.format(pb.getP_price()) %>원</td>
		<td><%=pb.getP_stock()%>개</td>
		<td><%=pb.getP_date().substring(0,10) %></td>
	</tr>
	<%		
		}//for
	}//else
	%>
	<tr>
		<td colspan="5">
			<input type="button" class="btn1" value="상품등록" onclick="pInsert()">
		</td>
	</tr>
	<!-- 21.05.31 검색폼은 여유가 되면 만들기
	<tr>
		<td colspan="5">
			<form method="post" >
				<select name="find">
					<option value="name">상품명</option>
					<option value="date">입고일</option>
				</select>
				<input type="text" name="search">
				<input type="button" class="btn1" value="상품검색" onclick="pSelect()">
			</form>
		</td>
	</tr>
	 -->
</table>

<%@ include file="../Bottom.jsp" %>
<form name="detail" method="post" action="ProductDetail.jsp">
	<input type="hidden" name="no">
</form>
</body>
</html>