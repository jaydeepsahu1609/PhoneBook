<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>register.jsp</title>
<!-- ____________________________LINK : CSS ____________________________________ -->
<%@ include file="components/allcomponents.jsp"%>


<style type="text/css">
</style>
</head>
<body style="height: auto;">
	<%@ include file="components/navbar.jsp"%>


	<div class="container-fluid bg-asphalt" id="register">
		<div class="row  justify-content-center align-items-center">
			<div class="col-md-6 col-sm-12 col-lg-6 align-self-center">


				<div class="card login-shadow" style="background-color: #f6faf5">
					<div class="text-center">
						<h3 class="card-title text-success mt-3">Register</h3>
						<%
						if (session.getAttribute("register") == "false") {
						%>

						<h5 class="text-danger mt-3">
							<i class="fas fa-heart-broken text-danger"></i>&nbsp;
							Registration Unsuccessful!!! <br> An unwanted error has
							occurred. <i class="far fa-sad-tear text-info"></i>&nbsp; Please
							try again after sometime.
						</h5>

						<%
						session.removeAttribute("register");
						} else if (session.getAttribute("register") != null) {
						%>

						<h5 class="text-danger mt-3">
							<i class="fas fa-exclamation-triangle text-danger"></i>
							User Name is already in use.
						</h5>
<h5 class="text-muted text normal">Please try again with a unique username..</h5>

						<%
						session.removeAttribute("register");
						} else {
						%>
						<h5 class="text-muted text normal">Fill the following details
							and press register..</h5>

						<%
						}
						%>
					</div>

					<div class="card-body">

						<form action="register" class="form-control " method="post">

							<div class="input-group">
								<input type="text" class="form-control" name="fname"
									placeholder="First Name" required> <input type="text"
									class="form-control" name="lname" placeholder="Last Name"
									required>
							</div>
							<br> <input type="email" class="form-control" name="email"
								placeholder="Enter Your Email-ID" required> <br> <label
								for="username">User Name</label> <input type="text"
								class="form-control" name="userid" required> <label
								class="mt-1" for="password">Password</label> <input
								type="password" class="form-control" name="password" required>
							<label class="mt-1" for="cpassword">Confirm Password</label> <input
								type="password" class="form-control" name="cpassword"
								placeholder="Re-enter your password" required>
							<hr>

							<div class="text-center">
								<button type="submit" class="btn btn-login btn-block mb-3">
									<i class="fas fa-sign-in-alt"></i>&nbsp; Register
								</button>
							</div>
						</form>

					</div>
				</div>
			</div>

		</div>
	</div>



	<!-- ____________________________SCRIPT:SRC ____________________________________ -->


	<script type="text/javascript">
window.addEventListener("load", ()=>{
	document.getElementById("nav-link-register").classList.add("active");
});
</script>
</body>


</html>