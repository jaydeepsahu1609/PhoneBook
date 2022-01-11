<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);

if (session.getAttribute("user") == null) {
	session.setAttribute("invalidAccess", "true");
	response.sendRedirect("login.jsp");
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>viewContact.jsp</title>
<!-- ____________________________LINK : CSS ____________________________________ -->
<%@ include file="components/allcomponents.jsp"%>

<style type="text/css">
</style>
</head>
<body>

	<%@ include file="components/navbar.jsp"%>

	<div class="container-fluid bg-asphalt" id="login">
		<!-- TODO: id="login" is temporary -->
		<div class="row">
			<div class="col-lg-12 col-md-12 col-sm-12"></div>
		</div>
	</div>

	<script type="text/javascript">
window.addEventListener("load", ()=>{
	document.getElementById("nav-link-2").classList.add("active");
});
</script>



	<!-- ____________________________SCRIPT:SRC ____________________________________ -->

</body>


</html>