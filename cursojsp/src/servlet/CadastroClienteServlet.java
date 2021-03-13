package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.ClienteBean;
import beans.UsuarioBean;
import dao.DaoCliente;
import dao.DaoUsuario;

@WebServlet("/salvarCliente")
@MultipartConfig // função para converte foto em binario

public class CadastroClienteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private DaoCliente daoCliente = new DaoCliente(); // instanciando da class DaoUsuario
	private DaoUsuario daoUsuario = new DaoUsuario(); // instanciando da class DaoUsuario

	public CadastroClienteServlet() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {// tryCath
			String acao = request.getParameter("acao");// criando uma ação para exclusão
			String user = request.getParameter("user");// pegando qual o usuario para a ação de exclusão.
			
			
			if (acao != null && acao.equalsIgnoreCase("delete") && user != null) {
			
				HttpSession session = request.getSession();
				UsuarioBean usuarioLogado = (UsuarioBean) session.getAttribute("usuario");
				daoCliente.delete(user);

				if (usuarioLogado.getLogin().equalsIgnoreCase("admin")) {
					RequestDispatcher view = request.getRequestDispatcher("/AdminCliente.jsp");
					request.setAttribute("listarCliente", daoCliente.listar());
					request.setAttribute("msgDelete", "Deletado");
					view.forward(request, response);
				} else{
					RequestDispatcher view = request.getRequestDispatcher("/AdminCliente.jsp");
					request.setAttribute("listarCliente", daoCliente.listar());
					request.setAttribute("msgDelete", "Deletado");
					view.forward(request, response);
				}
				
			}else if (acao != null && acao.equalsIgnoreCase("editar")) {// Criando uma ação para EDITAR
				
				HttpSession session = request.getSession();
				UsuarioBean usuarioLogado = (UsuarioBean) session.getAttribute("usuario");
				
				if (usuarioLogado.getLogin().equalsIgnoreCase("admin")) {
					RequestDispatcher view = request.getRequestDispatcher("/AdminCliente.jsp");
					request.setAttribute("listarCliente", daoCliente.listar());
					view.forward(request, response);
				}else {
					RequestDispatcher view = request.getRequestDispatcher("/cadastroCliente.jsp");// Direcionando a pagina
					request.setAttribute("listarCliente", daoCliente.listar());// carregando a lista de usuario
					view.forward(request, response);
				}
				// criando ResqueteDispacher para tabela fixar no navegador
			} else if (acao != null && acao.equalsIgnoreCase("listartodos")) {// pegar nossa ação, "equalsIgnoreCase" diz dependente se é Letra minu ou  maisc e listar todo os usuarios.
				
				HttpSession session = request.getSession();
				UsuarioBean usuarioLogado = (UsuarioBean) session.getAttribute("usuario");

				if (usuarioLogado.getLogin().equalsIgnoreCase("admin")) {
					RequestDispatcher view = request.getRequestDispatcher("/AdminCliente.jsp");
					request.setAttribute("listarCliente", daoCliente.listar());
					view.forward(request, response);
				} else {
					RequestDispatcher view = request.getRequestDispatcher("cadastroCliente.jsp");
					request.setAttribute("listarCliente", daoCliente.listar());
					view.forward(request, response);
				}
				
				//converter um arrays em jsom para passar para o modal..
			}
		} catch (Exception e) {
			e.printStackTrace();
		} // FIM tryCath
	}// fim do metodo DoGet

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String acao = request.getParameter("acao");

		if (acao != null && acao.equalsIgnoreCase("reset")) {// criando condição para resetar sem salvar, e sim da um resete no form

			RequestDispatcher view = request.getRequestDispatcher("/cadastroCliente.jsp");// Direcionando a pagina

			try {
				// seta objetos para serem mostrados em tela, por exemplo ae a lista de cadastrados
				request.setAttribute("listarCliente", daoCliente.listar());
			} catch (Exception e) {
				e.printStackTrace();
			}
			view.forward(request, response);// notifica o navegadorS

		} else if (acao != null && acao.equalsIgnoreCase("salvar")) {
			
			HttpSession session = request.getSession();
			UsuarioBean usuarioLogado = (UsuarioBean) session.getAttribute("usuario");

			// salvando no banco.
			String id = request.getParameter("id");// request= "são requisição que esta vindo da tela - getPramanter é os atributos a receber"
			String nome = request.getParameter("nome");// getParameter : pega os valores que vem de um formulario preenchido.
			String sobrenome = request.getParameter("sobrenome");
			String cpf = request.getParameter("cpf");
			String estadocivil = request.getParameter("estadocivil");
			String email = request.getParameter("email");
			String sexo = request.getParameter("sexo");
			String cep = request.getParameter("cep");
			String rua = request.getParameter("rua");
			String bairro = request.getParameter("bairro");
			String cidade = request.getParameter("cidade");
			String estado = request.getParameter("estado");

			ClienteBean cliente = new ClienteBean(); // instanciando objetove os atributos e get e set da classBeanCursoJsp.java

			cliente.setId((id != null && !id.isEmpty()) ? Long.parseLong(id) : null);// id fordiferentede vazio(isEmpty), então vai fazer a conversão setar 0
			cliente.setIdUsuario(usuarioLogado.getId());
			cliente.setNome(nome);// setar todos atributos para o banco
			cliente.setSobrenome(sobrenome);
			cliente.setCpf(cpf);
			cliente.setEstadocivil(estadocivil);
			cliente.setEmail(email);
			cliente.setSexo(sexo);
			cliente.setCep(cep);
			cliente.setBairro(bairro);
			cliente.setCidade(cidade);
			cliente.setEstado(estado);
			cliente.setRua(rua);

			try {
				// para salvar a condição a baixo faz verificação no BD para ver se existe o
				// login , retornando true ou false
				// VERIFICANDO O LOGIN DO USUARIO E RETORNANDO COM MSG DE ERRO OU SUCESSO.
				/* " inicio " Validação de dados */

				if (cpf == null || cpf.isEmpty()) {// validação "Login" "Nome" "Senha" "Telefone"
					request.setAttribute("msgCpf", "CPF");

				} else if (email == null || email.isEmpty()) {
					request.setAttribute("msgEmail", "E-mail");

				} else {

					if (id == null || id.isEmpty() && !daoCliente.validarCpf(cpf)) {// validando para verse jaexiste loginno cadastrado
						request.setAttribute("msgCpf", " (Erro) Usuário ja cadastrado.");// dando alerta para o usuariona telaque ja existe o login.
					} else {
						request.setAttribute("msgSuccess", "Seja bem-vindo!");// dando alerta usuario cadastrado com sucesso
						daoCliente.salvar(cliente);
					}

				}
				/* " FIM " Validação de dados */

				// criando um despache e setar uma variavel para imprimir a lista de usuario
				// para ficar na mesma pagina apos cadastra novo usuario.
				
				if (usuarioLogado.getLogin().equalsIgnoreCase("admin")) {
					RequestDispatcher view = request.getRequestDispatcher("/AdminCliente.jsp");
					request.setAttribute("listarCliente", daoCliente.listar());
					view.forward(request, response);
				}else {
					
					RequestDispatcher view = request.getRequestDispatcher("/cadastroCliente.jsp");// Direcionando a pagina
					request.setAttribute("listarCliente", daoCliente.listar());// carregando a lista de usuario
					view.forward(request, response);// processo de redirecionamento de pagina. Enviando e recebendo resposta
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		} // fim da verificaçãoS

	}// fim metodo DoPost

}
