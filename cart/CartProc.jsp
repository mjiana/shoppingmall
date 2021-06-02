<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<title>Simple Shopping mall</title>
<% request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id="cartMgr" class="ch14.CartMgr" scope="session"/>
<jsp:useBean id="ob" class="ch14.OrderBean"/>
<jsp:setProperty property="*" name="ob"/>
<%
String flag = request.getParameter("flag");
String id = (String)session.getAttribute("idKey");
/* if(id == null){
	response.sendRedirect("../login/Login.jsp");
} else{ */
	if(flag == null){
		ob.setM_id(id);
		ob.setO_quantity(Integer.parseInt(request.getParameter("quantity")));
		ob.setP_no(Integer.parseInt(request.getParameter("no")));
		cartMgr.addCart(ob);
	%>
		<script type="text/javascript">
			alert("장바구니에 담았습니다.");
			location.href="CartList.jsp";
		</script>
	<%
	}else if(flag.equals("update")){
		ob.setP_no(Integer.parseInt(request.getParameter("no")));
		ob.setO_quantity(Integer.parseInt(request.getParameter("quantity")));
		cartMgr.updateCart(ob);
	%>
		<script type="text/javascript">
			alert("수정되었습니다.");
			location.href="CartList.jsp";
		</script>
	<%	
	}else {
		ob.setP_no(Integer.parseInt(request.getParameter("no")));
		cartMgr.deleteCart(ob);
	%>
		<script type="text/javascript">
			alert("삭제되었습니다.");
			location.href="CartList.jsp";
		</script>
	<%	
	}
//} //if(id == null) end
%>