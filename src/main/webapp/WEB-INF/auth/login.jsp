<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>login material desing</title>

    <link href="https://unpkg.com/material-components-web@latest/dist/material-components-web.min.css" rel="stylesheet">
    <script src="https://unpkg.com/material-components-web@latest/dist/material-components-web.min.js"></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;400&display=swap" rel="stylesheet">
    <style>
        body{
            font-family: 'Roboto', sans-serif;
        }
        .expandido {
            width: 100%;
        }
        .centrado {
            text-align: center;
        }
        .margen-y {
            margin-top:2em;
        }
    </style>
</head>

<body>

    <header class="mdc-top-app-bar mdc-top-app-bar--short">
        <div class="mdc-top-app-bar__row">
          <section class="mdc-top-app-bar__section mdc-top-app-bar__section--align-start">
            <button class="material-icons mdc-top-app-bar__navigation-icon mdc-icon-button">menu</button>
            <span class="mdc-top-app-bar__title">
                PIPAPP <span class="material-icons">touch_app</span>
            </span>
          </section>
          <section class="mdc-top-app-bar__section mdc-top-app-bar__section--align-end" role="toolbar">
            <button class="material-icons mdc-top-app-bar__action-item mdc-icon-button" aria-label="Bookmark this page">bookmark</button>
          </section>
        </div>
      </header>
      <main class="mdc-top-app-bar--short-fixed-adjust">
          <h3 class="centrado">ACCESO AL SISTEMA</h1>

        <form action="<c:url value='/login' />" method="post">

            <label class="mdc-text-field mdc-text-field--filled mdc-text-field--with-leading-icon margen-y expandido">
                <span class="mdc-text-field__ripple"></span>
                <span class="mdc-floating-label " id="my-label-id">Correo electrónico</span>
                <i class="material-icons mdc-text-field__icon mdc-text-field__icon--leading" tabindex="0" role="button">email</i>
                <input
                	name="email"  
                	class="mdc-text-field__input" 
                	type="text" 
                	aria-labelledby="my-label-id" 
                	required autocomplete="current-email">
                <span class="mdc-line-ripple"></span>
            </label>
            
            <label class="mdc-text-field mdc-text-field--filled mdc-text-field--with-leading-icon margen-y expandido">
                <span class="mdc-text-field__ripple"></span>
                <span class="mdc-floating-label" id="my-label-id">Contraseña</span>
                <i class="material-icons mdc-text-field__icon mdc-text-field__icon--leading" tabindex="0" role="button">password</i>
                <input
                	name="webPassword" 
                	class="mdc-text-field__input" 
                	type="password" 
                	aria-labelledby="my-label-id" 
                	required minlength="4" 
                	autocomplete="current-password">
                <span class="mdc-line-ripple"></span>
            </label>

            <div class="mdc-touch-target-wrapper ">
                <button class="mdc-button mdc-button--outlined margen-y expandido">
                    <span class="mdc-button__ripple"></span>
                    <span class="mdc-button__label">Ingresar</span>
                  </button>
              </div>
        </form>
        

      </main>
    </div>



    <script type="text/javascript">
        // js para el menú superior
        mdc.topAppBar.MDCTopAppBar.attachTo(document.querySelector('.mdc-top-app-bar'))
        // js, para todas las llamadas al los textFields, como son más de una se usa un map
        const MDCTextField = mdc.textField.MDCTextField;
        const textFields = [].map.call(document.querySelectorAll('.mdc-text-field'), el => new MDCTextField(el));
        // Js, para el menú aceptar
        mdc.ripple.MDCRipple.attachTo(document.querySelector('.mdc-button'))

        

    </script>

</body>

</html>