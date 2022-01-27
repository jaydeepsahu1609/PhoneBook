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

	<div class="container-fluid bg-asphalt" id="login">
		<!-- TODO: id="login" is temporary -->
		<div class="row">
			<div class="col-lg-12 col-md-12 col-sm-12"></div>
		</div>
	</div>

	<script type="text/javascript">
window.addEventListener("load", ()=>{
	document.getElementById("nav-link-0").classList.add("active");
});
</script>


</body>


</html>