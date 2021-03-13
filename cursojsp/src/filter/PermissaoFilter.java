package filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.UsuarioBean;

/**
 * metodo para não permitir acesso de telas via url.
 */
@WebFilter(urlPatterns = {"/cadastroUsuario.jsp", "/cadastroTelefones.jsp","/AdminCliente.jsp","/AdminProduto.jsp","/AdminUsuario.jsp" ,"/AdminTelefones.jsp","/cadastroCliente.jsp", "/cadastroProduto.jsp"})

public class PermissaoFilter implements Filter {
	
    public PermissaoFilter() {
        
    }

	public void destroy() {
		
	}

	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest requisicao = (HttpServletRequest) request;
		HttpSession sessao = requisicao.getSession();
		UsuarioBean usuarioLogado = (UsuarioBean) sessao.getAttribute("usuario");
		String url = requisicao.getRequestURI();
		
		if (!usuarioLogado.getLogin().equals("admin")) {
			HttpServletResponse resposta = (HttpServletResponse) response;
			RequestDispatcher view = requisicao.getRequestDispatcher("index.jsp");
			view.forward(requisicao, resposta);
		} else {
			chain.doFilter(request, response);
		}
	}

	
	public void init(FilterConfig fConfig) throws ServletException {
		
	}

}
