<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<%@ include file="components/checkLogIn.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>createContact.jsp</title>
<!-- ____________________________LINK : CSS ____________________________________ -->
<%@ include file="components/allcomponents.jsp"%>

<style type="text/css">
</style>
</head>
<body>

	<%@ include file="components/navbar.jsp"%>


	<div class="container-fluid bg-asphalt" id="login">

		<div
			class="row align-items-center jusify-content-center text-center font-weight-bolder pt-5">
			<div class="col-lg-12 col-md-12 col-sm-12">
				<div class="alert text-light text-capitalize" role="alert">
					<h3>
						To open the Add Contact Wizard <br> Click <a id="alert"
							class="alert-link text-info" style="cursor: pointer">here</a>
					</h3>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12 col-md-12 col-sm-12">
				<!-- Button trigger modal -->
				<button type="button" class="btn btn-primary" id="triggerModal"
					data-toggle="modal" data-target="#addContactModalCenter"
					style="display: none">Launch add contact modal</button>

				<!-- Modal -->
				<div class="modal fade" id="addContactModalCenter" tabindex="-1"
					role="dialog" aria-labelledby="addContactModalCenterTitle"
					aria-hidden="true" style="background-color: rgba(255, 255, 255, 0.3);">
					<div class="modal-dialog modal-dialog-centered" role="document">
						<div class="modal-content">
							<div class="modal-header bg-dark text-light">
								<h5 class="modal-title" id="addContactModalLongTitle">
									<i class="fas fa-address-card"></i>&nbsp; Add Contact Wizard

								</h5>
								<br>


								<button type="button" class="close text-light" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>

							<div class="modal-body  p-0 bg-asphalt">
								<div style="padding: 1rem;">
									<%
									if (session.getAttribute("addContact") == "true") {
									%>

									<h5 class="text-success mt-3">
										<i class="far fa-thumbs-up"></i>&nbsp; Success!! <i
											class="far fa-thumbs-up"></i>&nbsp;Contact has been
										successfully added."
									</h5>

									<%
									session.removeAttribute("addContact");
									} else if (session.getAttribute("addContact") == "false") {
									%>

									<h5 class="text-danger mt-3">
										<i class="fas fa-heart-broken text-danger"></i>&nbsp;Contact
										could not be added. <i class="far fa-sad-tear text-info"></i>&nbsp;
										Please try again after sometime.
									</h5>

									<%
									session.removeAttribute("addContact");
									} else if (session.getAttribute("addContact") == "icvError") {
									%>

									<h5 class="text-danger mt-3">Phone number already exists.
									</h5>

									<%
									session.removeAttribute("addContact");
									} else if (session.getAttribute("addContact") == "error") {
									%>

									<h5 class="text-danger mt-3">
										<i class="fas fa-heart-broken text-danger"></i>&nbsp; An
										unwanted error has occurred. <i
											class="far fa-sad-tear text-info"></i>&nbsp; Please try again
										after sometime.
									</h5>

									<%
									session.removeAttribute("addContact");
									}
									%>
								</div>

								<form action="addContact"
									class="form-control  bg-asphalt text-dark pt-3"
									id="addContactForm" method="post">

									<%
									if (session.getAttribute("user") != null) {
										User user = (User) session.getAttribute("user");
									%>
									<input type="text" class="bg-dark text-light"
										value="<%=user.getUsername()%>" name="userid" hidden="true">

									<%
									}
									%>
									<div class="input-group">
										<input type="text" class="form-control" name="fname"
											placeholder="First Name *" required> <input
											type="text" class="form-control" name="lname"
											placeholder="Last Name">
									</div>
									<br> <input type="text" class="form-control" name="number"
										placeholder="Enter Number Here.. *" required>
			<br> <input type="email" class="form-control" name="email"
										placeholder="Enter Email of contact" >
			<br> <input type="text" class="form-control" name="about"
										placeholder="About" >

									<hr>
									<div style="justify-content: center !important;"
										class="modal-footer">
										<button type="button" class="btn btn-danger"
											data-dismiss="modal">
											<i class="fas fa-window-close"></i>&nbsp; Cancel
										</button>
										<button type="submit" class="btn bg-success">
											<i class="fas fa-user-plus"></i>&nbsp; Save Contact
										</button>
									</div>
								</form>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>










	<!-- ____________________________SCRIPT:SRC ____________________________________ -->

	<script type="text/javascript">
	
	//on load triggert the modal and highlight the add contact option in navbar
window.addEventListener("load", ()=>{
	document.getElementById("triggerModal").click();
	document.getElementById("nav-link-1").classList.add("active");
});


//Click aldert To Open The Add Contact Wizard

document.getElementById("alert").addEventListener("click", ()=>{
		document.getElementById("triggerModal").click();
});
</script>

</body>


</html>