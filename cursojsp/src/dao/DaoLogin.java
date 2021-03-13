package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import connection.SingleConnection;

/*
 * Classe DaoLogin
 * Respons�vel Pela Autentica��o do Usu�rio
 */

//Class responsavel por acessar o banco de dados e validar login e senha.
public class DaoLogin {
	
	/*
	 * Objeto connection da Classe SingleConnection
	 * Como Atributo de Classe
	 */
	private Connection connection; 
	
	/*
	 * Construtor DaoLogin()
	 * Recebe o Objeto connection da Classe SingleConnection
	 */
	public DaoLogin() {//construtor para atribuir nossa conex��o de BD para Variavel SingeConnection
		connection = SingleConnection.getConnection();
	}
	
	/*
	 * M�todo validarLogin()
	 * Respons�vel Por Fazer a Verifica��o de Autentica��o no Sistema
	 * @param String login = Login do usuario
	 * @param String senha = Senha do usuario
	 */
	//criando um select para validar o login e senha direto do banco de dados
	public boolean validarLogin(String login, String senha) throws Exception {
		
		String sql = "select * from usuario where login = '" +login+ "'and senha = '"+ senha + "'";//buscando no banco de dados o login e senha
		PreparedStatement statement = connection.prepareStatement(sql);//instru��o para o banco de dados, preparando o banco.
		ResultSet resultSet = statement.executeQuery();
		
		  if(resultSet.next()) {// criar um if/else se caso houver usuario cadastrado.
			  
			  return true;  //possui usuario
		  }else {
			  
			  return false;// n�o validou usuario.
			  
		  }
	}
	
	
}
