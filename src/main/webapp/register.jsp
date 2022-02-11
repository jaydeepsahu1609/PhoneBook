<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>register.jsp</title>
<%@ include file="components/allcomponents.jsp"%>

<style type="text/css">
.instruction {
	font-size: smaller;
	color: rgba(255, 0, 0, 0.7);
	font-weight: bolder;
}

button:disabled {
	background-color: red !important;
	color: white;
	cursor: not-allowed;
}
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
							<i class="fas fa-exclamation-triangle text-danger"></i> User Name
							is already in use.
						</h5>
						<h5 class="text-muted">Please try again with a unique
							username..</h5>

						<%
						session.removeAttribute("register");
						} else {
						%>
						<h5 class="text-muted">Fill the following details and press
							register..</h5>

						<%
						}
						%>
					</div>



					<div class="card-body">

						<form action="register" class="form-control " method="post">
							<div class="input-group">
								<input type="text" class="form-control" name="fname"
									placeholder="First Name" required /> <input type="text"
									class="form-control" name="lname" placeholder="Last Name"
									required />
							</div>

							<br /> <input type="email" class="form-control" name="email"
								placeholder="Enter Your Email-ID" id="email" required /> <br />


							<label for="username">User Name</label>


							<div class="input-group form-control"
								style="border: none; padding: 0;">
								<input type="text" class="form-control" name="userid"
									oninput="useridChanged()" id="userid"
									style="position: relative; width: 100%;" required />
								<div class="input-group-append bg-light text-info"
									id="userid-check"
									style="position: absolute; right: 0%; z-index: 999;">
									<a class="btn border-info" id="checkUserId"
										onclick="validateUserId()">Check</a>
								</div>
							</div>


							<ul class="ml-3">
								<li class="instruction" id="instruction-userid">Check
									User-Name for availability!!</li>
							</ul>

							<label class="mt-1" for="password">Password</label>

							<div class="input-group form-control"
								style="border: none; padding: 0;">

								<input type="password" class="form-control" name="password"
									id="pwd" oninput="validatePwd()"
									style="position: relative; width: 100%;" required />
								<div class="input-group-append" id="pwd-check"
									style="display: none; position: absolute; right: 0%; z-index: 999; border: 0;">
									<span class="form-control text-center  bg-success text-light">
										<em class="far fa-check-circle"></em>
									</span>
								</div>
							</div>

							<div>
								<ul class="ml-3">
									<li id="instruction-pwd-1" class="instruction" hidden>Password
										should be atleast 8 characters long</li>
									<li id="instruction-pwd-2" class="instruction" hidden>Password
										must contain atleast one upppercase</li>
									<li id="instruction-pwd-3" class="instruction" hidden>Password
										must contain atleast one lowercase</li>
									<li id="instruction-pwd-4" class="instruction" hidden>Password
										must contain atleast one number</li>
									<li id="instruction-pwd-5" class="instruction" hidden>Password
										must contain atleast one special character</li>
								</ul>

							</div>

							<label class="mt-1" for="cpassword">Confirm Password</label>


							<div class="input-group form-control"
								style="border: none; padding: 0;">

								<input type="password" class="form-control" name="cpassword"
									id="cpwd" onkeyup="validateCpwd()"
									placeholder="Re-enter your password"
									style="position: relative; width: 100%;" required />
								<div class="input-group-append" id="cpwd-check"
									style="display: none; position: absolute; right: 0%; z-index: 999; border: 0;">
									<span class="form-control text-center  bg-success text-light">
										<em class="far fa-check-circle"></em>
									</span>
								</div>
							</div>

							<ul class="ml-3">
								<li id="instruction-cpwd" class="instruction" hidden>Password
									and Confirm-Password do not match</li>
							</ul>



							<div class="text-center pt-4">
								<button type="submit" id="registerBtn"
									class="btn btn-block btn-success mb-3" disabled>
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

<script type="text/javascript" src="components/RegisterFormValidation.js"></script>

	<script type="text/javascript">
window.addEventListener("load", ()=>{
	document.getElementById("nav-link-register").classList.add("active");
});
</script>
</body>


</html>