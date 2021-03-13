
<%@page import="beans.UsuarioBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="pt">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="images/favicon.ico" type="image/ico" />

<title>Sistema de cadastro |</title>

<link href="resources/vendors/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Font Awesome -->
<link href="resources/vendors/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<!-- iCheck -->
<link href="resources/vendors/iCheck/skins/flat/green.css"
	rel="stylesheet">

<link href="resources/vendors/switchery/dist/switchery.min.css"
	rel="stylesheet">

<link href="resources/build/css/custom.min.css" rel="stylesheet">
</head>
<style>
sidebar-menu {
	position: fixed;
	left: 0;
	top: 10px;
	width: 100%;
	margin-top: -15px;
	z-index: 1;
}
</style>

<body class="nav-md">
	<div class="container body">
		<div class="main_container">
			<div class="col-md-3 left_col">
				<div class="left_col scroll-view">
					<div class="navbar nav_title" style="border: 0;">
						<a class="site_title"> <span>CURSO/JSP</span></a>
					</div>


					<!-- menu profile quick info -->
					<div class="profile clearfix">
						<div class="profile_pic">
							<img width="60px" height="60px" style="margin-top: 25px;"
								src="<c:out value="${usuario.tempFotoUser}"></c:out>"
								class="img-circle rpofile_img">
						</div>
						<div class="profile_info">
							<span>${usuario.funcao}</span>
							<h2>${usuario.nome}</h2>
						</div>
					</div>
					<!-- /menu profile quick info -->

					<br />

					<!-- sidebar menu -->
					<div id="sidebar-menu"
						class="main_menu_side hidden-print main_menu">
						<div class="menu_section">
							<h3>Menu</h3>
							<ul class="nav side-menu">
								<li><a href="acessoliberado.jsp"><i class="fa fa-home"></i>Home
										<span class="fa fa-chevron-down"></span></a></li>
								<li><a href="salvarUsuario?acao=listartodos"><i
										class="fa fa-edit"></i> Cadastro usuário <span
										class="fa fa-chevron-down"></span></a></li>
								<li><a href="salvarCliente?acao=listartodos"><i
										class="fa fa-edit"></i> Cadastro cliente <span
										class="fa fa-chevron-down"></span></a></li>
								<li><a href="salvarProduto?acao=listartodos"><i
										class="fa fa-edit"></i> Cadastro produto <span
										class="fa fa-chevron-down"></span></a></li>
								<li><a><i class="fa fa-table"></i> Vendas <span
										class="fa fa-chevron-down"></span></a></li>
								<li><a><i class="fa fa-bar-chart-o"></i> Relatório <span
										class="fa fa-chevron-down"></span></a></li>

								<li><a href="LoginServlet?action=encerrar"><i
										class="fa fa-power-off"></i> Logout <span
										class="fa fa-chevron-down"></span></a></li>

							</ul>
						</div>
					</div>
				</div>
			</div>

			<!-- top navigation -->
			<div class="top_nav">
				<div class="nav_menu">
					<div class="nav toggle">
						<a id="menu_toggle"><i class="fa fa-bars"></i></a>
					</div>
					<nav class="nav navbar-nav">
						<ul class=" navbar-right">
							<li class="nav-item dropdown open" style="padding-left: 15px;">
								<a href="javascript:;" class="user-profile dropdown-toggle"
								aria-haspopup="true" id="navbarDropdown" data-toggle="dropdown"
								aria-expanded="false"> <img
									src="<c:out value="${usuario.tempFotoUser}"></c:out>"
									class="img-circle rpofile_img">${usuario.nome}
							</a>
								<div class="dropdown-menu dropdown-usermenu pull-right"
									aria-labelledby="navbarDropdown">
									<a class="dropdown-item" href=""> Profile</a> <a
										class="dropdown-item" href="login.html"><i
										class="fa fa-sign-out pull-right"></i> Log Out</a>
								</div>
							</li>
						</ul>

					</nav>
				</div>
			</div>
			<!-- /top navigation -->

			<!-- page content -->
			<div class="right_col" role="main">
				<!-- top tiles -->
				<div class="row">
					<div class="tile_count">
						<!--======= ALERTA ==== -->
						<c:if test="${not empty msgTelefone}">
							<div class="alert alert-success alert-dismissible fade show"
								role="alert">
								<strong>${msgTelefone}</strong> Salvo com sucesso!
								<button type="button" class="close" data-dismiss="alert"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>

						</c:if>

						<c:if test="${not empty MsgfoneDelete}">
							<div class="alert alert-danger alert-dismissible fade show"
								role="alert">
								<strong>${MsgfoneDelete}</strong> Removido com sucesso!!
								<button type="button" class="close" data-dismiss="alert"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>

						</c:if>

						<c:if test="${not empty TelefoneErrado}">
							<div class="alert alert-warning alert-dismissible fade show"
								role="alert">
								<strong>${TelefoneErrado}</strong> informe o numero do telefone!
								<button type="button" class="close" data-dismiss="alert"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>

						</c:if>
						<!--========================(FIM) ALERTA DE VALIDAÇÃO/LOGIN/SENHA/NOME/TELEFONE================ -->


					</div>
				</div>
				<!-- /top tiles -->

				<div class="row">



					<div class="col-md-20 col-sm-12 ">
						<div class="dashboard_graph">

							<div class="row x_title">
								<div class="col-md-6">
									<h3>Cadastro telefone</h3>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12 ">
									<div class="x_panel">
										<div class="x_title">

											<h2>
												Form <small>telefone</small>
											</h2>
											<ul class="nav navbar-right panel_toolbox">
												<li><a class="collapse-link"><i
														class="fa fa-chevron-up"></i></a>
											</ul>
											<div class="clearfix"></div>
										</div>
										<div class="x_content">
											<br />

											<form action="salvarTelefones" method="post" id="formUser">

												<div class="row">

													<label for="inputEmail4" class="form-label">ID:</label>
													<div class="col-md-1 col-sm-6">
														<input type="text" class="form-control has-feedback-left"
															readonly="readonly" id="user" name="user"
															value="${userEscolhido.id}" readonly="readonly">
														<span class="fa fa-asterisk form-control-feedback left"
															aria-describedby="emailHelp"></span>
													</div>


													<label for="inputEmail4" class="form-label">Nome:</label>
													<div class="col-md-4 ">
														<input type="text" class="form-control has-feedback-left"
															readonly="readonly" id="nome" name="nome"
															value="${userEscolhido.nome}"> <span
															class="fa fa-user form-control-feedback left "
															aria-hidden="true"></span>
													</div>
												</div>

												<br> <br> <br>
												<div class="row">
													<label for="inputState" class="form-label">Numero:</label>
													<div class="col-md-4 ">
														<input type="text" class="form-control has-feedback-left"
															id="numero" name="numero" class="form-control"
															placeholder="Digite numero (xx-xxxxxxx)"> <span
															class="fa fa-phone form-control-feedback left "
															aria-hidden="true"></span>
													</div>




													<label for="inputState" class="form-label">Select:</label>
													<div class="form-group col-md-2">
														<select id="tipo" name="tipo" class="form-control">
															<option selected>Selecione...</option>
															<option>Casa</option>
															<option>Celular</option>
															<option>Recado</option>
															<option>Outros</option>
														</select>
													</div>
												</div>
												<br> <br> <br>




												<div class="x_content">

													<button type="submit" class="btn btn-round btn-success"
														aria-label="Alinhar na esquerda">
														<span class="glyphicon glyphicon-floppy-saved">SALVAR</span>
													</button>

													<button type="submit"
														onclick="document.getElementById('formUser').action = 'salvarTelefones?acao=voltar'"
														class="btn btn-round btn-primary"
														aria-label="Alinhar na esquerda">
														<span class="fa fa-mail-reply">VOLTAR</span>
													</button>

												</div>
										</div>
										</form>
									</div>
									<br> <br>
									<div class="row">
										<div class="col-md-12 col-sm-12 ">
											<div class="x_panel">
												<div class="x_title">
													<h2>
														Lista <small>Telefone</small>
													</h2>
													<ul class="nav navbar-right panel_toolbox">
														<li><a class="collapse-link"><i
																class="fa fa-chevron-up"></i></a></li>

													</ul>
													<div class="clearfix"></div>
												</div>
												<div class="x_content">
													<div class="row">
														<div class="col-sm-12">
															<div class="card-box table-responsive">

																<table id="datatable"
																	class="table table-striped table-bordered"
																	style="width: 100%">
																	<thead class="table-dark">
																		<tr>
																			<th scope="col">id</th>
																			<th scope="col">Numero</th>
																			<th scope="col">Tipo</th>
																			<th scope="col">Excluir</th>

																		</tr>
																	</thead>

																	<tbody>
																		<c:forEach items="${telefones}" var="fone">
																			<tr>
																			<tr>
																				<td><c:out value="${fone.id}"></c:out></td>
																				<td><c:out value="${fone.numero}"></c:out></td>
																				<td><c:out value="${fone.tipo}"></c:out></td>

																				<td><a
																					href="salvarTelefones?user=${fone.usuario}&acao=deleteFone&foneId=${fone.id}"
																					onclick="return confirm('Confirma a exlusao?');"><img
																						src="resources/images/excluir.png" alt="excluir"
																						title="Excluir" width="30px" height="30px">
																				</a></td>
																			</tr>

																		</c:forEach>

																	</tbody>
																</table>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>

									</div>
									<br />

								</div>
							</div>


							<!-- Javscript para sumir o alerta automaticamente apos uma requisação feita pelo usuario. -->
							<script>
								window.setTimeout(function() {
									$(".alert").fadeTo(200, 0).slideUp(200,
											function() {
												$(this).remove();
											});
								}, 2000);
							</script>
							<!-- Fim -->

						</div>
						<script src="resources/vendors/jquery/dist/jquery.min.js"></script>
						<!-- Bootstrap -->
						<script
							src="resources/vendors/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
						<!-- FastClick -->
						<script src="resources/vendors/fastclick/lib/fastclick.js"></script>
						<!-- NProgress -->
						<script src="resources/vendors/nprogress/nprogress.js"></script>
						<!-- bootstrap-progressbar -->
						<script
							src="resources/vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
						<!-- iCheck -->
						<script src="resources/vendors/iCheck/icheck.min.js"></script>
						<!-- bootstrap-daterangepicker -->
						<script src="resources/vendors/moment/min/moment.min.js"></script>
						<script
							src="resources/vendors/bootstrap-daterangepicker/daterangepicker.js"></script>
						<!-- bootstrap-wysiwyg -->
						<script
							src="resources/vendors/bootstrap-wysiwyg/js/bootstrap-wysiwyg.min.js"></script>
						<script src="resources/vendors/jquery.hotkeys/jquery.hotkeys.js"></script>
						<script
							src="resources/vendors/google-code-prettify/src/prettify.js"></script>
						<!-- jQuery Tags Input -->
						<script
							src="resources/vendors/jquery.tagsinput/src/jquery.tagsinput.js"></script>
						<!-- Switchery -->
						<script src="resources/vendors/switchery/dist/switchery.min.js"></script>
						<!-- Select2 -->
						<script
							src="resources/vendors/select2/dist/js/select2.full.min.js"></script>
						<!-- Parsley -->
						<script src="resources/vendors/parsleyjs/dist/parsley.min.js"></script>
						<!-- Autosize -->
						<script src="resources/vendors/autosize/dist/autosize.min.js"></script>
						<!-- jQuery autocomplete -->
						<script
							src="resources/vendors/devbridge-autocomplete/dist/jquery.autocomplete.min.js"></script>
						<!-- starrr -->
						<script src="resources/vendors/starrr/dist/starrr.js"></script>
						<!-- Custom Theme Scripts -->
						<script src="resources/build/js/custom.min.js"></script>
</body>
</html>
