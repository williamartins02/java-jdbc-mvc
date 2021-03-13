package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.UsuarioAcessoBean;
import beans.UsuarioBean;

import dao.DaoAcessoUsuario;
import dao.DaoLogin;
import dao.DaoUsuario;

//SERVLET PARA ELE INTEERCEPTAR DADOS E DA A RESPOSTA.
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  private DaoLogin daoLogin = new DaoLogin();
  
    public LoginServlet() {
        super(); 
    }
    
    //1� -  doGet sempre que a requisi��o que voc� faz n�o altere o estado do servidor, como uma consulta, uma busca e etc
    //GET intercepita quando vier de uma URL
    //Vamos deslogar aqui

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		
		if (action.equals("encerrar")) {//Session para destroi o usuario da sess�o
			
			HttpSession session = request.getSession();
			
			UsuarioBean usuarioLogado = (UsuarioBean) session.getAttribute("usuario");
			usuarioLogado.setStatus_on(false);//saiu da sess�o ele da status de Offline para o usuario
			
			DaoUsuario daoUsuario = new DaoUsuario();//instanciano o objeto
			
			daoUsuario.salvar(usuarioLogado);//salvando o usuario como Offline
			
			request.getSession().invalidate();//delosgando o usuario de vez
			response.sendRedirect(request.getContextPath());//redirecionando para tela
		}
	}
	

	//1� - O m�todo doPost envia dados para serem processados (por exemplo, dados de um formul�rio HTML)
	//2� - POST intercepitar o formulario por post, formulario sendo enviado
	protected void doPost(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		
	try {//try/catch Para exe��es de erros para validar o login e senha 
		
		UsuarioBean beanCursoJsp= new UsuarioBean();//instanciando da class BEAN os atributos
		
		//TRAZENDO DO FORMULARIOS OS PARAMETROS PARA O SERVLET
		String login = request.getParameter("login");//getParameter() retorna o valor em forma de string de um par�metro da requisi��o ou nulo se o par�metro n�o existir.
		String senha = request.getParameter("senha");
		
		
		
	if(login != null && !login.isEmpty() && senha != null && !senha.isEmpty()){//validando login e senha para saber se existe no banco
	
		
		if(daoLogin.validarLogin(login, senha) ) {//validando o login e senha para ter acesso ao sistema.
			DaoUsuario daoUsuario = new DaoUsuario();
			beanCursoJsp = daoUsuario.consultarLogin(login).get(0);// setando o nome do usuario direto do banco para mostrar o nome do usuario logado
		
			if (beanCursoJsp.isAtivo()) {//Verificando se o usuario � (ATIVO) acessa o sistema! (INATIVO) bloqueia.	
				UsuarioAcessoBean acessoUsuario = new UsuarioAcessoBean();//chamando os objeto
				DaoAcessoUsuario daoAcesso = new DaoAcessoUsuario();//chamando os objeto
				
				String ipAddress = request.getHeader("X-FORWARDED-FOR");  //Logica para gravar o acesso do Ip, Data e hora
				if (ipAddress == null) {  
					ipAddress = request.getRemoteAddr(); //setando os atributos para gravar a data no banco assim que entrar no sistema .
					acessoUsuario.setIp(ipAddress);
					acessoUsuario.setUsuario_id(beanCursoJsp.getId());
					daoAcesso.salvar(acessoUsuario);
				}
			
				beanCursoJsp.setStatus_on(true);//fun��o para ativar o usuario Online na tela.
				daoUsuario.salvar(beanCursoJsp);//salvando
				HttpServletRequest requisicao = (HttpServletRequest) request;//fazendo uma requis�o para todas paginas
				HttpSession sessao = requisicao.getSession();
				sessao.setAttribute("usuario", beanCursoJsp);// FIM setando o nome do usuario direto do banco para mostrar o nome do usuario logado'
				RequestDispatcher dispatcher = request.getRequestDispatcher("acessoliberado.jsp");	
				dispatcher.forward(request, response);
				
			} else {//usuario estiver inativo ele vai bloquear com a seguinte frase .
				RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
				request.setAttribute("userInativo", "Usu�rio est� bloqueado!");
				dispatcher.forward(request, response);
				
			}//fim ativo e inativo do usuario
			
		}else {//validar login e senha/ se � tiiver cadastrado vai da seguinte frase .
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
			request.setAttribute("SenhaErradaLogin", "Usu�rio ou senha inv�lida!");
			dispatcher.forward(request, response);	
			
		}//fim da valida��o do login e senha para sabe se existe cadastro no banco
	}
		
	
	}catch(Exception e) {
			e.printStackTrace();//Imprimir o erro na tela se caso houver.
	 }//fim try/catch validar loginh e senha.
		
	
	}//fim Dopost

}
