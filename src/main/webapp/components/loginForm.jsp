	<div class="container-fluid bg-asphalt" id="login">
		<div class="row  justify-content-center align-items-center">
			<div class="col-md-4 col-sm-12 col-lg-4 align-self-center">


				<div class="card login-shadow">
					<div class="text-center">
						<h3 class="card-title text-success mt-3">Login</h3>
						<%
						if (session.getAttribute("invalidUser") != null) {
						%>

						<h5 class="text-danger mt-3">
							<%
							System.out.println("User not found.");
							%>
							Invalid User-Name or Password. Please try again.
						</h5>
						<%
						session.removeAttribute("invalidUser");
						}
						if (session.getAttribute("logout") != null) {
						%>

						<h5 class="text-success mt-3">Logout Successfully.</h5>

						<%
						session.removeAttribute("logout");
						}
						if (session.getAttribute("invalidAccess") != null) {
						%>

						<h5 class="text-danger mt-3">Please login to access this
							page.</h5>

						<%
						session.removeAttribute("invalidAccess");
						}
						if (session.getAttribute("register") == "true") {
						%>

						<h5 class="text-success mt-3">
							Registration Successful!!!<i
								class="fas fa-glass-cheers text-warning"></i> <br> Please
							sign-in to access out services.
						</h5>

						<%
						session.removeAttribute("register");
						}
						%>
					</div>

					<div class="card-body">

						<form action="login" method="post" class="form-control"
							autocomplete="off">
							<label for="username">User Name</label> <input type="text"
								class="form-control" name="username" required> <br>
							<label for="username">Password</label> <input type="password"
								class="form-control" name="password" required> <br>

							<hr>
							<div class="text-center">
								<button type="submit"
									class="btn btn-login btn-lg btn-block mb-3">
									<i class="fas fa-sign-in-alt"></i>&nbsp; Login
								</button>
							</div>
						</form>

					</div>

					<hr>
					<div class=" text-center">
						<a href="register.jsp" class="text-muted font-weight-bold mb-3">I
							am a new user</a>

					</div>
					<br>
				</div>
			</div>

		</div>
	</div>