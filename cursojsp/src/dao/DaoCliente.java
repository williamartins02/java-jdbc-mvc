package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import beans.ClienteBean;
import beans.ProdutoBean;
import beans.UsuarioBean;
import connection.SingleConnection;

public class DaoCliente {

	private Connection connection;

	public DaoCliente() {
		connection = SingleConnection.getConnection();
	}

	public void salvar(ClienteBean cadastrocliente) {

		try {
			
			String sql="";
			if(cadastrocliente.getId() == null) {
				sql += "insert into cadastrocliente(id_usuario, nome, sobrenome, cpf, estadocivil, email,  sexo, cep, bairro, cidade, estado, rua)" //aqui tem 12
						+ "values (?,?,?,?,?,?,?,?,?,?,?,?)";
			}else {
				sql += "update cadastrocliente set  id_usuario = ?, nome=?, sobrenome=?, cpf=?, estadocivil=?, email=?, sexo=?, cep=?, bairro=?, cidade=?, estado=?, rua=? WHERE id = '" + cadastrocliente.getId() + "'";
			}
			
			PreparedStatement insert = connection.prepareStatement(sql);
			insert.setLong(1, cadastrocliente.getIdUsuario());
			insert.setString(2, cadastrocliente.getNome());
			insert.setString(3, cadastrocliente.getSobrenome());
			insert.setString(4, cadastrocliente.getCpf());
			insert.setString(5, cadastrocliente.getEstadocivil());
			insert.setString(6, cadastrocliente.getEmail());
			insert.setString(7, cadastrocliente.getSexo());
			insert.setString(8, cadastrocliente.getCep());
			insert.setString(9, cadastrocliente.getBairro());
			insert.setString(10,cadastrocliente.getCidade());
			insert.setString(11,cadastrocliente.getEstado());
			insert.setString(12,cadastrocliente.getRua());
			
			
			
			insert.execute();
			connection.commit();

		} catch (Exception e) {
			e.printStackTrace();
			try {
				
			}catch(Exception e1) {
				e1.printStackTrace();
			}
		}

	}
	
//============================================================================================================================================

	
	// Metodo para (listar) um objeto para pesquisa "List<BeanCursoJsp>" e retorna a pesquisa do usuario cadastrado
       public List<ClienteBean> listar (String descricaoconsulta) throws SQLException{
    	   String sql = "SELECT * FROM cadastrocliente where nome like'%"+ descricaoconsulta + "%' ORDER BY nome asc";// select os usuarios menos o admin do sistema/campo nome "like%%"consultar o nome no banco"
		                                                                                                                        //"%' ORDER BY nome asc" deixa a lista em ordem alfabetica 
		return consultarCliente(sql);
		
	}// fim do metodo Pesquisar
       

//=======================================================================================================================================================
	// Metodo para carregar e retorna uma lista de usuario cadastrado
	public List<ClienteBean> listar() throws Exception {// por não ter upadte, insert a execção pode ser jogada pra cima (thrws Excpetion).
		String sql = "select * from cadastrocliente";// fazendo um select das requisições cadastrada dentro do banco...                                                          //escondendo admin do sistema com login <> 'admin'
		
		return consultarCliente(sql);
		
	}// fim do metodo listar
	
//=======================================================================================================================================================
	
	//metodo para Consultar usuario dentro do banco retorna atraves de uma array
   private List<ClienteBean> consultarCliente(String sql) throws SQLException {
			List<ClienteBean> listar = new ArrayList<ClienteBean>();// instanciando uma lista do banco como ArrayList
			
			PreparedStatement statement = connection.prepareStatement(sql);// preparando o banco
			ResultSet resultSet = statement.executeQuery();// mostrar o resutado, e executar a query
   
	while (resultSet.next()) {// criando o While/quando houver resultado continuar rodando

		 ClienteBean clienteBean = new ClienteBean();// intanciando objeto, para cada objeto setar algo. Exemplo: login,senha
		
		 clienteBean.setId(resultSet.getLong("id"));
		 clienteBean.setIdUsuario(resultSet.getLong("id_usuario"));
		 clienteBean.setNome(resultSet.getString("nome"));// para cada objeto setar (login , senha )
		 clienteBean.setSobrenome(resultSet.getString("sobrenome"));
		 clienteBean.setCpf(resultSet.getString("cpf"));
		 clienteBean.setEstadocivil(resultSet.getString("estadocivil"));
		 clienteBean.setEmail(resultSet.getString("email"));
		 clienteBean.setSexo(resultSet.getString("sexo"));
		 clienteBean.setCep(resultSet.getString("cep"));
		 clienteBean.setRua(resultSet.getString("rua"));
		 clienteBean.setBairro(resultSet.getString("bairro"));
		 clienteBean.setCidade(resultSet.getString("cidade"));
		 clienteBean.setEstado(resultSet.getString("estado"));
		
		listar.add(clienteBean);// adicionando objeto na lista
	}
	
	return listar;// vai da o retorno da lista que foi consultada
}
	
 //============================================================================================================================================
 	/*
 	 * Método delete()
 	 * Responsável Por Fazer a Exclusão (Delete) no BD
 	 * @param String id = Atributo ID do Usuário
 	 */
 	// metodo para deletar usuarios
 	public void delete(String id) {// passando o paramentro do login

 		try {
 			String sql = "DELETE FROM cadastrocliente WHERE id =" + id;
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

 	}// fim do metordo deletar.
 	
 //============================================================================================================================================
 		/*
 		 * Método consultar()
 		 * Responsável Por Fazer Consultas (SELECT) no BD
 		 * @param String id = Atributo ID do Usuário
 		 */
 		// metodo consultar usuario
 		public List <ClienteBean> consultar(String id) throws Exception {
 			List <ClienteBean> cliente = new ArrayList<ClienteBean>();
 			String sql = "SELECT * FROM cadastrocliente WHERE id = '" +id+ "'";
 			return consultarCliente(sql);
 		}
 		
 		/*
 		 * Método consultar()
 		 * Responsável Por Fazer Consultas (SELECT) no BD
 		 * @param String id = Atributo ID do Usuário
 		 */
 		public List <ClienteBean> consultarNome(String nome) throws Exception {
 			List <ClienteBean> cliente = new ArrayList<ClienteBean>();
 			String sql = "SELECT * FROM cadastrocliente WHERE nome = '" +nome+ "'";
 			return consultarCliente(sql);
 		}
 //============================================================================================================================================ 		
 		/*
 		 * Método validarEmail 
 		 * 
 		 *
 		 */
 		//Metodo para validar email, verificar se ja existe cadastrado
 		
 		public boolean validarEmail(String email) throws Exception {
 			
 			String sql = "SELECT count(1) as qtd FROM cadastrocliente WHERE email ='" + email+ "'";//count = validar e trazer para tela se ja existe o login cadastrado.
 			PreparedStatement preparedStatement = connection.prepareStatement(sql);
 			ResultSet resultSet = preparedStatement.executeQuery();
 			
 			if (resultSet.next()) {// se existe o usuario
 				
 				return resultSet.getInt("qtd") <= 0;//retorno true se não tiver email cadastrado
 			}
 			return false;// se tiver login existe retorna false.
 		}
 		
 	//============================================================================================================================================	
 		
 		/*
 		 * Método validarCPF do cliente
 		 * 
 		 * 
 		 */
 		public boolean validarCpf(String cpf) throws Exception {
 			String sql = "SELECT COUNT(1) as qtde FROM cadastrocliente WHERE cpf = '"+ cpf +"'";
 			PreparedStatement preparedStatement = connection.prepareStatement(sql);
 			ResultSet resultSet = preparedStatement.executeQuery();
 				if(resultSet.next()) {
 					return resultSet.getInt("qtde") <= 0;
 				}
 			return false;
 		}
}
