package filter;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

import connection.SingleConnection;

//filter serve para intercepitar requisão e validar para o servidor = todas as requisições respostas passarão pelo filtro
// 1º = Tudo que for mandado pelo usuario por exemplo (cadastro de um formulario)...
// 2ª = O filter vai intercepitar, apos passar pela restrição do filter...
// 3º = Vai liberar para executar do lado do servidor (Servlet)..
// 4º = Apos passar pelo servidor, o servido vai mandar a resposta sem precisa passar novamente pelo Filter.

@WebFilter(urlPatterns = { "/*" }) // Da um UrlPatterns = toda url vai ser intercepitada, toda requisição e resposta vai passar pelo Filter.

//Class Filter é padrão WEB, que extende e implementa a interface FILTER, ele vai interceptar as requisições e levantar a conexão
public class Filter implements javax.servlet.Filter {

	private static Connection connection;// CRIAR esse static para poder nosso filter receber a conexão que foi iniciada

	@Override
	public void destroy() {

	}

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1, FilterChain arg2)
			throws IOException, ServletException {
		arg2.doFilter(arg0, arg1);
		try {
			
			connection.commit();// Se correr tudo bem, ele vai salvar.
		} catch (Exception e) {
			e.printStackTrace();
			
			try {
				e.printStackTrace();// se der erro, imprimir no console o erro.
				connection.rollback();// se der erro, vai da um 'rollback' para reverte.	
				
			} catch (SQLException e1) {
				e1.printStackTrace();// se der erro, imprimir no console o erro.
			}

		}
	}

	//init é pra executar apenas levantamento de banco de dado.
	@Override
	public void init(FilterConfig arg0) throws ServletException {
		connection = SingleConnection.getConnection();// Chamando o "SingleConnection" para levantar a conexção
	}

}//fim class filter implement 
