<nav class="navbar navbar-expand-lg navbar-dark bg-asphalt">
	<div class="container-fluid">
		<a class="navbar-brand" href="#"><em class="fas fa-phone-square"></em>
			PhoneBook</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div
			class="collapse navbar-collapse d-lg-flex justify-content-between"
			id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link" id="nav-link-0"
					aria-current="page" href="index.jsp" target="_top"><i
						class="fas fa-house-user text-success"></i>&nbsp; Home</a></li>

				<!-- IF USER IS LOGGED IN, SHOW USERNAME AND LOGOUT OPTIONS -->
				<%
				if (session != null && session.getAttribute("user") != null) {
				%>
				<li class="nav-item"><a class="nav-link" id="nav-link-1"
					href="addContact.jsp" target="_top"><i
						class="fas fa-user-plus text-danger"></i>&nbsp;Add Contact</a></li>
				<li class="nav-item"><a class="nav-link" id="nav-link-2"
					href="viewContact.jsp" target="_top"><i
						class="fas fa-eye text-primary"></i>&nbsp; View Contact</a></li>
			</ul>
			<%
			} else {
			%>
			<li class="nav-item"><a class="nav-link" id="nav-link-1"
				href="#aboutus" target="_top"><i
					class="fas fa-laptop-code text-info"></i>&nbsp;About Us</a></li>
			<li class="nav-item"><a class="nav-link" id="nav-link-2"
				href="#contactUs" target="_top"><i
					class="fas fa-phone-volume text-warning"></i>&nbsp; Contact Us</a></li>
			</ul>
			<%
			}
			%>

			<%@ page import="com.practise.web.model.User"%>


			<!-- IF USER IS LOGGED IN, SHOW USERNAME AND LOGOUT OPTIONS -->
			<%
			if (session != null && session.getAttribute("user") != null) {
				User user = (User) session.getAttribute("user");
			%>

			<div class="d-flex">
				<a href="login.jsp" id="nav-link-login"
					class="btn btn-outline-info mr-2 rounded-right rounded-left active"
					style="pointer-events: none;"><em class="fas fa-user"></em>&nbsp;
					<%=user.getUsername()%></a> <a href="logout"
					class="btn btn-danger  bg-danger   active"><i
					class="fas fa-sign-out-alt"></i>&nbsp; Logout</a>
			</div>

			<%
			} else {
			%>


			<!-- ELSE SHOW SIGN-IN OR SIGN-UP -->
			<div class="d-flex">
				<a href="login.jsp" id="nav-link-login"
					class="btn btn-outline-success mr-2"><i
					class="fas fa-sign-in-alt"></i>&nbsp; Login</a> <a href="register.jsp"
					id="nav-link-register" class="btn btn-outline-warning "><em
					class="fas fa-user"></em>&nbsp; Register</a>
			</div>
			<%
			}
			%>
		</div>
	</div>
</nav>