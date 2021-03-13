package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.UsuarioBean;
import beans.TelefoneBean;
import dao.DaoTelefones;
import dao.DaoUsuario;

@WebServlet("/salvarTelefones")
public class TelefonesServlets extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private DaoUsuario daoUsuario = new DaoUsuario(); // consultar no banco para retornar o usuario dono do telefone

	private DaoTelefones daoTelefones = new DaoTelefones();

	public TelefonesServlets() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {

			String acao = request.getParameter("acao");
			String user = request.getParameter("user");// Pegou o usuario que quer add o telefone
			
			if(user != null) {//criando o redirecionamento para tela de cadastro via url
				
			UsuarioBean usuario = daoUsuario.consultar(user).get(0);// consultou no banco

			if (acao.equalsIgnoreCase("addFone")) {

				request.getSession().setAttribute("userEscolhido", usuario);// colocando ele na sessão, para poder controlar o telefone do usuario  cadastrado
				request.setAttribute("userEscolhido", usuario);

				// redirecionamento de tela.
				RequestDispatcher view = request.getRequestDispatcher("/AdminTelefones.jsp");// redirecionando para qual tela que queremos
				
				request.setAttribute("telefones", daoTelefones.listar(usuario.getId()));
				request.setAttribute("Msgfone", "Salvo com sucesso!");
				view.forward(request, response);

			} else if (acao.endsWith("deleteFone")) {

				String foneId = request.getParameter("foneId");
				daoTelefones.delete(foneId);

				UsuarioBean beanCursoJsp = (UsuarioBean) request.getSession().getAttribute("userEscolhido");
				RequestDispatcher view = request.getRequestDispatcher("/AdminTelefones.jsp");
				request.setAttribute("telefones", daoTelefones.listar(beanCursoJsp.getId()));
				request.setAttribute("MsgfoneDelete", "Telefone ");
				view.forward(request, response);

			}
			
		}else {//criando a condição para redirecionar para a tela de telefone via url, para manter na mesma tela ao clicar enter via url
			
			RequestDispatcher view = request.getRequestDispatcher("/AdminUsuario.jsp");
			request.setAttribute("listaUsuarios", daoUsuario.listar());
			view.forward(request, response);
		}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {

			UsuarioBean beanCursoJsp = (UsuarioBean) request.getSession().getAttribute("userEscolhido");// recuperando objeto na sessão que é o usuario

			String numero = request.getParameter("numero");// pegar o numero de telefone
			String tipo = request.getParameter("tipo");// tipo do telefone

			String acao = request.getParameter("acao");

			if (acao == null || (acao != null && !acao.equalsIgnoreCase("voltar"))) {
				
				if (numero == null || (numero != null && numero.isEmpty())){

					RequestDispatcher view = request.getRequestDispatcher("/AdminTelefones.jsp");
					request.setAttribute("telefones", daoTelefones.listar(beanCursoJsp.getId()));
					request.setAttribute("TelefoneErrado", " Por favor, ");
					view.forward(request, response);

				} else {

					TelefoneBean telefones = new TelefoneBean();// setando para o objeto que quero salvar.
					telefones.setNumero(numero);
					telefones.setTipo(tipo);
					telefones.setUsuario(beanCursoJsp.getId());// pegando dentro da class bean o usuario seu id.

					daoTelefones.salvar(telefones);// invocou o "dao" Salva!

					request.getSession().setAttribute("userEscolhido", beanCursoJsp);// colocando uuario na sessão, para poder cadastrar outro
					request.setAttribute("userEscollhido", beanCursoJsp);// jogando como atribbuto de request

					RequestDispatcher view = request.getRequestDispatcher("/AdminTelefones.jsp");// redirecinandopara tela de telefone.
					request.setAttribute("telefones", daoTelefones.listar(beanCursoJsp.getId()));// passando a lista detelefone para carregar na tela.
					request.setAttribute("msgTelefone", " Telefone ");// salvou apresenta uma tela de salvo com sucesso
					view.forward(request, response);
				}

			}else {// d tela de telefone aperta o botao voltar, volta para tela de cadastro de usuario.
				RequestDispatcher view = request.getRequestDispatcher("/AdminUsuario.jsp");
				request.setAttribute("listaUsuarios", daoUsuario.listar());
				view.forward(request, response);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
