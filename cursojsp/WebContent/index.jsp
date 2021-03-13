<%@page import="beans.UsuarioBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>




<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html" charset=UTF-8>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<title>Sistema de Cadastro</title>

<!-- CHAMANDO TODOS LINK: BOTSTRAP, JQUERY ENTRE OUTROS. -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">

<!--===============================================================================================-->
<link rel="icon" type="image/png"
	href="resources/images/icons/favicon.ico" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="resources1/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="resources1/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="resources1/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="resources1/vendor/animate/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="resources1/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="resources1/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="resources1/vendor/select2/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="resources1/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="resources1/css/util.css">
<link rel="stylesheet" type="text/css" href="resources1/css/main.css">
<!--===============================================================================================-->
</head>
<body>



	<div class="limiter">


		<div class="container-login100"
			style="background-image: url('resources/images/popo.jpg');">
			<div class="wrap-login100 p-t-30 p-b-50">
				<span class="login100-form-title p-b-41"> LOGIN DA CONTA </span>


                <!--ALERTA DE SENHA INVALIDA-->
				<c:if test="${not empty SenhaErradaLogin}">

					<div class="alert alert-danger alert-dismissible fade show"
						role="alert">
						<strong>${SenhaErradaLogin}</strong> 
						<button type="button" class="close" data-dismiss="alert"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>

				</c:if><!--FIM = ALERTA DE USUARIO INATIVO-->
				
						<c:if test="${not empty userInativo}">

					<div class="alert alert-danger alert-dismissible fade show"
						role="alert">
						<strong>${userInativo}</strong> 
						<button type="button" class="close" data-dismiss="alert"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>

				</c:if><!--FIM = ALERTA DE SENHA INVALIDA-->

				<form class="login100-form validate-form p-b-33 p-t-5"
					action="LoginServlet" method="post">

					<div class="wrap-input100 validate-input"
						data-validate="Digita o Login">
						<input class="input100" type="text" id="login" name="login"
							placeholder=" Login"> <span class="focus-input100"
							data-placeholder="&#xe82a;"></span>

					</div>

					<div class="wrap-input100 validate-input"
						data-validate="Digita a senha">
						<input class="input100" type="password" id="senha" name="senha"
							placeholder="Senha"> <span class="focus-input100"
							data-placeholder="&#xe80f;"></span>
					</div>
					<div class="container-login100-form-btn m-t-32">

						<button class="login100-form-btn" type="submit" value="logar">Conecta-se</button>
					</div>

				</form>
			</div>
		</div>
	</div>


	<div id="dropDownSelect1"></div>


	<!--===============================================================================================-->
	<script src="resources1/vendor/jquery/jquery-3.2.1.min.js"></script>
	<!--===============================================================================================-->
	<script src="resources1/vendor/animsition/js/animsition.min.js"></script>
	<!--===============================================================================================-->
	<script src="resources1/vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
	<!--===============================================================================================-->
	<script src="resources1/vendor/select2/select2.min.js"></script>
	<!--===============================================================================================-->
	<script src="resources1/vendor/daterangepicker/moment.min.js"></script>
	<script src="resources1/vendor/daterangepicker/daterangepicker.js"></script>
	<!--===============================================================================================-->
	<script src="resources1/vendor/countdowntime/countdowntime.js"></script>
	<!--===============================================================================================-->
	<script src="resources1/js/main.js"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="resources1/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="resources1/js/charts-home.js"></script>
	
	
	
</body>
</html>