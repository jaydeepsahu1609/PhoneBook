<%@page import="com.practise.web.DAO.ContactDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ include file="components/checkLogIn.jsp"%>
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
.card-title {
	letter-spacing: 1px;
}

.card:hover {
	background-color: #e6e6ff;
}

#login {
	overflow: scroll;
}

.edit-remove a:hover {
	border: solid #337FED 1px;
	background: #1E62D0;
	background-image: -webkit-linear-gradient(top, #1E62D0, #3D94F6);
	background-image: -moz-linear-gradient(top, #1E62D0, #3D94F6);
	background-image: -ms-linear-gradient(top, #1E62D0, #3D94F6);
	background-image: -o-linear-gradient(top, #1E62D0, #3D94F6);
	background-image: -webkit-gradient(to bottom, #1E62D0, #3D94F6);
	text-decoration: none;
	color: white !important;
}
</style>
</head>
<body>

	<%@ include file="components/navbar.jsp"%>

	<%@page
		import="com.practise.web.DAO.ContactDAO,com.practise.web.DAO.ContactDAO.*, com.practise.web.model.Contact, java.util.ArrayList"%>
	<div class="container-fluid bg-asphalt" id="login">
		<!-- TODO: id="login" is temporary -->
		<div class="row">
			<div class="col-lg-12 col-md-12 col-sm-12">
				<%
				if (session.getAttribute("deleteContact") == "success") {
				%>
				<div class="alert alert-success alert-dismissible fade show"
					role="alert">
					<strong>Success &nbsp;<i class="fas fa-glass-cheers"></i>
						&nbsp;
					</strong>Contact Has Been Deleted Successfully
					<button type="button" class="close" data-dismiss="alert"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<%
				session.removeAttribute("deleteContact");
				} else if (session.getAttribute("deleteContact") == "failure") {
				%>
				<div class="alert alert-danger alert-dismissible fade show"
					role="alert">

					<strong>Error &nbsp; <i class="fas fa-exclamation-circle"></i>
						&nbsp;
					</strong> Contact could not be deleted. Please Try Again Later.
					<button type="button" class="close" data-dismiss="alert"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<%
				session.removeAttribute("deleteContact");
				}
				%>
				
				
				
				<%
				if (session.getAttribute("editContact") == "true") {
				%>
				<div class="alert alert-success alert-dismissible fade show"
					role="alert">
					<strong>Success &nbsp;<i class="fas fa-glass-cheers"></i>
						&nbsp;
					</strong>Contact Has Been updated Successfully.
					<button type="button" class="close" data-dismiss="alert"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<%
				session.removeAttribute("editContact");
				} 
				%>
			</div>

		</div>

		<div class="row" id="contact-card-box">
			<%
			if (session.getAttribute("user") != null) {

				User user = (User) session.getAttribute("user");
				ContactDAOImpl cdi = new ContactDAOImpl();
				ArrayList<Contact> contacts = cdi.viewAllContacts(user.getUsername());
				if (contacts != null && !contacts.isEmpty())
					for (Contact contact : contacts) {
			%>

			<div class="col-lg-4 col-md-4 col-sm-12 mb-3">
				<div class="card" style="max-width: 18rem;">
					<div class="card-body">
						<h4 class="card-title">
							<i class="fas fa-address-book text-primary"></i>&nbsp;<%=contact.getFname() + " "%>
							<%
							if (contact.getLname() != null) {
							%>
							<%=contact.getLname()%>
							<%
							}
							%>
						</h4>
						<h5 class="card-subtitle mb-2 text-muted">
							<i class="fas fa-mobile-alt text-primary"></i>&nbsp;<a
								href="tel:<%=contact.getNumber()%>"
								title="Click to make a quick call."
								style="text-decoration: none; cursor: pointer"><%=contact.getNumber()%></a>

						</h5>
						<%
						if (contact.getEmail() != null) {
						%>
						<h6 class="card-subtitle mb-2 text-muted">
							<i class="far fa-envelope text-primary"></i>&nbsp;<a
								href="mailto:<%=contact.getEmail()%>"
								style="text-decoration: none; cursor: pointer; color: rgba(0, 0, 0, 0.7);"
								target="_blank" title="Click to send a mail"> <%=contact.getEmail()%></a>
						</h6>
						<%
						}
						if (contact.getAbout() != null) {
						%>
						<h6 class="card-subtitle mb-2 text-muted">
							<i class="fas fa-info text-primary"></i>&nbsp;<%=contact.getAbout()%>
						</h6>

						<%
						}
						%>
						<div class="d-flex justify-content-end edit-remove">
							<a href="editContact.jsp?tag=<%=contact.getContactid()%>"
								target="_top" style="text-decoration: none; cursor: pointer;"><button
									type="button" class="btn btn-primary btn p-lg-1 p-md-1 p-sm-0">
									<i class="fas fa-wrench"></i>&nbsp;Edit
								</button></a> &nbsp;&nbsp;
							<button type="button"
								class=" btn btn-outline-danger p-lg-1 p-md-1 p-sm-0"
								data-toggle="modal" data-target="#deleteModal">
								<i class="far fa-trash-alt"></i>&nbsp;Remove
							</button>
						</div>

						<!-- Confirm Delete Modal -->
						<div class="modal fade" id="deleteModal" tabindex="-1"
							role="dialog" aria-labelledby="deleteModalLabel"
							aria-hidden="true" style="background-color: rgba(0, 0, 0, 0.5);">
							<div class="modal-dialog modal-dialog-centered" role="document">
								<div class="modal-content">
									<div class="modal-header  bg-warning text-danger">
										<h5 class="modal-title">
											<i class="fas fa-exclamation-circle"></i> &nbsp;Please
											Confirm
										</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true" class="text-dark">&times;</span>
										</button>
									</div>
									<div class="modal-body">
										<p>Contact once deleted could not be recovered. Before
											deleting please make sure !!</p>
									</div>
									<div class="modal-footer justify-content-between">
										<form action="deleteContact" method="post">
											<input type="text" value="<%=contact.getContactid()%>"
												name="contactid" hidden="true"> <input type="text"
												value="<%=user.getUsername()%>" name="userid" hidden="true">
											<button type="submit" class="btn btn-outline-success">Yeah!
												I am sure</button>
										</form>

										<button type="button" class="btn btn-danger"
											data-dismiss="modal">Please Don't Delete</button>
									</div>
								</div>
							</div>
						</div>



					</div>




				</div>
			</div>


			<%
			}
			}
			%>

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