package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.UsuarioBean;

@WebFilter(urlPatterns = { "/cadastroUsuario.jsp", "/cadastroTelefones.jsp", "/cadastroCliente.jsp", "/AdminCliente.jsp", "/AdminProduto.jsp", "/AdminUsuario.jsp", "/cadastroProduto.jsp", "/acessoliberado.jsp",
							 "/adminTelefone.jsp"})
public class Autenticacao implements Filter {

    //Default constructor. 
    public Autenticacao() {
    }

    //É executado quando a aplicação é interrompida
	public void destroy() {
		
	}

	//Filtro de autenticação
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest requisicao = (HttpServletRequest) request;
		HttpSession sessao = requisicao.getSession();
		
		//Captura a página raíz do sistema
		String autenticacao = requisicao.getContextPath();
		
		//Captura a URL da requisição
		String url = requisicao.getRequestURI();
		UsuarioBean usuarioLogado = (UsuarioBean) sessao.getAttribute("usuario");
		
		if(usuarioLogado == null && !url.equals(autenticacao)) {
			HttpServletResponse resposta = (HttpServletResponse) response;
			resposta.sendRedirect(autenticacao);
			return;
		}
		chain.doFilter(request, response);
	}

	//É executado na inicialização da aplicação
	public void init(FilterConfig fConfig) throws ServletException {
		
	}

}
