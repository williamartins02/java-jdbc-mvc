<%@page import="dao.DaoCliente"%>
<%@page import="beans.ClienteBean"%>
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
<link href="resources/vendors/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">

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

						<!--======================== ALERTA CADASTRO, ERRO DE CADASTRO E DELETADO COM SUCESSO================ -->
						<c:if test="${not empty msgSuccess}">

							<div class="alert alert-success alert-dismissible fade show "
								role="alert">
								<strong>${msgSuccess}</strong> cadastrado com sucesso.
								<button type="button" class="close" data-dismiss="alert"
									aria-label="Close"></button>
							</div>

						</c:if>

						<c:if test="${not empty msgCpf}">

							<div id="alertaErro"
								class="alert alert-danger alert-dismissible fade show"
								role="alert">
								<strong>${msgCpf}</strong> Tente novamente!
								<button type="button" class="close" data-dismiss="alert"
									aria-label="Close"></button>
							</div>

						</c:if>
						<c:if test="${not empty msgDelete}">

							<div class="alert alert-danger alert-dismissible fade show"
								role="alert">
								<strong>${msgDelete}</strong> com sucesso!
								<button type="button" class="close" data-dismiss="alert"
									aria-label="Close"></button>
							</div>

						</c:if>

						<c:if test="${not empty msgEditado}">

							<div class="alert alert-success alert-dismissible fade show"
								role="alert">
								<strong>${msgEditado}</strong> Editado,
								<button type="button" class="close" data-dismiss="alert"
									aria-label="Close"></button>
							</div>

						</c:if>

						<c:if test="${not empty msgEmail}">

							<div class="alert alert-danger alert-dismissible fade show"
								role="alert">
								<strong>${msgEmail}</strong> já existe para outro usuário !
								<button type="button" class="close" data-dismiss="alert"
									aria-label="Close"></button>
							</div>

						</c:if>

						<!--========================(FIM) ALERTA CADASTRO, ERRO DE CADASTRO E DELETADO COM SUCESSO================ -->

					</div>
				</div>
				<!-- /top tiles -->

				<div class="row">



					<div class="col-md-20 col-sm-12 ">
						<div class="dashboard_graph">

							<div class="row x_title">
								<div class="col-md-6">
									<h3>Cadastro cliente</h3>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12 ">
									<div class="x_panel">
										<div class="x_title">

											<h2>
												Form <small>cliente</small>
											</h2>
											<ul class="nav navbar-right panel_toolbox">
												<li><a class="collapse-link"><i
														class="fa fa-chevron-up"></i></a>
											</ul>
											<div class="clearfix"></div>
										</div>
										<div class="x_content">
											<br />

											<form action="salvarCliente?acao=salvar" method="post"
												id="formUser" enctype="multipart/form-data">

												<div class="row">

													<label for="inputEmail4" class="form-label">ID:</label>
													<div class="col-md-1 col-sm-6">
														<input type="text" class="form-control has-feedback-left"
															readonly="readonly" value="${user.id}" id="id" name="id">
														<span class="fa fa-asterisk form-control-feedback left"
															aria-describedby="emailHelp"></span>
													</div>


													<label for="inputEmail4" class="form-label">Nome:</label>
													<div class="col-md-4 ">
														<input type="text" class="form-control has-feedback-left"
															value="${user.nome}" id="nome" name="nome" maxlength="25"
															placeholder="Digite seu Nome"> <span
															class="fa fa-user form-control-feedback left "
															aria-hidden="true"></span>
													</div>

													<label for="inputEmail4" class="form-label">Sobrenome:</label>
													<div class="col-md-4 ">
														<input type="text" class="form-control has-feedback-left"
															value="${user.sobrenome}" id="sobrenome" name="sobrenome"
															maxlength="25" placeholder="Digite seu sobrenome">
														<span class="fa fa-user form-control-feedback left "
															aria-hidden="true"></span>
													</div>
												</div>

												<br> <br> <br>

												<div class="row">
													<label for="inputEmail4" class="form-label">CPF:</label>
													<div class="col-md-2">
														<input type="text" required
															class="form-control has-feedback" value="${user.cpf}"
															id="cpf" name="cpf" maxlength="50"
															placeholder="Digiete CPF ">

													</div>

													<label for="inputEmail4" class="form-label">Email:</label>
													<div class="col-md-2 ">
														<input type="text" class="form-control has-feedback-left"
															value="${user.email}" id="email" name="email"
															maxlength="20" placeholder="Somente números"> <span
															class="fa fa-at form-control-feedback left "
															aria-hidden="true"></span>
													</div>


													<div class="form-group row">
														<label class="control-label col-md-4" style="left: 5px;">Estado
															Civil:</label>
														<div class="col-md-8" style="left: -5px;">
															<select class="select2_single form-control" tabindex="-1"
																id="estadocivil" name="estadocivil">
																<option>-----Selecione-----</option>

																<option value="Solteiro(a)"
																	<%if (request.getAttribute("user") != null) {

	ClienteBean user = (ClienteBean) request.getAttribute("user");
	if (user.getEstadocivil().equalsIgnoreCase("Solteiro(a)")) {
		out.print("");
		out.print("selected=\"selected\"");
		out.print("");
	}
}%>>Solteiro
																	(a)</option>

																<option value="Casado(a)"
																	<%if (request.getAttribute("user") != null) {

	ClienteBean user = (ClienteBean) request.getAttribute("user");
	if (user.getEstadocivil().equalsIgnoreCase("Casado(a)")) {
		out.print("");
		out.print("selected=\"selected\"");
		out.print("");
	}
}%>>Casado(a)</option>

																<option value="Divorciado(a)"
																	<%if (request.getAttribute("user") != null) {

	ClienteBean user = (ClienteBean) request.getAttribute("user");
	if (user.getEstadocivil().equalsIgnoreCase("Divorciado(a)")) {
		out.print("");
		out.print("selected=\"selected\"");
		out.print("");
	}
}%>>Divorciado(a)</option>

																<option value="Viúvo(a)"
																	<%if (request.getAttribute("user") != null) {

	ClienteBean user = (ClienteBean) request.getAttribute("user");
	if (user.getEstadocivil().equalsIgnoreCase("Viúvo(a)")) {
		out.print("");
		out.print("selected=\"selected\"");
		out.print("");
	}
}%>>Viúvo(a)</option>
															</select>
															<!-- ====================================== FIM Selecte ======================================== -->
														</div>

														</select>

													</div>

													<div style="left: 3em;" class="col-md-4 col-sm-1">
														<p>
															Masculino: <input type="radio" class="flat" name="sexo"
																checked required
																<%if (request.getAttribute("user") != null) {
	ClienteBean user = (ClienteBean) request.getAttribute("user");
	if (user.getSexo().equalsIgnoreCase("masculino")) {
		out.print("");
		out.print("checked=\"checked\"");
		out.print("");
	}
}%>
																value="masculino" /> Feminino: <input type="radio"
																class="flat" name="sexo"
																<%if (request.getAttribute("user") != null) {
	ClienteBean user = (ClienteBean) request.getAttribute("user");
	if (user.getSexo().equalsIgnoreCase("feminino")) {
		out.print("");
		out.print("checked=\"checked\"");
		out.print("");
	}
}%>
																value="feminino" />
														</p>
													</div>
												</div>
												<br> <br>
												<div class="row">
													<label for="inputEmail4" class="form-label">CEP:</label>
													<div class="col-md-4">
														<input type="text" class="form-control has-feedback-left"
															value="${user.cep}" id="cep" name="cep" required
															placeholder="  Digite o CEP"> <span
															class="fa fa-search form-control-feedback left "
															aria-hidden="true"></span>

														<div class="x_content" style="left: 40em;">

															<button type="button" class="btn btn-round btn-success"
																aria-label="Alinhar na esquerda"
																onclick="pesquisacep(cep.value)"
																style="margin-top: -67px;">
																<span class="fa fa-search ">PESQUISAR</span>
														</div>
													</div>
												</div>
												<br>
												<div class="row">
													<label for="inputEmail6" class="form-label">Rua:</label>
													<div class="col-md-2">
														<input type="text" class="form-control has-feedback"
															value="${user.rua}" id="rua" name="rua" maxlength="50"
															placeholder="Nome da rua"> <span
															aria-hidden="true"></span>
													</div>

													<label for="inputEmail4" class="form-label">Bairro:</label>
													<div class="col-md-2">
														<input type="text" class="form-control has-feedback"
															value="${user.bairro}" id="bairro" name="bairro"
															maxlength="50" placeholder="Bairro"> <span
															aria-hidden="true"></span>
													</div>


													<label for="inputEmail4" class="form-label">Cidade:</label>
													<div class="col-md-2">
														<input type="text" class="form-control has-feedback"
															value="${user.cidade}" id="cidade" name="cidade"
															placeholder="Cidade"> <span
															aria-describedby="emailHelp"></span>
													</div>

													<label for="inputEmail4" class="form-label">Estado:</label>
													<div class="col-md-2">
														<input type="text" class="form-control has-feedback"
															value="${user.estado}" id="estado" name="estado"
															placeholder="UF"> <span aria-hidden="true"></span>
													</div>

												</div>
												<br> <br>
												<div class="x_content">

													<button onClick="$(selector).click()" type="submit"
														class="btn btn-round btn-success"
														aria-label="Alinhar na esquerda">
														<span class="glyphicon glyphicon-floppy-saved">SALVAR</span>
													</button>

													<button value="Cancelar"
														onclick="document.getElementById('formUser').action = 'salvarCliente?acao=reset'"
														class="btn btn-round btn-danger"
														aria-label="Alinhar na esquerda">
														<span class="glyphicon glyphicon-refresh">CANCELAR</span>
													</button>



												</div>
										</div>
									</div>

								</div>
								</form>
							</div>
							<br>

							<!--CAMPO DE PESQUISA -->

							<form class="form-inline mt-2 mt-md-0 justify-content-end "
								method="post" action="PesquisaClienteServlet">
								<input class="form-control mr-sm-2" style="width: 25%"
									type="text" id="descricaoconsulta" name="descricaoconsulta"
									placeholder="Pesquisar clientes" aria-label="Search">
								<button class="btn btn-outline-primary my-2 my-sm-0"
									type="submit" value="Pesquisar">Pesquisar</button>
							</form>
							<!--FIM = CAMPO DE PESQUISA -->

							<br>
							<div class="row">
								<div class="col-md-12 col-sm-12">
									<div class="x_panel">
										<div class="x_title">
											<h2>
												Lista <small>cliente</small>
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
																	<th scope="col">Nome</th>
																	<th scope="col">Sobrenome</th>
																	<th scope="col">CPF</th>
																	<th scope="col">Estado civil</th>
																	<th scope="col">E-mail@</th>
																	<th scope="col">CEP</th>
																	<th scope="col">Rua</th>
																	<th scope="col">Bairro</th>
																	<th scope="col">Cidade</th>
																	<th scope="col">Estado</th>
																	<th scope="col">Fone</th>
																	<th scope="col">Editar</th>
																	<th scope="col">Excluir</th>

																</tr>
															</thead>

															<tbody>
																<c:forEach items="${listarCliente}" var="user">
																	<tr class='formize'>
																		<td><c:out value="${user.id}"></c:out></td>
																		<td><c:out value="${user.nome}"></c:out></td>
																		<td><c:out value="${user.sobrenome}"></c:out></td>
																		<td><c:out value="${user.cpf}"></c:out></td>
																		<td><c:out value="${user.estadocivil}"></c:out></td>
																		<td><c:out value="${user.email}"></c:out></td>
																		<td><c:out value="${user.cep}"></c:out></td>
																		<td><c:out value="${user.rua}"></c:out></td>
																		<td><c:out value="${user.bairro}"></c:out></td>
																		<td><c:out value="${user.cidade}"></c:out></td>
																		<td><c:out value="${user.estado}"></c:out></td>


																		<!-- BOTÕES DE FONE, EDITAR E EXCLUIR-->
																		<td><a
																			href="salvarTelefoneCliente?acao=addFone&user=${user.id}"><img
																				alt="TelefonesCliente" title="TelefonesCliente"
																				src="resources/images/telefone.png" width="35px"
																				heigth="35px"></a></td>

																		<td><a data-toggle="modal"
																			data-target="#add_data_Modal" id="carregar-usuario"
																			user_id="<c:out value="${user.id}"></c:out>"> <img
																				alt="Editar" title="Editar"
																				src="resources/images/editar.png" width="30px"
																				heigth="30px">
																		</a></td>

																		<td><a
																			href="salvarCliente?acao=delete&user=${user.id}"
																			onclick><img src="resources/images/excluir.png"
																				alt="excluir" title="Excluir" width="30px"
																				height="30px"> </a></td>

																		<!-- FIM = BOTÕES DE FONE, EDITAR E EXCLUIR-->


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

					<!-- =====================================JavaScript ===================================================== -->


					<!-- Javscript para sumir o alerta automaticamente apos uma requisação feita pelo usuario. -->
					<script>
						window.setTimeout(function() {
							$(".alert").fadeTo(200, 0).slideUp(200, function() {
								$(this).remove();
							});
						}, 2000);
					</script>
					<!-- ===================================Fim======================================================= -->

					<!-- Javscript consultar cep. -->

					<script type="text/javascript" charset="utf-8">
						// pegando api externa para preencher campo digitando o CEP //
						//Java Sript para buscar no servidor do "via cep" dados de endereço.
						function limpa_formulario_cep() {
							//Limpa valores do formulário de cep.
							document.getElementById('rua').value = ("");
							document.getElementById('bairro').value = ("");
							document.getElementById('cidade').value = ("");
							document.getElementById('estado').value = ("");

						}

						function meu_callback(conteudo) {
							if (!("erro" in conteudo)) {
								//Atualiza os campos com os valores.
								document.getElementById('rua').value = (conteudo.logradouro);
								document.getElementById('bairro').value = (conteudo.bairro);
								document.getElementById('cidade').value = (conteudo.localidade);
								document.getElementById('estado').value = (conteudo.uf);
							} //end if.
							else {
								//CEP não Encontrado.
								limpa_formulario_cep();
								alert("CEP não encontrado.");
								document.getElementById('cep').value = ("");
							}
						}

						function pesquisacep(valor) {

							//Nova variável "cep" somente com dígitos.
							var cep = valor.replace(/\D/g, '');

							//Verifica se campo cep possui valor informado.
							if (cep !== "") {

								//Expressão regular para validar o CEP.
								var validacep = /^[0-9]{8}$/;

								//Valida o formato do CEP.
								if (validacep.test(cep)) {

									//Preenche os campos com "..." enquanto consulta webservice.
									document.getElementById('rua').value = "...";
									document.getElementById('bairro').value = "...";
									document.getElementById('cidade').value = "...";
									document.getElementById('estado').value = "...";

									//Cria um elemento javascript.
									var script = document
											.createElement('script');

									//Sincroniza com o callback.
									script.src = '//viacep.com.br/ws/' + cep
											+ '/json/?callback=meu_callback';

									//Insere script no documento e carrega o conteúdo.
									document.body.appendChild(script);

								} //end if.
								else {
									//cep é inválido.
									limpa_formulario_cep();
									alert("Formato de CEP inválido.");
								}
							} //end if.
							else {
								//cep sem valor, limpa formulário.
								limpa_formulario_cep();
							}
						}
					</script>



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
				<script src="resources/vendors/google-code-prettify/src/prettify.js"></script>
				<!-- jQuery Tags Input -->
				<script
					src="resources/vendors/jquery.tagsinput/src/jquery.tagsinput.js"></script>
				<!-- Switchery -->
				<script src="resources/vendors/switchery/dist/switchery.min.js"></script>
				<!-- Select2 -->
				<script src="resources/vendors/select2/dist/js/select2.full.min.js"></script>
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
				<!-- chamando modal para confirmação de exclusão-->
				<script src="resource2/assets/js/modalExcluir.js"></script>
				>
</body>
</html>
