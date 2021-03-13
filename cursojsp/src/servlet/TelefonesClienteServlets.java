package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.ClienteBean;
import beans.TelefoneCliente;
import beans.UsuarioBean;
import dao.DaoCliente;
import dao.DaoTelefonesCliente;

@WebServlet("/salvarTelefoneCliente")
public class TelefonesClienteServlets extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private DaoCliente daoCliente = new DaoCliente();
	private DaoTelefonesCliente daoTelefonesCliente = new DaoTelefonesCliente();

	public TelefonesClienteServlets() {
		super();

	}

	// metodo do get pegando via url
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {

			String acao = request.getParameter("acao");

			if (acao.endsWith("addFone")) {

				String user = request.getParameter("user");

				ClienteBean cliente = daoCliente.consultar(user).get(0);

				request.getSession().setAttribute("userCliente", cliente);
				request.setAttribute("userCliente", cliente);
				RequestDispatcher view = request.getRequestDispatcher("/AdminTelefonesCliente.jsp");
				request.setAttribute("telefone", daoTelefonesCliente.listar(cliente.getId()));
				request.setAttribute("Msgfone", "Salvo com sucesso!");
				view.forward(request, response);

			} else if (acao.endsWith("deleteFone")) {
				
				String telId = request.getParameter("telId");
				daoTelefonesCliente.delete(telId);
				
				ClienteBean clienteBean = (ClienteBean) request.getSession().getAttribute("userCliente");
				RequestDispatcher view = request.getRequestDispatcher("/AdminTelefonesCliente.jsp");
				request.setAttribute("telefone", daoTelefonesCliente.listar(clienteBean.getId()));
				request.setAttribute("MsgfoneDelete", "Telefone ");
				view.forward(request, response);

			}

		} catch (Exception e) {

			e.printStackTrace();
		}
	}

	// Metodo do post, enviando via url
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			ClienteBean clienteBean = (ClienteBean) request.getSession().getAttribute("userCliente");

			String numero = request.getParameter("numero");// pega numero
			String tipo = request.getParameter("tipo");// tipoo

			TelefoneCliente telefone = new TelefoneCliente();// setando para o objeto que quer salvar .
			telefone.setNumero(numero);
			telefone.setTipo(tipo);
			telefone.setUsuario(clienteBean.getId());

			daoTelefonesCliente.salvar(telefone);// invoquei o dao salvaou

			request.getSession().setAttribute("userCliente", clienteBean);
			request.setAttribute("userCliente", clienteBean);

			RequestDispatcher view = request.getRequestDispatcher("/AdminTelefonesCliente.jsp");
			request.setAttribute("telefone", daoTelefonesCliente.listar(clienteBean.getId()));
			request.setAttribute("Msgfone", "Salvo com sucesso!");
			view.forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
