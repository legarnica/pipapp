<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
​
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <meta http-equiv="x-ua-compatible" content="ie=edge" />
  <title>Material Design for Bootstrap</title>
  <!-- MDB icon -->
  <link rel="icon" href="<c:url value = '/img/logo.png'/>" type="image/x-icon" />
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.2/css/all.css" />
  <!-- Google Fonts Roboto -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" />
  <!-- MDB -->
  <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.3.0/mdb.min.css" rel="stylesheet" />
</head>
​
<body>
  <!-- Start your project here-->
  <div class="container-fluid">

    <!-- NAVBAR -->
    <div class="row">
      <div class="col-12">
        <nav class="navbar fixed-top navbar-light " style="background-color: #e3f2fd;">
          <a class="navbar-brand" href="#">
            <img src="<c:url value = '/img/logo.png'/>" width="50" height="50" class="mx-3 d-inline-block align-content-center" alt="">
            <span class="chakra-petch-font">PIPAPP</span><i class="fas fa-grip-lines-vertical mx-2"></i>LOGIN
          </a>
        </nav>
      </div>
    </div>
    <div class="row my-5">
      <div class="col">
      </div>
    </div>
    <!-- NAVBAR #-->

	<!-- ERROR MESSAJE -->
	<c:if test="${error}">
    <div class="row">
      <div class="col-12">
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
          <strong>ACCESO INCORRECTO</strong>. 
          <p>Las credenciales son incorrectas.</p>
          <p>Por favor intente nuevamente.</p>
          <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
      </div>
    </div>
	</c:if>
	<!-- ERROR MESSAJE #-->

	<!-- CARD-LOGIN -->
    <div class="row">
      <div class="col-12">
        <div class="card" >
          <div class="card-body">
            <h5 class="card-title">Ingreso al sistema</h5>
            <form action="#" method="POST">
              <div class="form-outline">
                <input 
                  type="email" 
                   name="email"
                  id="email-id" 
                  required
                  class="form-control form-control-lg my-4" />
                <label class="form-label" for="email-id">Correo electrónico</label>
              </div>

              <div class="form-outline">
                <input 
                  type="password"
                  name="webPassword" 
                  id="password-id" 
                  required
                  class="form-control form-control-lg my-4" />
                <label class="form-label" for="email-id">Contraseña</label>
              </div>

              <div id="boton-wrapper" class="d-grid gap-1">
                <button
                	onclick="doLogin(event)"
                	type="button" 
                	class="btn btn-outline-dark" data-mdb-ripple-color="dark">
                  Siguiente
                </button>
              </div>

            </form>
          </div>
        </div>
      </div>
    </div>
    <!-- CARD-LOGIN #-->
</div>
  <!-- End your project here-->
​
  <!-- MDB -->
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.3.0/mdb.min.js"></script>

  <!-- Custom scripts -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous">
  /**
   * SE INTEGRA ESTE JS, PARA QUE PUEDA CERRAR EL ALERT, YA QUE LAS ALERTAS, SON DE USO
   * DE LA VERSIÓN MDB5 PRO. PERO SI AGREGAMOS EL JS DE BOOTSTRAP, PODEMOS
   * USARLO SIN QUE A PRIMERA VISTA INTERRUMPA EL FUNCIONAMIENTO DE
   * MDB5, NO FUE NECESARIO IMPORTAR BOOTSTRAP CSS.
   * */
  </script>
  <script type="text/javascript">
  const elementoBtnCargando = `
	  	<button type="submit" class="btn btn-outline-dark" data-mdb-ripple-color="dark">
          <div class="spinner-grow spinner-grow-sm" role="status">
            <span class="visually-hidden">Loading...</span>
          </div>
        </button>
	  	`

  	const doLogin = (event) => {
  	  const formElement = event.target.form; 

  	  document.querySelector(`#boton-wrapper`).innerHTML = elementoBtnCargando;
  	  formElement.submit()
  	}
  	
  </script>
</body>
​
</html>
