<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>login.jsp</title>
<%@ include file="components/allcomponents.jsp"%>

<style type="text/css">
</style>
</head>
<body>
	<%@ include file="components/navbar.jsp"%>



	<%@ include file="components/loginForm.jsp"%>


	<!-- ____________________________SCRIPT:SRC ____________________________________ -->


	<script type="text/javascript">
window.addEventListener("load", ()=>{
	document.getElementById("nav-link-login").classList.add("active");
});
</script>
</body>


</html>