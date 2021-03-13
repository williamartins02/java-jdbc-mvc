package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.ProdutoBean;
import beans.UsuarioBean;
import dao.DaoProduto;
import dao.DaoUsuario;

@WebServlet("/salvarProduto")
public class ProdutoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private DaoProduto daoProduto = new DaoProduto();
	private DaoUsuario daoUsuario = new DaoUsuario();

	public ProdutoServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			String acao = request.getParameter("acao") != null ? request.getParameter("acao") : "listartodos";
			String produto = request.getParameter("produto");
			String user = request.getParameter("user");

			if (acao != null && acao.equalsIgnoreCase("delete")) {
				
				HttpSession session = request.getSession();
				UsuarioBean usuarioLogado = (UsuarioBean) session.getAttribute("usuario");
				daoProduto.delete(produto);

				if (usuarioLogado.getLogin().equalsIgnoreCase("admin")) {
					RequestDispatcher view = request.getRequestDispatcher("/AdminProduto.jsp");
					request.setAttribute("listarProdutos", daoProduto.listar());
					request.setAttribute("msgDelete", "Deletado");
					request.setAttribute("categorias", daoProduto.listarCategorias());
					view.forward(request, response);
				} else {
					RequestDispatcher view = request.getRequestDispatcher("/cadastroProduto.jsp");
					request.setAttribute("listarProdutos", daoProduto.listar());
					request.setAttribute("categorias", daoProduto.listarCategorias());
					request.setAttribute("msgDelete", "Deletado");
					view.forward(request, response);
				}

			} else if (acao != null && acao.equalsIgnoreCase("editar")) {
				
				ProdutoBean beanCursoJsp = daoProduto.consultar(produto);
				RequestDispatcher view = request.getRequestDispatcher("/AdminProduto.jsp");
				request.setAttribute("produto", beanCursoJsp);
				request.setAttribute("categorias", daoProduto.listarCategorias());
				view.forward(request, response);

			} else if (acao != null && acao.equalsIgnoreCase("listartodos")) {
				
				
				HttpSession session = request.getSession();
				UsuarioBean usuarioLogado = (UsuarioBean) session.getAttribute("usuario");

				if (usuarioLogado.getLogin().equalsIgnoreCase("admin")) {
					RequestDispatcher view = request.getRequestDispatcher("/AdminProduto.jsp");
					request.setAttribute("listarProdutos", daoProduto.listar());
					request.setAttribute("categorias", daoProduto.listarCategorias());
					view.forward(request, response);
				} else {
					RequestDispatcher view = request.getRequestDispatcher("/cadastroProduto.jsp");
					request.setAttribute("listarProdutos", daoProduto.listar());
					request.setAttribute("categorias", daoProduto.listarCategorias());
					view.forward(request, response);
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String acao = request.getParameter("acao");

		if (acao != null && acao.equalsIgnoreCase("reset")) {

			HttpSession session = request.getSession();
			UsuarioBean usuarioLogado = (UsuarioBean) session.getAttribute("usuario");

			try {

				if (usuarioLogado.getLogin().equalsIgnoreCase("admin")) {
					RequestDispatcher view = request.getRequestDispatcher("/AdminProduto.jsp");
					request.setAttribute("listarProdutos", daoProduto.listar());
					view.forward(request, response);
				} else {
					RequestDispatcher view = request.getRequestDispatcher("/cadastroProduto.jsp");
					request.setAttribute("listarProdutos", daoProduto.listar());
					request.setAttribute("categorias", daoProduto.listarCategorias());
					view.forward(request, response);

				}

			} catch (Exception e) {
				e.printStackTrace();
			}

		} else {

			String id = request.getParameter("id");
			String nome = request.getParameter("nome");
			String quantidade = request.getParameter("quantidade");
			String valor = request.getParameter("valor");
			String categoria = request.getParameter("categoria_id");

			ProdutoBean produto = new ProdutoBean();

			produto.setId(!id.isEmpty() ? Long.parseLong(id) : null);
			produto.setNome(nome);
			produto.setCategoria_id(Long.parseLong(categoria));

			if (quantidade != null && !quantidade.isEmpty()) {// tudo que tiver DOuble precisa criar o if.

				produto.setQuantidade(Double.parseDouble(quantidade));
			}
			if (valor != null && !valor.isEmpty()) {
				String valorParse = valor.replaceAll("\\,", ".");
				valorParse = valorParse.replaceAll("\\,", ".");
				produto.setValor(Double.parseDouble(valorParse));
			}

			try {
				
				HttpSession session = request.getSession();
				UsuarioBean usuarioLogado = (UsuarioBean) session.getAttribute("usuario");

				if (nome == null || nome.isEmpty()) {// validação "Login" "Nome" "Senha" "Telefone"
					request.setAttribute("msgProdNome", " 'Nome' ");

				} else if (quantidade == null || quantidade.isEmpty()) {
					request.setAttribute("msgQuanti", " 'Quantidade' ");

				} else if (valor == null || valor.isEmpty()) {
					request.setAttribute("msgValor", " 'Valor'");

				}

				else {
					if (id == null || id.isEmpty() && !daoProduto.validarNome(nome)) {
						request.setAttribute("msgErroCadastro", " 'Erro' ");
					}

					if (id == null || id.isEmpty() && daoProduto.validarNome(nome)) {
						request.setAttribute("msgSuccesso", "'Produto cadastrado'");
						daoProduto.salvar(produto);

					} else if (id != null && !id.isEmpty()) {
						daoProduto.atualizar(produto);

					}
				}
				if (usuarioLogado.getLogin().equalsIgnoreCase("admin")) {
					RequestDispatcher view = request.getRequestDispatcher("/cadastroProduto.jsp");
					request.setAttribute("listarProdutos", daoProduto.listar());
					request.setAttribute("categorias", daoProduto.listarCategorias());
					view.forward(request, response);
				} else {
					RequestDispatcher view = request.getRequestDispatcher("/cadastroProduto.jsp");
					request.setAttribute("listarProdutos", daoProduto.listar());
					request.setAttribute("categorias", daoProduto.listarCategorias());
					view.forward(request, response);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}

		}

	}

}
