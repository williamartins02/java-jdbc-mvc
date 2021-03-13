package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.UsuarioBean;
import dao.DaoUsuario;

@WebServlet("/servletPesquisa")
public class PesquisaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private DaoUsuario daoUsuario = new DaoUsuario();// instanciando o DaoUsuario

	// 1 = Criando um metodo doPOst para pegar em forma de texto "descricaoPesquisa"
	// da um request e pegar o parametro da consulta ""descricaoPesquisa""
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String descricaoPesquisa = request.getParameter("descricaoconsulta");// Pegando a requisição do paramentro e
																				// levando pra tela

		if (descricaoPesquisa != null && !descricaoPesquisa.trim().isEmpty()) {// 2 = criando uma condição para chamar o objeto da lista, apos requisiçao de
																				// pesuisa List<BeanCursoJsp>" criando o atributo listaPesquisa e
																				// trazendo dentro do daoUsuario a lista das desccrição...
																				// descricao for difrente de null e diferente "trim() espaco vazio." 
			try {// 3 Lista a requisição de pesquisa do usuario

				List<UsuarioBean> listaPesquisa = daoUsuario.listar(descricaoPesquisa);
				RequestDispatcher view = request.getRequestDispatcher("/AdminUsuario.jsp");// Direcionando a pagina
				request.setAttribute("listaUsuarios", listaPesquisa);// carregando a lista de usuario filtrada com listaPesquisa"
				view.forward(request, response);// processo de redirecionamento de pagina. Enviando e recebendo resposta

			} catch (SQLException e) {

				e.printStackTrace();
			}
		} else {

			try { // 4 - direicionando a pagina com a lista de usuarios carregando todos
				RequestDispatcher view = request.getRequestDispatcher("/AdminUsuario.jsp");// Direcionando a pagina
				request.setAttribute("listaUsuarios", daoUsuario.listar());// carregando a pagina se não houver a pesquisa com a lista de usuario
				view.forward(request, response);// processo de redirecionamento de pagina. Enviando e recebendo resposta
			} catch (Exception e) {

				e.printStackTrace();
			} // fim try/cath

		} // fim if/Else

	}// fim metodo dopost

}// fim class
