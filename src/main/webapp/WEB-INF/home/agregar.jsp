<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">

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
	
	<style>
		.float {
			position: fixed;
			width: 60px;
			height: 60px;
			bottom: 40px;
			left: 20px;
			background-color: #0C9;
			color: #FFF;
			border-radius: 50px;
			text-align: center;
			box-shadow: 2px 2px 3px #999;
		}
		
		.my-float {
			margin-top: 22px;
		}
	</style>

</head>
​
<body>
  <!-- Start your project here-->
  <div class="container-fluid">

    <!-- NAVBAR -->
    <div class="row">
        <div class="col-12">
            <nav class="navbar navbar-expand-lg navbar-light fixed-top" style="background-color: #e3f2fd;">
                <div class="container-fluid justify-content-between">
                    <!-- Left elements -->
                    <div class="d-flex">
                        <!-- Brand -->
                        <a class="navbar-brand me-2 mb-1 d-flex align-items-center" href="#">
                        <img
                            src="<c:url value = '/img/logo.png'/>"
                            height="50"
                            alt=""
                            loading="lazy"
                            style="margin-top: 2px;"
                        />
                        <span class="chakra-petch-font">PIPAPP</span>
                            &nbsp;&nbsp;/
                        <small>Agregar</small>
                        </a>
                
                        <!-- Search form -->
                        <form class="input-group w-auto my-auto d-none d-sm-flex">
                        <span class="input-group-text border-0 d-none d-lg-flex">
                        </span>
                        </form>
                        <!-- Search form fin ocupado para el espacio-->
                    </div>
                    <!-- Left elements -->
  
                    <!-- Right elements -->
                    <ul class="navbar-nav flex-row">
                        <li class="nav-item dropdown me-3 me-lg-1">
                        <a
                            class="nav-link dropdown-toggle hidden-arrow ripple"
                            href="#"
                            id="navbarDropdownMenuLink"
                            role="button"
                            data-mdb-toggle="dropdown"
                            aria-expanded="false"
                            data-mdb-ripple-unbound="true" data-mdb-ripple-color="red" data-mdb-ripple-centered="true">
                            <i class="fas fa-ellipsis-v fa-lg"></i>
                        </a>
                        <ul
                            class="dropdown-menu dropdown-menu-end"
                            aria-labelledby="navbarDropdownMenuLink">
                            <li><hr class="dropdown-divider" /></li>
                            <li><a class="dropdown-item" href="<c:url value = '/logout'/>">salir</a></li>
                        </ul>
                        </li>
                    </ul>
                    <!-- Right elements -->
                </div>
            </nav>
        </div>
      </div>
      
      <div class="row my-3"><div class="col-12"> . </div></div>
      <!-- NAVBAR #-->

    <!-- BUSCADOR -->
    <div class="row my-5 mx-1">
        <form id="form-buscar" action="detalle" method="post">
            <div class="form-outline">
                <input 
                    type="text" 
                    name="sku"
                    id="skuImpt" 
                    class="form-control form-control-lg" required />
                <label id="skuImptLb" class="form-label" for="skuImpt">INGRESA EL SKU DEL PRODUCTO *</label>
            </div>
            
            <div id="btn-placer" class="row mx-0">
                <button
                id="btn-buscar"
                onclick="buscarItem()"
                type="button" 
                class="btn btn-outline-dark btn-rounded my-4 btn-lg"
                data-mdb-ripple-color="dark">
                <i class="fas fa-search mx-1"></i>Buscar</button> 
            </div>
        </form>
 
    </div>
    <!-- BUSCADOR #-->

	<!-- BOTÓN VOLVER -->
    <div class="row">
        <div class="col-12">
            <a class="float ripple boton-goback-emit">
                <i class="fa fa-arrow-left my-float boton-goback-emit"></i>
            </a>
        </div>
    </div>
	<!-- BOTÓN VOLVER #-->

</div>
<!-- End your project here-->
​
  <!-- MDB -->
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.3.0/mdb.min.js"></script>


  <script type="text/javascript">
    // si el imput text no está vacío, crea el foco en el imput
    if(document.querySelector('#skuImpt').value.length === 0)
        document.querySelector('#skuImptLb').focus()
  	/**
  	* Agregamos un listener al botón agregar.
  	*/
  	document.querySelector('.boton-goback-emit').addEventListener('click', function(){
  	  	/**
  	  	* posibilidad de personalizar comportamiento antes del submit
  	  	* podemos usar una simple redirección también, pero
  	  	* esta forma suguiere un comportamiento MVC
  	  	*/
        setTimeout(function () {
        	window.location.href = `/`;
          }, 300);
  		
	})
	
	const irA = (listEl) => {
		const host = window.location.host;
		const id = listEl.id;
		window.location.href = `/detalle?id=${id}`;
	} 

	const buscarItem = () => {
		const spinnerEl = `
		    <!-- SPINNER -->
		    <div class="row my-5">
		      <div class="col d-flex justify-content-center">
		        <div class="spinner-grow" style="width: 3rem; height: 3rem" role="status">
		          <span class="visually-hidden">Loading...</span>
		        </div>
		      </div>
		    </div>
		    <!-- SPINNER #-->
		`

        const formEl = document.querySelector('#form-buscar')
        if(formEl.checkValidity()){
            formEl.submit();
		    document.querySelector('#btn-placer').innerHTML = spinnerEl;
        }
	} 

  </script>
</body>
​
</html>
