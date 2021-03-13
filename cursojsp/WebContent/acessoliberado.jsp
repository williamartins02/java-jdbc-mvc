<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="pt-br">

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />


<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">
<!-- Vendor CSS Files -->
<link href="resource2/assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="resource2/assets/vendor/aos/aos.css" rel="stylesheet">

<!-- Template Main CSS File -->
<link href="resource2/assets/css/style.css" rel="stylesheet">
</head>

<body>
	<br>
	<!-- ======= Header ======= -->
	<header id="header" class="fixed-top">
		<div class="container d-flex" data-aos="fade-left">

			<div class="logo mr-auto">
				<br>
				<h1 class="text-light">
					<a><span><b>Seja bem-vindo</b> ${usuario.nome}!</span></a>
				</h1>

			</div>
		</div>
	</header>
	<!-- End Header -->

	<!-- End Header -->

	<!-- ======= Hero Section ======= -->

	<section id="hero">
		<div class="container">

			<div class="row">
				<!--=== row de Cadastro pessoa e cadastro produto === -->

				<!-- ======= Cadastro de Pessoas ======= -->
				<div
					class="col-lg-6 col-xs-6 pt-5 pt-lg-0 order-2 order-lg-1 d-flex flex-column justify-content-center"
					data-aos="fade-rigth">
					<div>

						<div class="col-lg-6 col-xs-6 order-1 order-lg-2 hero-img"
							data-aos="fade-left" style="top: -10px;">
							<a href="salvarCliente?acao=listartodos"> <b>Cadastro
									cliente</b> <img src="resources1/assets/img/cadUsuario.png"
								class="img-fluid" alt=""></a>
						</div>

					</div>
				</div>
				<!-- ======= FIM Cadastro de Pessoas ======= -->




				<!-- ======= Cadastro de Produto ======= -->
				<div
					class="col-lg-6 pt-5 pt-lg-0 order-2 order-lg-1 d-flex flex-column justify-content-center"
					data-aos="fade-left">
					<div>

						<div class="col-lg-6 order-1 order-lg-2 hero-img"
							data-aos="fade-left">
							<a href="salvarProduto?acao=listartodos"> <b>Cadastrar
									produto</b> <img src="resources1/assets/img/cadProdu.png"
								class="img-fluid" alt="">
						</div>
					</div>
				</div>
				<!--=== FIM Cadastro de Produto === -->

			</div>

		</div>
		<!--=== FIM row de Cadastro pessoa e cadastro produto === -->

		<div class="container">
			<div class="row">
				<!--=== row de vendas e relatorio === -->
				<div
					class="col-lg-6 pt-5 pt-lg-0 order-2 order-lg-1 d-flex flex-column justify-content-center"
					data-aos="fade-rigth" style="top: 40px;">
					<div>

						<div class="col-lg-6 order-1 order-lg-2 hero-img"
							data-aos="fade-left">
							<a href="salvarUsuario?acao=listartodos"> <b>Vendas</b> <img
								src="resources1/assets/img/vendas03.png" class="img-fluid" alt="">
						</div>

					</div>
				</div>
				<!-- ======= FIM Vendas======= -->


				<!-- ======= Relatorio ======= -->

				<div
					class="col-lg-6 pt-5 pt-lg-0 order-2 order-lg-1 d-flex flex-column justify-content-center"
					data-aos="fade-left" style="top: 60px;">
					<div>

						<div class="col-lg-6 order-1 order-lg-2 hero-img"
							data-aos="fade-left">
							<a href="salvarUsuario?acao=listartodos"> <b>Relatorio</b> <img
								src="resources1/assets/img/relatorio.png" class="img-fluid"
								alt="">
						</div>
					</div>
				</div>
				<!--=== FIM Relatorio === -->

			</div>
			<!--===FIM row de vendas e relatorio === -->
		</div>
	</section>
	<!-- End Hero -->




	<!-- Vendor JS Files -->
	<script src="resource2/assets/vendor/jquery/jquery.min.js"></script>
	<script
		src="resource2/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
	<script src="resource2/assets/vendor/owl.carousel/owl.carousel.min.js"></script>
	<script src="resource2/assets/vendor/aos/aos.js"></script>

	<!-- Template Main JS File -->
	<script src="resource2/assets/js/main.js"></script>

</body>

</html>





