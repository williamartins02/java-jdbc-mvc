package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.ClienteBean;
import dao.DaoCliente;

@WebServlet("/PesquisaClienteServlet")
public class PesquisaClienteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private DaoCliente daoCliente = new DaoCliente();

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String descricaoPesquisa = request.getParameter("descricaoconsulta");
		if (descricaoPesquisa != null && !descricaoPesquisa.trim().isEmpty()) {
			try {

				List<ClienteBean> listaPesquisa = daoCliente.listar(descricaoPesquisa);
				RequestDispatcher view = request.getRequestDispatcher("/AdminCliente.jsp");
				request.setAttribute("listarCliente", listaPesquisa);
				view.forward(request, response);

			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			try {
				RequestDispatcher view = request.getRequestDispatcher("/AdminCliente.jsp");
				request.setAttribute("listarCliente", daoCliente.listar());
				view.forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

}
