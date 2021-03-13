<%@page import="beans.UsuarioBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html" charset=UTF-8>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />

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

	<!--======================== COMEÇO CABEÇALHO E MENU LATERAL================ -->
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
					<li class="nav-item active"><a href="acessoliberado.jsp" hidden="${permissao}" class="nav-link text-uppercase font-weight-bold">HOME <span
							class="sr-only"></span></a></li>

					<li class="nav-item"><a href="salvarUsuario?acao=listartodos"
						class="nav-link text-uppercase font-weight-bold"
						>USUÁRIO</a></li>

					<li class="nav-item"><a
						href="salvarCliente?acao=listartodos"
						class="nav-link text-uppercase font-weight-bold">CLIENTE</a></li>

					<li class="nav-item"><a href="salvarProduto?acao=listartodos"
						class="nav-link text-uppercase font-weight-bold">PRODUTOS</a></li>

					<li class="nav-item"><a href="#"
						class="nav-link text-uppercase font-weight-bold">RELATÓRIO</a></li>

					<li class="nav-item"><a href="LoginServlet?action=encerrar"
						class="nav-link text-uppercase font-weight-bold">SAIR</a></li>
				</ul>
			</div>

		</div>
	</div>
	</nav>
	</header>

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
			<li><a href="salvarUsuario?acao=listartodos" hidden="${permissao}"
				> <i class="fas fa-table"></i> TABELA
					USUÁRIOS
			</a></li>

			<li><a href="salvarCliente?acao=listartodos"> <i
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

			<li><a href="LoginServlet?action=encerrar"><em
					class="fa fa-power-off">&nbsp;</em> SAIR</a></li>
		</ul>
	</div>

	<!--======================== COMEÇO CABEÇALHO E MENU LATERAL "FIM"================ -->


	<div class="col-sm-9 col-sm-offset-3 col-lg-12 col-lg-offset-2 main"
		style="left: 245px; margin-top: 78px;">

		<div class="content-inner">
			<!-- content-->


			<!-- Page Header-->
			<div class="shadow-lg p-3 mb-5 bg-white">

				<caption>
					<h4>Cadastro usuários</h4>
				</caption>
				<br>
				<div class="container-md">


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
							<strong>${msgErro}</strong> Tente novamente!
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
							<strong>${msgLogin}</strong> deve ser informado.
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


					<!--=============================== Tabela de cadastro de USUARIO =======================================================-->

					<!--==========================Form========================================-->

					<form action="salvarUsuario?acao=salvar" method="post"
						id="formUser" enctype="multipart/form-data">

						<!-- Form-->

						<hr>

						<div class="form-row ">
							<div class="form-group col-md-1">
								<label for="inputEmail4">id:</label> <input type="text"
									class="form-control" readonly="readonly" value="${user.id}"
									id="id" name="id">
							</div>

							<div class="form-group col-md-2">
								<label for="inputPassword4">Login:</label> <input type="text"
									class="form-control" value="${user.login}" id="login"
									name="login" maxlength="10" placeholder="Digite login">
							</div>

							<div class="form-group col-md-2">
								<label for="inputCity">Senha:</label> <input type="text"
									class="form-control" value="${user.senha}" id="senha"
									name="senha" maxlength="10" placeholder="Digite senha">
							</div>

							<div class="form-group col-md-4">
								<label for="inputZip">Nome:</label> <input type="text"
									class="form-control" value="${user.nome}" id="nome" name="nome"
									maxlength="50" placeholder="Digite nome">
							</div>

							<!-- =========================== Selecte ===================================== -->

							<div class="form-group col-md-2">
								<label for="inputState">Perfil:</label> <select id="funcao"
									name="funcao" class="form-select">
									<option value="nao_informado">Selecione...</option>

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
								<!-- ====================================== FIM Selecte ======================================== -->


							</div>

						</div>

						<div class="form-row">

							<div class="form-group col-md-2">
								<label for="inputZip">CEP:</label> <input type="text"
									class="form-control" value="${user.cep}" id="cep" name="cep"
									maxlength="9" onblur="consultaCep();"
									placeholder="Somente números">
							</div>

							<div class="form-group col-md-1" style="padding-top: 32px;">
								<button type="button" class="btn btn-primary"
									onclick="pesquisacep(cep.value)">Pesquisar</button>
							</div>

							<div class="form-group col-md-3" Readonly>
								<label for="inputZip ">Rua:</label> <input type="text"
									class="form-control" value="${user.rua}" id="rua" name="rua"
									maxlength="50" placeholder="Nome da rua" readonly="readonly">
							</div>

							<div class="form-group col-md-2">
								<label for="inputZip">Bairro:</label> <input type="text"
									class="form-control" value="${user.bairro}" id="bairro"
									name="bairro" maxlength="50" placeholder="Bairro"
									readonly="readonly">
							</div>

							<div class="form-group col-md-2">
								<label for="inputZip">Cidade:</label> <input type="text"
									class="form-control" value="${user.cidade}" id="cidade"
									name="cidade" maxlength="50" placeholder="Cidade"
									readonly="readonly">
							</div>
							<div class="form-group col-md-1">
								<label for="inputZip">Estado:</label> <input type="text"
									class="form-control" value="${user.estado}" id="estado"
									name="estado" placeholder="Estado" readonly="readonly">
							</div>
						</div>


						<div class="form-row">

							<div class="form-check form-check-inline"
								style="padding-top: 32px;">
								<input class="form-check-input" type="radio" name="sexo"
									<%if (request.getAttribute("user") != null) {

	UsuarioBean user = (UsuarioBean) request.getAttribute("user");
	if (user.getSexo().equalsIgnoreCase("masculino")) {
		out.print("");
		out.print("checked=\"checked\"");
		out.print("");
	}
}%>
									value="masculino"> <label class="form-check-label"
									for="inlineRadio1">Masculino</label>
							</div>

							<div class="form-check form-check-inline"
								style="padding-top: 32px;">
								<input class="form-check-input" type="radio" name="sexo"
									<%if (request.getAttribute("user") != null) {

	UsuarioBean user = (UsuarioBean) request.getAttribute("user");
	if (user.getSexo().equalsIgnoreCase("feminino")) {
		out.print("");
		out.print("checked=\"checked\"");
		out.print("");
	}
}%>
									value="feminino"> <label class="form-check-label"
									for="inlineRadio2">Feminino</label>
							</div>
							<br>
							<!-- Criando checked, Qndo for editar o usuario para saber se esta ativo ou inativo -->
							<div class="form-check form-switch" style="padding-top: 32px;">



								<input class="form-check-input" type="checkbox" id="ativo"
									name="ativo" hidden
									<%if (request.getAttribute("user") != null) {
	UsuarioBean user = (UsuarioBean) request.getAttribute("user");
	if (user.isAtivo()) {
		out.print("");
		out.print("checked=\"checked\"");
		out.print("");
	}
}%>>

								<label class="form-check-label" for="flexSwitchCheckDefault"></label>
							</div>
							<!-- |FIM  editar esta ativo ou inativo -->

						</div>
						<br>

						<div class="form-row">
							<div class="form-group col-md-2">
								<label for="inputZip">Foto:</label> <input id="file" name="foto"
									type="file" value="${foto}" />
							</div>
						</div>


						<button class="btn btn-success" onClick="$(selector).click()"
							type="submit">Salvar</button>

						<button class="btn btn-danger" value="Cancelar"
							onclick="document.getElementById('formUser').action = 'salvarUsuario?acao=reset'">
							Cancelar</button>


					</form>
					<!--FIM Form-->
					<hr style="width: 100%; text-align: left; margin-left: 50">

					<!--FIM Container-->
				</div>
				<!--FIM Tabela de cadastro de usuario -->

				<br>





				<!--CAMPO DE PESQUISA -->

				<form class="form-inline mt-2 mt-md-0 justify-content-end "
					method="post" action="servletPesquisa">
					<input class="form-control mr-sm-2" style="width: 25%" type="text"
						id="descricaoconsulta" name="descricaoconsulta"
						placeholder="Pesquisar usuários" aria-label="Search">
					<button class="btn btn-outline-primary my-2 my-sm-0" type="submit"
						value="Pesquisar">Pesquisar</button>
				</form>
				<!--FIM = CAMPO DE PESQUISA -->

				<br>
				<div class="shadow-lg p-3 mb-5 bg-white rounded">
					<caption>Lista de cliente</caption>
					<table class="table table-striped table-hover">
						<!-- Tabela dos usuarios cadastrado -->


						<thead class="thead-dark  ">
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

							</tr>
						</thead>

						<c:forEach items="${listaUsuarios}" var="user">
							<tr>
								<td><c:out value="${user.id}"></c:out></td>
								<td><c:out value="${user.login}"></c:out></td>

								<!--IF/ELSE se caso o usuario não quiser gravar foto no banco carrega uma padrao-->

								<c:if test="${user.fotoBase64 != null}">
									<td><a
										href="salvarUsuario?acao=download&tipo=imagem&user=${user.id}"><img
											src='<c:out value="${user.tempFotoUser}"/>' alt="Imagem User"
											title="Imagem User" width="32px" height="32px" /> </a></td>
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
								<td><a href="salvarTelefones?acao=addFone&user=${user.id}"><img
										alt="Telefones" title="Telefones"
										src="resources/images/telefone.png" width="35px" heigth="35px"></a>
								</td>

								<td><a href="salvarUsuario?acao=editar&user=${user.id}"
									hidden="${permissao}">
									<img alt="Editar" title="Editar"
										src="resources/images/editar.png" width="30px" heigth="30px"></a></td>

								<td><a href="salvarUsuario?acao=delete&user=${user.id}"
									hidden="${permissao}"
									onclick="return confirm('Confirma a exclusao?');"><img
										src="resources/images/excluir.png" alt="excluir"
										title="Excluir" width="30px" height="30px"> </a></td>

								<!-- FIM = BOTÕES DE FONE, EDITAR E EXCLUIR-->


							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
	</div>

	<!--FIM Tabela dos Produtos cadastrado -->



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