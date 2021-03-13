package servlet;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.math.BigInteger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import beans.UsuarioBean;
import dao.DaoUsuario;

@WebServlet("/salvarUsuario")
@MultipartConfig // função para converte foto em binario
public class UsuarioServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private DaoUsuario daoUsuario = new DaoUsuario();

	public UsuarioServlet() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String acao = request.getParameter("acao");
			String user = request.getParameter("user");

			if (acao != null && acao.equalsIgnoreCase("delete") && user != null) {

				HttpSession session = request.getSession();
				UsuarioBean usuarioLogado = (UsuarioBean) session.getAttribute("usuario");

				daoUsuario.delete(user);

				if (usuarioLogado.getLogin().equalsIgnoreCase("admin")) {
					RequestDispatcher view = request.getRequestDispatcher("/AdminUsuario.jsp");
					request.setAttribute("listaUsuarios", daoUsuario.listar());
					request.setAttribute("msgDelete", "Deletado");
					view.forward(request, response);

				} else {
					RequestDispatcher view = request.getRequestDispatcher("/AdminUsuario.jsp");
					request.setAttribute("listaUsuarios", daoUsuario.listar());
					request.setAttribute("msgDelete", "Deletado");
					view.forward(request, response);

				}

			} else if (acao != null && acao.equalsIgnoreCase("editar")) {
				
				UsuarioBean beanCursoJs = daoUsuario.consultar(user).get(0);
				HttpSession session = request.getSession();
				UsuarioBean usuarioLogado = (UsuarioBean) session.getAttribute("usuario");

				
				RequestDispatcher view = request.getRequestDispatcher("/AdminUsuario.jsp");
				request.setAttribute("user", beanCursoJs);
				view.forward(request, response);

			} else if (acao != null && acao.equalsIgnoreCase("listarTodos")) {

				HttpSession session = request.getSession();
				UsuarioBean usuarioLogado = (UsuarioBean) session.getAttribute("usuario");

				if (usuarioLogado.getLogin().equalsIgnoreCase("admin")) {
					RequestDispatcher view = request.getRequestDispatcher("/AdminUsuario.jsp");
					request.setAttribute("listaUsuarios", daoUsuario.listar());
					view.forward(request, response);
				} else {
					RequestDispatcher view = request.getRequestDispatcher("/AdminUsuario.jsp");
					request.setAttribute("listaUsuarios", daoUsuario.listar());
					view.forward(request, response);
				}

			} else if (acao != null && acao.equalsIgnoreCase("downloud")) {
				UsuarioBean usuario = daoUsuario.consultar(user).get(0);

				if (usuario != null);
				response.setHeader("content-Disposition",
						"attachment;filename=arquivo." + usuario.getContentType().split("\\/")[1]);

				/* Converte a base64 da imagem do banco para byte */
				byte[] imageFotoBytes = new Base64().decodeBase64(usuario.getFotoBase64());

				/* coloca os bytes em um ojeto de entrada para processar */
				InputStream is = new ByteArrayInputStream(imageFotoBytes);

				/* inicio da resposta para o navegador */
				int read = 0;
				byte[] bytes = new byte[1024];
				OutputStream os = response.getOutputStream();

				while ((read = is.read(bytes)) != -1) {
					os.write(bytes, 0, read);
				}

				os.flush();
				os.close();
				// FIM baixar imagens

			} else {
				RequestDispatcher view = request.getRequestDispatcher("/AdminUsuario.jsp");
				request.setAttribute("listaUsuarios", daoUsuario.listar());
				view.forward(request, response);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}// fim do metodo DoGet

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String acao = request.getParameter("acao");

		if (acao != null && acao.equalsIgnoreCase("reset")) {// criando condição para resetar sem salvar, e sim da um
																// resete no form

			RequestDispatcher view = request.getRequestDispatcher("/AdminUsuario.jsp");// Direcionando a pagina

			try {
				// seta objetos para serem mostrados em tela, por exemplo ae a lista de
				// cadastrados
				request.setAttribute("listaUsuarios", daoUsuario.listar());

			} catch (Exception e) {
				e.printStackTrace();
			}
			view.forward(request, response);// notifica o navegadorS

		} else if (acao != null && acao.equalsIgnoreCase("salvar")) {

			// salvando no banco.
			String id = request.getParameter("id");
			String login = request.getParameter("login");
			String senha = request.getParameter("senha");
			String nome = request.getParameter("nome");
			String funcao = request.getParameter("funcao");
			String cep = request.getParameter("cep");
			String rua = request.getParameter("rua");
			String bairro = request.getParameter("bairro");
			String cidade = request.getParameter("cidade");
			String estado = request.getParameter("estado");
			String ibge = request.getParameter("ibge");
			String sexo = request.getParameter("sexo");

			UsuarioBean usuario = new UsuarioBean();// setando os objeto do UsuarioBean

			usuario.setId((id != null && !id.isEmpty()) ? Long.parseLong(id) : null);
			usuario.setLogin(login);
			usuario.setSenha(senha);
			usuario.setNome(nome);
			usuario.setFuncao(funcao);
			usuario.setCep(cep);
			usuario.setRua(rua);
			usuario.setBairro(bairro);
			usuario.setCidade(cidade);
			usuario.setEstado(estado);
			usuario.setIbge(ibge);
			usuario.setSexo(sexo);

			usuario.setStatus_on(false);
			if (request.getParameter("ativo") != null && request.getParameter("ativo").equalsIgnoreCase("on")) { // inativo
				usuario.setAtivo(true);
			} else {
				usuario.setAtivo(false);
			}

			try {

				HttpSession session = request.getSession();
				UsuarioBean usuarioLogado = (UsuarioBean) session.getAttribute("usuario");

				if (ServletFileUpload.isMultipartContent(request)) {
					Part imagemFoto = request.getPart("foto");

					if (imagemFoto != null && imagemFoto.getInputStream().available() > 0) {
						byte[] bytesImagem = converteStremParabyte(imagemFoto.getInputStream());
						String fotoBase64 = new Base64().encodeBase64String(bytesImagem);
						usuario.setFotoBase64(fotoBase64);
						usuario.setContentType(imagemFoto.getContentType());
					} else {
						usuario.setFotoBase64(request.getParameter("fotoTemp"));
						usuario.setContentType(request.getParameter("contetTypeTemp"));
					}

				} /* " FIM " File upload de imagems */

				if (login == null || login.isEmpty()) {// validação "Login" "Nome" "Senha" "Telefone"
					request.setAttribute("msgLogin", "Login");

				} else if (senha == null || senha.isEmpty()) {
					request.setAttribute("msgSenha", "Senha");
				} else if (nome == null || nome.isEmpty()) {
					request.setAttribute("msgNome", "Nome");
				} else {

					if (id == null || id.isEmpty() && !daoUsuario.validarLogin(login)) {
						request.setAttribute("msgErro", " (Erro) Usuário ja cadastrado.");
					}
					if (id == null || id.isEmpty() && daoUsuario.validarLogin(login)) {
						request.setAttribute("msgSuccess", "Seja bem-vindo!");
						daoUsuario.salvar(usuario);
					} else if (id != null && !id.isEmpty()) {
						daoUsuario.salvar(usuario);

					}
				} /* " FIM " Validação de dados */

				if (usuarioLogado.getLogin().equalsIgnoreCase("admin")) {
					RequestDispatcher view = request.getRequestDispatcher("/AdminUsuario.jsp");
					request.setAttribute("listaUsuarios", daoUsuario.listar());
					view.forward(request, response);
				} else {
					RequestDispatcher view = request.getRequestDispatcher("/AdminUsuario.jsp");
					request.setAttribute("listaUsuarios", daoUsuario.listar());
					view.forward(request, response);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}

		}
	}

	private byte[] converteStremParabyte(InputStream imagem) throws Exception {

		ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
		int reads = imagem.read();

		while (reads != -1) {
			byteArrayOutputStream.write(reads);
			reads = imagem.read();
		}
		return byteArrayOutputStream.toByteArray();
	}
}
