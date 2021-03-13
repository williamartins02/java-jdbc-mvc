<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html" charset=UTF-8>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet" crossorigin="anonymous">

<!-- JavaScript Bundle with Popper -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
	crossorigin="anonymous"></script>

<!-- Bootstrap CSS-->

<link rel="stylesheet"
	href="resources1/vendor/bootstrap/css/bootstrap.min.css">

<!-- Font Awesome CSS-->
<link rel="stylesheet"
	href="resources1/vendor/font-awesome/css/font-awesome.min.css">

<!-- Fontastic Custom icon font-->
<link rel="stylesheet" href="resources1/css/fontastic.css">

<!-- theme stylesheet-->
<link rel="stylesheet" href="resources1/css/style.default.css"
	id="theme-stylesheet">
<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">

<!-- Adicionando JQuery -->

<script src="https://code.jquery.com/jquery-3.4.1.min.js"
	integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
	crossorigin="anonymous"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>


<link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />

<!-- Bootstrap core CSS -->
<link href="/docs/5.0/dist/css/bootstrap.min.css" rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">

<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,700">
<style>
header {
	position: fixed;
	left: 0;
	top: 10px;
	width: 100%;
	margin-top: -15px;
	z-index: 1;
}
</style>

</head>

<body>



	<div class="page">

		<header class="header"> <nav
			class="navbar navbar-expand-lg fixed-top py-3 ">
		<div class="container">
			<a href="#"
				class="navbar-brand text-uppercase font-weight-bold rounded">CURSO-JSP/MVC</a>
			<button type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation"
				class="navbar-toggler navbar-toggler-right">
				<i class="fa fa-bars"></i>
			</button>

			<div id="navbarSupportedContent" class="collapse navbar-collapse">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active"><a href="acessoliberado.jsp"
						class="nav-link text-uppercase font-weight-bold">HOME <span
							class="sr-only"></span></a></li>
							
					<li class="nav-item" ><a href="salvarUsuario?acao=listartodos"
						class="nav-link text-uppercase font-weight-bold">USUÁRIO</a></li>
						
						<li class="nav-item"  ><a href="salvarCliente?acao=listartodos"
						class="nav-link text-uppercase font-weight-bold">CLIENTE</a></li>
						
					<li class="nav-item"><a href="salvarProduto?acao=listartodos"
						class="nav-link text-uppercase font-weight-bold">PRODUTOS</a></li>
						
					<li  class="nav-item"><a href="#" 
						class="nav-link text-uppercase font-weight-bold">RELATÓRIO</a></li>
						
					<li class="nav-item"><a href="LoginServlet?action=encerrar"
						class="nav-link text-uppercase font-weight-bold">SAIR</a></li>
				</ul>
			</div>

		</div>

		</nav> </header>

		<div class="page-content d-flex align-items-stretch">
			<!-- Side Navbar -->
			<nav class="side-navbar" style=" position: fixed; margin-top: 70px;">
			<!-- Sidebar Header-->

			<div class="sidebar-header d-flex align-items-center">
				<div class="avatar">
					<img src="<c:out value="${usuario.tempFotoUser}"></c:out>"
						class="img-fluid rounded-circle" width="90px" height="90px">
					<br> <br>

				</div>
				<br>
				<div class="title">
					<h1 class="h5">${usuario.nome}</h1>

					<p>${usuario.funcao}</p>

					<span class="badge badge-pill badge-success">Online</span>



				</div>
			</div>
			<hr style="width: 100%; text-align: left; margin-left: 50">

			<!-- Sidebar Navidation Menus--> <span class="heading">Menu</span>

			<ul class="list-unstyled">
				<li class=""><a href="acessoliberado.jsp"> <i
						class="fas fa-home"></i> HOME
				</a></li>
				<li><a href="salvarUsuario?acao=listartodos"> <i
						class="fas fa-table" ></i> TABELA USUÁRIOS
				</a></li>
				
				<li ><a href="salvarCliente?acao=listartodos"> <i
						class="fas fa-table"></i> TABELA CLIENTE
				</a></li>
				
				<li><a href="salvarProduto?acao=listartodos"> <i
						class="fas fa-table"></i> TABELA PRODUTOS
				</a></li>

				<li><a href="*"> <i class="fas fa-cart-arrow-down"></i>
						VENDAS
				</a></li>

				<li><a href="*"> <i class="fas fa-cart-arrow-down"></i>
						RELATÓRIO
				</a></li>

				<li><a href="LoginServlet?action=encerrar"><em class="fa fa-power-off">&nbsp;</em>
						SAIR</a></li>
			</ul>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
<br><br>
			</nav>







			<!-- Javscript -->
			<!-- jQuery and JS bundle w/ Popper.js -->

			<script
				src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
			<script src="resources1/vendor/bootstrap/js/bootstrap.min.js"></script>
			<script src="resources1/js/charts-home.js"></script>
			<!-- Main File-->
			<script src="resources1/js/front.js"></script>

			<script
				src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js"></script>

			<!-- Javscript para sumir o alerta automaticamente apos uma requisação feita pelo usuario. -->
			<script>
				window.setTimeout(function() {
					$(".alert").fadeTo(200, 0).slideUp(200, function() {
						$(this).remove();
					});
				}, 2000);
			</script>
			<!-- Fim -->
			
			
			
		
			
</body>
</html>