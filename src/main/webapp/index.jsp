<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>index.jsp</title>
<%@ include file="components/allcomponents.jsp"%>

</head>
<body>

	<%@ include file="components/navbar.jsp"%>


	<%
	if (session.getAttribute("user") == null) {
	%>
	<span id="gototop" title="go to top"><a onclick="gotoTop()"><em
			class="fa fa-toggle-up"></em></a></span>

	<div class="container-fluid" id="login">
		<%@ include file="components/followus.jsp"%>
	</div>

	<%@ include file="components/loginForm.jsp"%>

	<div class="container-fluid" id="donateus">
		<%@ include file="components/donateUs.jsp"%>
	</div>

	<div class="container-fluid" id="contactus">
		<%@ include file="components/contactUs.jsp"%>
	</div>

	<%
	}
	%>
	<script type="text/javascript">
window.addEventListener("load", ()=>{
	document.getElementById("nav-link-0").classList.add("active");
})
function gotoTop() {
	  window.scroll(0, 0);
	}
</script>
</body>


</html>