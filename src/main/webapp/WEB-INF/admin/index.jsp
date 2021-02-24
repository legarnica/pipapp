<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="cl.lherrera.model.entity.Rol"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Admin</title>
<link href="/css/styles.css" rel="stylesheet" />
<link
	href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css"
	rel="stylesheet" crossorigin="anonymous" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js"
	crossorigin="anonymous"></script>
</head>

<body class="sb-nav-fixed">

	<!-- Menú superior -->
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<a class="navbar-brand" href="index.html">Start Bootstrap</a>
		<button class="btn btn-link btn-sm order-1 order-lg-0"
			id="sidebarToggle" href="#">
			<i class="fas fa-bars"></i>
		</button>


		<ul class="navbar-nav ml-auto mr-0 mr-md-2">
			<!-- Menú usuario -->
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" id="userDropdown" href="#"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
				<div class="dropdown-menu dropdown-menu-right"
					aria-labelledby="userDropdown">
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="/logout">Logout</a>
				</div></li>
			<!-- Menú usuario ️¸#-->
		</ul>
	</nav>
	<!-- Menú superior ️¸#-->
	<div id="layoutSidenav">

		<!-- Menú Lateral -->
		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-dark"
				id="sidenavAccordion">
				<div class="sb-sidenav-menu">
					<div class="nav">
						<div class="sb-sidenav-menu-heading">Título prueba</div>
						<a class="nav-link" href="<c:out value='/home' />">
							<div class="sb-nav-link-icon">
								<i class="far fa-thumbs-up"></i>
							</div> Home
						</a>
					</div>
				</div>
				<div class="sb-sidenav-footer">
					<div class="small">Reconocido como:</div>
					<c:out value="${username}"></c:out>
				</div>
			</nav>
		</div>
		<!-- Menú superior ️¸#-->

		<!-- Cuerpo de la aplicación -->
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid">
					<h1 class="mt-4">Administración del sitio</h1>

					<form action="<c:url value='/admin' />" method="post">

						<!-- nombre -->
						<div class="form-group">
							<label for="nombre">Nombre</label> <input type="text"
								class="form-control" id="nombre" name="nombre">
						</div>

						<!-- correo -->
						<div class="form-group">
							<label for="correo">Correo</label> <input type="email"
								class="form-control" id="correo" name="correo">
						</div>

						<!-- contraseña -->
						<div class="form-group">
							<label for="correo">Contraseña</label> <input type="password"
								class="form-control" id="contrasenia" name="contrasenia">
						</div>

						<div class="form-group">
							<label for="rol">Rol</label> 
							<select class="form-control" id="rol" name="rol">
								<c:forEach var="rol" items="${Rol.values()}">
									<option value="${rol}">${rol}</option>									
								</c:forEach>
							</select>
						</div>

						<button type="submit" class="btn btn-primary">Submit</button>
					</form>

				</div>
			</main>
			<footer class="py-4 bg-light mt-auto">
				<div class="container-fluid">
					<div
						class="d-flex align-items-center justify-content-between small">
						<div class="text-muted">Copyright &copy; Your Website 2020</div>
						<div>
							<a href="#">Privacy Policy</a> &middot; <a href="#">Terms
								&amp; Conditions</a>
						</div>
					</div>
				</div>
			</footer>
		</div>
		<!-- Cuerpo de la aplicación ️¸#-->
	</div>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>

	<!-- dataTable a español -->
	<script>
        const cdn = "//cdn.datatables.net/plug-ins/1.10.21/i18n/Spanish.json"
        $(document).ready(function () {
            $('#dataTable').DataTable({
                "language": {
                    "url": cdn
                }
            });
        });
    </script>
	<!-- dataTable a español #-->
	<script
		src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"
		crossorigin="anonymous"></script>
	<script src="assets/demo/datatables-demo.js"></script>

</body>

</html>