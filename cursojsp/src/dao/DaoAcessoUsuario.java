package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import beans.UsuarioAcessoBean;
import beans.UsuarioBean;
import connection.SingleConnection;

/*
 * Classe DaoTelefone
 * Classe Que Provê os Métodos e Validações Para Manipular Dados, e Acesso e Manipulação do BD
 */
public class DaoAcessoUsuario {

	private Connection connection;
		
		/*
		 * Construtor DaoTelefone()
		 * Recebe um Objeto connection da Classe SingleConnection
		 */
		public DaoAcessoUsuario() {
			connection = SingleConnection.getConnection();
		}
		
		/*
		 * Método salvar()
		 * Responsável Por Fazer a Inserção de Dados (INSERT) no BD
		 * @param BeanTelefone telefone = Objeto Telefone da Classes BeanTelefone
		 */
		public void salvar(UsuarioAcessoBean acessoUsuario) {
			try {
				String sql = "INSERT INTO acessousuario (ip, usuario_id) VALUES(?, ?)";
				PreparedStatement insert = connection.prepareStatement(sql);
				insert.setString(1, acessoUsuario.getIp());
				insert.setLong(2, acessoUsuario.getUsuario_id());
				insert.execute();
				connection.commit();
			} catch(Exception e) {
				e.printStackTrace();
				try {
					connection.rollback();
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
			}
		}
		
	
		
		public void excluir(String string) {
				try {
					String sql = "DELETE  FROM acessousuario WHERE usuario_id = ' "+ string +" ' ";//deletando no banco de dados
					PreparedStatement preparedStatement = connection.prepareStatement(sql);//preparando o banco
					preparedStatement.execute();//executar para funcionar o delete

					connection.commit();//salvar se tudo de certo

				} catch (Exception e) {
					e.printStackTrace();

					try {
						connection.rollback();//ou rollback se de errado para reverte 
					} catch (SQLException e1) {
						e1.printStackTrace();
					}
				}

			}
		}
		
	
