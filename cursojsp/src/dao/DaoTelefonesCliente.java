package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import beans.TelefoneBean;
import beans.TelefoneCliente;
import connection.SingleConnection;

/*
 * Classe DaoTelefone
 * Classe Que Prov� os M�todos e Valida��es Para Manipular Dados, e Acesso e Manipula��o do BD
 */
public class DaoTelefonesCliente {

	private Connection connection;
		
		/*
		 * Construtor DaoTelefone()
		 * Recebe um Objeto connection da Classe SingleConnection
		 */
		public DaoTelefonesCliente() {
			connection = SingleConnection.getConnection();
		}
		
		/*
		 * M�todo salvar()
		 * Respons�vel Por Fazer a Inser��o de Dados (INSERT) no BD
		 * @param BeanTelefone telefone = Objeto Telefone da Classes BeanTelefone
		 */
		public void salvar(TelefoneCliente telefoneCliente) {
			try {
				String sql = "INSERT INTO telefonecliente(numero, tipo, usuario) VALUES(?, ?, ?)";
				PreparedStatement insert = connection.prepareStatement(sql);
				insert.setString(1, telefoneCliente.getNumero());
				insert.setString(2, telefoneCliente.getTipo());
				insert.setLong(3, telefoneCliente.getUsuario());
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
		

		/*
		 * M�todo listar()
		 * Respons�vel Por Listar Todos os Telefones do Sistema
		 */
		public List<TelefoneCliente> listar(Long user) throws Exception {
			List<TelefoneCliente> listar = new ArrayList<TelefoneCliente>();
			
			String sql = "SELECT * FROM telefonecliente WHERE usuario = "+ user;
			PreparedStatement statement = connection.prepareStatement(sql);
			ResultSet resultSet = statement.executeQuery();
			
			while(resultSet.next()) {
				
				TelefoneCliente telefone = new TelefoneCliente();
				telefone.setId(resultSet.getLong("id"));
				telefone.setNumero(resultSet.getString("numero"));
				telefone.setTipo(resultSet.getString("tipo"));
				telefone.setUsuario(resultSet.getLong("usuario"));
				listar.add(telefone);
			}
			return listar;
		}
		
		/*
		 * M�todo delete()
		 * Respons�vel Por Fazer a Exclus�o (Delete) no BD
		 * @param String id = Atributo ID do Telefone
		 */
		public void delete(String id) {
			try {
				String sql = "DELETE FROM telefonecliente WHERE id = '"+ id +"'";
				PreparedStatement preparedStatement = connection.prepareStatement(sql);
				preparedStatement.execute();
				connection.commit();
				
			} catch (SQLException e) {
				e.printStackTrace();
				
				try {
					connection.rollback();
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
			}
		}
}
