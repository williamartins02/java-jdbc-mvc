
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
<!-- CSS only -->



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
									class="img-circle rpofile_img">${usuario.nome},
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

						<c:if test="${not empty msgErro}">

							<div id="alertaErro"
								class="alert alert-danger alert-dismissible fade show"
								role="alert">
								<strong>${msgErro}</strong>
								<h4 class="alert-heading">Tente novamente!</h4>
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

						<c:if test="${not empty msgErroSenha}">

							<div class="alert alert-danger alert-dismissible fade show"
								role="alert">
								<strong>${msgErroSenha}</strong> já existe para outro usuário !
								<button type="button" class="close" data-dismiss="alert"
									aria-label="Close"></button>
							</div>

						</c:if>

						<!--========================(FIM) ALERTA CADASTRO, ERRO DE CADASTRO E DELETADO COM SUCESSO================ -->

						<!--========================ALERTA DE VALIDAÇÃO/LOGIN/SENHA/NOME/TELEFONE================ -->

						<c:if test="${not empty msgLogin}">

							<div class="alert alert-warning alert-dismissible fade show"
								role="alert">
								<strong>${msgLogin}</strong> deve ser informado!
								<button type="button" class="close" data-dismiss="alert"
									aria-label="Close"></button>
							</div>

						</c:if>

						<c:if test="${not empty msgSenha}">

							<div class="alert alert-warning alert-dismissible fade show"
								role="alert">
								<strong>${msgSenha}</strong> deve ser informado.
								<button type="button" class="close" data-dismiss="alert"
									aria-label="Close"></button>
							</div>

						</c:if>

						<c:if test="${not empty msgNome}">

							<div class="alert alert-warning alert-dismissible fade show "
								role="alert">
								<strong>${msgNome}</strong> deve ser informado.
								<button type="button" class="close" data-dismiss="alert"
									aria-label="Close"></button>
							</div>

						</c:if>

						<c:if test="${not empty msgTelefone}">

							<div class="alert alert-warning alert-dismissible fade show "
								role="alert">
								<strong>${msgTelefone}</strong> deve ser informado.
								<button type="button" class="close" data-dismiss="alert"
									aria-label="Close"></button>
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
									<h3>Cadastro usuário</h3>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12 ">
									<div class="x_panel">
										<div class="x_title">

											<h2>
												Form <small>usuários</small>
											</h2>
											<ul class="nav navbar-right panel_toolbox">
												<li><a class="collapse-link"><i
														class="fa fa-chevron-up"></i></a>
											</ul>
											<div class="clearfix"></div>
										</div>
										<div class="x_content">
											<br />

											<form action="salvarUsuario?acao=salvar" method="post"
												id="formUser" enctype="multipart/form-data">

												<div class="row">

													<label for="inputEmail4" class="form-label">ID:</label>
													<div class="col-md-1 col-sm-6">
														<input type="text" class="form-control has-feedback-left"
															value="${user.id}" id="id" name="id" readonly="readonly">
														<span class="fa fa-asterisk form-control-feedback left"
															aria-describedby="emailHelp"></span>
													</div>


													<label for="inputEmail4" class="form-label">Login:</label>
													<div class="col-md-4 ">
														<input type="text" class="form-control has-feedback-left"
															value="${user.login}" id="login" name="login" required
															placeholder="  Digite Login"> <span
															class="fa fa-user form-control-feedback left "
															aria-hidden="true"></span>
													</div>

													<label for="inputEmail4" class="form-label">Senha:</label>
													<div class="col-md-4 ">
														<input type="text" class="form-control has-feedback-left"
															value="${user.senha}" id="senha" name="senha" required
															placeholder=" Digite a senha"> <span
															class="fa fa-lock form-control-feedback left "
															aria-hidden="true"></span>
													</div>
												</div>

												<br> <br> <br>

												<div class="row">
													<label for="inputEmail4" class="form-label">Nome:</label>
													<div class="col-md-4">
														<input type="text" placeholder=" Digite seu nome" required
															class="form-control has-feedback" value="${user.nome}"
															id="nome" name="nome">

													</div>


													<div class="form-group row">
														<label class="control-label col-md-3" style="left: 3px;">Cargo:</label>
														<div class="col-md-8" style="left: -60px;">
															<select class="select2_single form-control" tabindex="-1"
																id="funcao" required name="funcao">
																<option>------Selecione------</option>

																<option value="Analista sistemas"
																	<%if (request.getAttribute("user") != null) {

	UsuarioBean user = (UsuarioBean) request.getAttribute("user");
	if (user.getFuncao().equalsIgnoreCase("Analista sistemas")) {
		out.print("");
		out.print("selected=\"selected\"");
		out.print("");
	}
}%>>Analista
																	de Sistema</option>

																<option value="Administrador(a)"
																	<%if (request.getAttribute("user") != null) {

	UsuarioBean user = (UsuarioBean) request.getAttribute("user");
	if (user.getFuncao().equalsIgnoreCase("Administrador(a)")) {
		out.print("");
		out.print("selected=\"selected\"");
		out.print("");
	}
}%>>Auxiliar
																	Administrativo</option>

																<option value="Assistente administrativo"
																	<%if (request.getAttribute("user") != null) {

	UsuarioBean user = (UsuarioBean) request.getAttribute("user");
	if (user.getFuncao().equalsIgnoreCase("Assistente administrativo")) {
		out.print("");
		out.print("selected=\"selected\"");
		out.print("");
	}
}%>>Assistente
																	Administrativo</option>

																<option value="Administrador(a) redes"
																	<%if (request.getAttribute("user") != null) {

	UsuarioBean user = (UsuarioBean) request.getAttribute("user");
	if (user.getFuncao().equalsIgnoreCase("Administrador(a) redes")) {
		out.print("");
		out.print("selected=\"selected\"");
		out.print("");
	}
}%>>Administrador
																	de Redes</option>

																<option value="Administrador(a) sistemas"
																	<%if (request.getAttribute("user") != null) {

	UsuarioBean user = (UsuarioBean) request.getAttribute("user");
	if (user.getFuncao().equalsIgnoreCase("Administrador(a) sistemas")) {
		out.print("");
		out.print("selected=\"selected\"");
		out.print("");
	}
}%>>Administrador(a)
																	de Sistemas</option>

																<option value="Administrador(a) banco"
																	<%if (request.getAttribute("user") != null) {

	UsuarioBean user = (UsuarioBean) request.getAttribute("user");
	if (user.getFuncao().equalsIgnoreCase("Administrador(a) banco")) {
		out.print("");
		out.print("selected=\"selected\"");
		out.print("");
	}
}%>>Administrador(a)
																	de Banco de Dados</option>

																<option value="Analista TI"
																	<%if (request.getAttribute("user") != null) {

	UsuarioBean user = (UsuarioBean) request.getAttribute("user");
	if (user.getFuncao().equalsIgnoreCase("Analista TI")) {
		out.print("");
		out.print("selected=\"selected\"");
		out.print("");
	}
}%>>Analista
																	de Tecnologia da Informacao (TI)</option>

																<option value="Analista telecomunicao"
																	<%if (request.getAttribute("user") != null) {

	UsuarioBean user = (UsuarioBean) request.getAttribute("user");
	if (user.getFuncao().equalsIgnoreCase("Analista telecomunicao")) {
		out.print("");
		out.print("selected=\"selected\"");
		out.print("");
	}
}%>>Analista
																	de Telecomunicacao</option>

																<option value="coordenador(a) sistemas"
																	<%if (request.getAttribute("user") != null) {

	UsuarioBean user = (UsuarioBean) request.getAttribute("user");
	if (user.getFuncao().equalsIgnoreCase("coordenador(a) sistemas")) {
		out.print("");
		out.print("selected=\"selected\"");
		out.print("");
	}
}%>>Coordenador(a)
																	de Desenvolvimento de Sistemas</option>

																<option value="coordenador(a) informatica"
																	<%if (request.getAttribute("user") != null) {

	UsuarioBean user = (UsuarioBean) request.getAttribute("user");
	if (user.getFuncao().equalsIgnoreCase("coordenador(a) informatica")) {
		out.print("");
		out.print("selected=\"selected\"");
		out.print("");
	}
}%>>Coordenador(a)
																	Informatica</option>


																<option value="Recurso humanos"
																	<%if (request.getAttribute("user") != null) {

	UsuarioBean user = (UsuarioBean) request.getAttribute("user");
	if (user.getFuncao().equalsIgnoreCase("Recurso humanos")) {
		out.print("");
		out.print("selected=\"selected\"");
		out.print("");
	}
}%>>Recursos
																	Humanos</option>


																<option value="Estagiario(a) sistemas"
																	<%if (request.getAttribute("user") != null) {

	UsuarioBean user = (UsuarioBean) request.getAttribute("user");
	if (user.getFuncao().equalsIgnoreCase("Estagiario(a) sistemas")) {
		out.print("");
		out.print("selected=\"selected\"");
		out.print("");
	}
}%>>Estagiario(a)
																	de Desenvolvimento de Sistemas</option>


																<option value="Programador(a)"
																	<%if (request.getAttribute("user") != null) {

	UsuarioBean user = (UsuarioBean) request.getAttribute("user");
	if (user.getFuncao().equalsIgnoreCase("Programador(a)")) {
		out.print("");
		out.print("selected=\"selected\"");
		out.print("");
	}
}%>>Programador(a)</option>


																<option value="Gerente projetos"
																	<%if (request.getAttribute("user") != null) {

	UsuarioBean user = (UsuarioBean) request.getAttribute("user");
	if (user.getFuncao().equalsIgnoreCase("Gerente projetos")) {
		out.print("");
		out.print("selected=\"selected\"");
		out.print("");
	}
}%>>Gerente
																	Projeto</option>

															</select>
														</div>
													</div>
												</div>

												<br> <br>
												<div class="row">
													<div style="left: 3em;" class="col-md-4 col-sm-1">
														<p>
															Masculino: <input type="radio" class="flat" name="sexo"
																checked required
																<%if (request.getAttribute("user") != null) {

	UsuarioBean user = (UsuarioBean) request.getAttribute("user");
	if (user.getSexo().equalsIgnoreCase("masculino")) {
		out.print("");
		out.print("checked=\"checked\"");
		out.print("");
	}
}%>
																value="masculino" /> Feminino: <input type="radio"
																class="flat" name="sexo"
																<%if (request.getAttribute("user") != null) {

	UsuarioBean user = (UsuarioBean) request.getAttribute("user");
	if (user.getSexo().equalsIgnoreCase("feminino")) {
		out.print("");
		out.print("checked=\"checked\"");
		out.print("");
	}
}%>
																value="feminino" />
														</p>
														
														
													</div>


													<div style="left: -20em;" class="col-md-4 col-sm-1 ">
														<div class="">
															<input type="checkbox" class="js-switch" id="ativo"
																name="ativo"
																<%if (request.getAttribute("user") != null) {
	UsuarioBean user = (UsuarioBean) request.getAttribute("user");
	if (user.isAtivo()) {
		out.print("");
		out.print("checked=\"checked\"");
		out.print("");
	}
}%>>
															Ativo <label class="form-check-label"
																for="flexSwitchCheckDefault"></label>
														</div>
													</div>


													<div class="form-row">
														<div class=" form-group col-md-2" style="left: -50em;">
															<input id="file" name="foto" type="file" value="${foto}"
																required />
														</div>
													</div>



												</div>

												<br> <br> <br>
												<div class="row">
													<label for="inputEmail4" class="form-label">CEP:</label>
													<div class="col-md-4">
														<input type="text" class="form-control has-feedback-left"
															value="${user.cep}" id="cep" name="cep" required
															placeholder="  Digite Login"> <span
															class="fa fa-search form-control-feedback left "
															aria-hidden="true"></span>
													</div>
													<br> <br>

													<div class="x_content" style="left: 43em;">

														<button type="button" class="btn btn-round btn-success"
															aria-label="Alinhar na esquerda"
															onclick="pesquisacep(cep.value)"
															style="margin-top: -67px;">
															<span class="fa fa-search ">PESQUISAR</span>
													</div>


												</div>

												<div class="row">
													<label for="inputEmail4" class="form-label">Rua:</label>
													<div class="col-md-4">
														<input type="text" class="form-control has-feedback"
															value="${user.rua}" id="rua" name="rua"
															placeholder="Sua rua"> <span aria-hidden="true"></span>
													</div>

													<label for="inputEmail4" class="form-label">Bairro:</label>
													<div class="col-md-2">
														<input type="text" class="form-control has-feedback"
															value="${user.bairro}" id="bairro" name="bairro"
															placeholder="Seu bairro"> <span
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
													<div class="col-md-1">
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
														onclick="document.getElementById('formUser').action = 'salvarUsuario?acao=reset'"
														class="btn btn-round btn-danger"
														aria-label="Alinhar na esquerda">
														<span class="glyphicon glyphicon-refresh">CANCELAR</span>
													</button>


												</div>
										</div>
									</div>
								</div>
							</div>
							</form>
						</div>

						<br>


						<form class="form-inline mt-2 mt-md-0 justify-content-end "
							method="post" action="servletPesquisa">
							<input class="form-control mr-sm-2" style="width: 25%"
								type="text" id="descricaoconsulta" name="descricaoconsulta"
								placeholder="Pesquisar usuários" aria-label="Search">
							<button class="btn btn-outline-primary my-2 my-sm-0"
								type="submit" value="Pesquisar">Pesquisar</button>
						</form>
						<!--FIM = CAMPO DE PESQUISA -->
						<br>
						<div class="row">
							<div class="col-md-12 col-sm-12 ">
								<div class="x_panel">
									<div class="x_title">
										<h2>
											Lista <small>Usuário</small>
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
																<th scope="col">Login</th>
																<th scope="col">Foto</th>
																<th scope="col">Logado</th>
																<th scope="col">Nome</th>
																<th scope="col">Cargo</th>
																<th scope="col">CEP</th>
																<th scope="col">Rua</th>
																<th scope="col">Bairro</th>
																<th scope="col">Cidade</th>
																<th scope="col">Estado</th>
																<th scope="col">Status</th>
																<th scope="col">Fone</th>
																<th scope="col">Editar</th>
																<th scope="col">Excluir</th>
															</tr>
														</thead>

														<tbody>
															<c:forEach items="${listaUsuarios}" var="user">
																<tr>
																	<td><c:out value="${user.id}"></c:out></td>
																	<td><c:out value="${user.login}"></c:out></td>

																	<!--IF/ELSE se caso o usuario não quiser gravar foto no banco carrega uma padrao-->

																	<c:if test="${user.fotoBase64 != null}">
																		<td><a
																			href="salvarUsuario?acao=download&tipo=imagem&user=${user.id}"><img
																				src='<c:out value="${user.tempFotoUser}"/>'
																				alt="Imagem User" title="Imagem User" width="32px"
																				height="32px" /> </a></td>
																	</c:if>

																	<c:if test="${user.fotoBase64.isEmpty() == null}">
																		<td><img alt="Imagem User"
																			src="resources/images/userpadrao.png" width="32px"
																			height="32px" onclick="alert('Não possui imagem')"></td>
																	</c:if>
																	<!--IF/ELSE = FIM-->

																	<td>
																		<!-- Condicao para aparecer na tabela se o usuario esta On/off-->
																		<c:if test="${user.status_on == true}">
																			<p class="badge rounded-pill badge-success">ON</p>

																		</c:if> <c:if test="${user.status_on == false}">
																			<p class="badge rounded-pill badge-danger">OFF</p>
																		</c:if>
																	</td>
																	<!-- FIM On-line/offiline-->

																	<td><c:out value="${user.nome}"></c:out></td>
																	<td><c:out value="${user.funcao}"></c:out></td>
																	<td><c:out value="${user.cep}"></c:out></td>
																	<td><c:out value="${user.rua}"></c:out></td>
																	<td><c:out value="${user.bairro}"></c:out></td>
																	<td><c:out value="${user.cidade}"></c:out></td>
																	<td><c:out value="${user.estado}"></c:out></td>

																	<td>
																		<!-- Condicao para aparecer na tabela se o usuario esta ativo/inativo-->

																		<c:if test="${user.ativo == true}">
																			<p class="badge rounded-pill badge-success">ATIVO</p>

																		</c:if> <c:if test="${user.ativo == false}">
																			<p class="badge rounded-pill badge-danger">DESATIVADO</p>
																		</c:if>
																	</td>
																	<!-- FIM ativo/inativo-->


																	<!-- BOTÕES DE FONE, EDITAR E EXCLUIR-->
																	<td><a
																		href="salvarTelefones?acao=addFone&user=${user.id}"><img
																			alt="Telefones" title="Telefones"
																			src="resources/images/telefone.png" width="35px"
																			heigth="35px"></a></td>

																	<td><a
																		href="salvarUsuario?acao=editar&user=${user.id}"><img
																			alt="Editar" title="Editar"
																			src="resources/images/editar.png" width="30px"
																			heigth="30px"></a></td>


																	<td><a
																		href="salvarUsuario?acao=delete&user=${user.id}"
																		onclick><img
																			src="resources/images/excluir.png" alt="excluir"
																			title="Excluir" width="30px" height="30px"> </a></td>
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
			</div>

			<!-- Javscript para sumir o alerta automaticamente apos uma requisação feita pelo usuario. -->
			<script>
				window.setTimeout(function() {
					$(".alert").fadeTo(200, 0).slideUp(200, function() {
						$(this).remove();
					});
				}, 2000);
			</script>
			<!-- Fim -->
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
							var script = document.createElement('script');

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
</body>
</html>
