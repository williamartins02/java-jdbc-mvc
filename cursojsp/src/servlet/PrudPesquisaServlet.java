package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.ProdutoBean;
import dao.DaoProduto;

/**
 * Servlet implementation class PrudPesquisaServlet
 */
@WebServlet("/prudPesquisaServlet")
public class PrudPesquisaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private DaoProduto daoProduto = new DaoProduto();

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String descricaoProdPesquisa = request.getParameter("produconsulta");
		if (descricaoProdPesquisa != null && !descricaoProdPesquisa.trim().isEmpty()) {
			try {

				List<ProdutoBean> listaPesquisaProd = daoProduto.listar(descricaoProdPesquisa);

				RequestDispatcher view = request.getRequestDispatcher("/AdminProduto.jsp");
				request.setAttribute("listarProdutos", listaPesquisaProd);
				view.forward(request, response);

			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			try {
				RequestDispatcher view = request.getRequestDispatcher("/AdminProduto.jsp");
				request.setAttribute("listarProdutos", daoProduto.listar());
				view.forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

}
