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
<title>editContact.jsp</title>
<!-- ____________________________LINK : CSS ____________________________________ -->
<%@ include file="components/allcomponents.jsp"%>


<%
System.out.println("Inside editContact.jsp");

if (request.getParameter("tag") == null || session.getAttribute("user") == null) {
	System.out.println("Invalid Access. User: " + session.getAttribute("user") + " Tag=" + request.getParameter("tag")
	+ "\nRedirecting to index.jsp.");
	response.sendRedirect("index.jsp");
}
%>
<style type="text/css">
a {
	text-decoration: none;
	cursor: pointer;
}
</style>
</head>
<body>

	<%@ include file="components/navbar.jsp"%>

	<%@page
		import="com.practise.web.model.Contact, com.practise.web.DAO.ContactDAOImpl, com.practise.web.DAO.ContactDAOImpl.*"%>

	<%
	int contactid = Integer.parseInt(request.getParameter("tag"));

	User user = (User) session.getAttribute("user");
	String userid = user.getUsername();

	ContactDAOImpl cdi = new ContactDAOImpl();

	Contact contact = cdi.viewContact(userid, contactid);

	if (contact == null) {
		System.out.println("Contact not recieved.\nRedirected to index.jsp.");
		response.sendRedirect("index.jsp");
	} else if (!contact.getUserid().equals(userid)) {
		System.out.println("Contact found to be of different user. \nContact accessed of: " + contact.getUserid()
		+ "\nCurrent User: " + userid + "\nRedirected to index.jsp.");
		response.sendRedirect("index.jsp");
	}
	%>
	<div class="container-fluid bg-asphalt" id="login">

		<%
		if (session.getAttribute("editContact") == "false") {
		%>

		<div class="row">
			<div class="col-lg-12 col-md-12 col-sm-12 bg-asphalt">
				<div class="alert alert-success alert-dismissible fade show"
					role="alert">
					<strong>Failed.<i class="fas fa-heart-broken text-danger"></i>&nbsp;
						&nbsp;
					</strong>Contact could not be updated. Please try again later.
					<button type="button" class="close" data-dismiss="alert"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
			</div>
		</div>

		<%
		session.removeAttribute("editContact");
		} else 
		if (session.getAttribute("editContact") == "error") {
		%>

		<div class="row">
			<div class="col-lg-12 col-md-12 col-sm-12 bg-asphalt">
				<div class="alert alert-success alert-dismissible fade show"
					role="alert">
					<strong>Error &nbsp; <i class="fas fa-exclamation-circle"></i>
						&nbsp;
					</strong>An unwanted error has occured. Please try again later.
					<button type="button" class="close" data-dismiss="alert"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
			</div>
		</div>

		<%
		session.removeAttribute("editContact");
		}
		%>

		<div class="row">
			<div
				class="col-lg-12 col-md-12 col-sm-12 card justify-content-center align-items-center text-center bg-asphalt">

				<div class="card-body">
					<h5 class="card-title text-light">EDIT CONTACT WIZARD</h5>
					<h6 class="card-subtitle mb-2 text-muted text-justify">
						Edit the details and Press
						<kbd class="bg-success">Update Contact</kbd>
					</h6>

					<br>

					<div class="card-text">


						<form action="editContact" method="post">
							<input type="text" name="contactid"
								value="<%=contact.getContactid()%>" hidden="true">
							<div class="input-group form-control">
								<input type="text" name="fname" class="form-control"
									value="<%=contact.getFname()%>" placeholder="First Name" /> <input
									type="text" name="lname" class="form-control"
									value="<%if (contact.getLname() != null) {%>
<%=contact.getLname()%>
<%} else {%><%=" "%> <%}%>"
									placeholder="Last Name" />
							</div>

							<br> <input type="text" name="number" class="form-control"
								value="<%=contact.getNumber()%>" placeholder="Contact Number" />
							<br>
							<%
							if (contact.getEmail() != null) {
							%>
							<input type="email" name="email" class="form-control"
								value="<%=contact.getEmail()%>" placeholder="Email">
							<%
							} else {
							%><input type="email" name="email" class="form-control"
								placeholder="Email">

							<%
							}
							%>
							<br>
							<%
							if (contact.getAbout() != null) {
							%>
							<input type="text" name="about" class="form-control"
								value="<%=contact.getAbout()%>">
							<%
							} else {
							%><input type="text" name="about" class="form-control">
							<%
							}
							%>

							<br>
							<button type="submit" class="btn btn-success">Update
								Contact</button>
						</form>
						<br> <a href="viewContact.jsp" class="text-light"><button
								type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button></a>


					</div>

				</div>
			</div>



		</div>


	</div>










	<!-- ____________________________SCRIPT:SRC ____________________________________ -->


</body>


</html>