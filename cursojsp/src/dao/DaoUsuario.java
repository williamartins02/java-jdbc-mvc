package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import beans.UsuarioBean;
import connection.SingleConnection;



/*
 * Classe DaoUsuario
 * Classe Que Prov� os M�todos e Valida��es Para Manipular Dados, e Acesso e Manipula��o do BD
 */
public class DaoUsuario {

	private Connection connection;

	/*
	 * Construtor DaoUsuario()
	 * Recebe um Objeto connection da Classe SingleConnection
	 */
	public DaoUsuario() {
		connection = SingleConnection.getConnection();
	}

//=============================================================================================================================================

	/*
	 * M�todo salvar()
	 * Respons�vel Por Fazer a Inser��o de Dados (INSERT) no BD
	 * @param BeanCursoJsp usuario = Objeto Usu�rio da Classe BeanCursoJsp
	 */
	// metodo para realizar o insert no banco de dados, para cadastrar login e senha
	public void salvar(UsuarioBean usuario) {

		try {
			
			String sql = "";
			if (usuario.getId() == null) {
				sql +=	"insert into usuario(login, senha, nome, funcao, cep, rua, bairro, cidade, estado, ibge, fotobase64, contenttype, ativo, sexo, status_on ) "
						+ "values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";// fazendo o insert cadastro do login e senha
			} else {
				sql += "UPDATE usuario set login = ?, senha = ?, nome = ?, funcao = ?, cep = ?, rua = ?, bairro = ?, cidade=?, estado = ?, ibge= ?, fotobase64 = ?, "
						+ " contenttype = ?, ativo=?, sexo=?, status_on=?  WHERE id = " + usuario.getId();
			}
				
			PreparedStatement insert = connection.prepareStatement(sql);
			insert.setString(1, usuario.getLogin());// pegando atributos por posi��o de acordo que esta no banco para o insert
			insert.setString(2, usuario.getSenha());
			insert.setString(3, usuario.getNome());
			insert.setString(4, usuario.getFuncao());
			insert.setString(5, usuario.getCep());
			insert.setString(6, usuario.getRua());
			insert.setString(7, usuario.getBairro());
			insert.setString(8, usuario.getCidade());
			insert.setString(9, usuario.getEstado());
			insert.setString(10,usuario.getIbge());
			insert.setString(11,usuario.getFotoBase64());
			insert.setString(12,usuario.getContentType());
			insert.setBoolean(13,usuario.isAtivo());
			insert.setString(14, usuario.getSexo());
			insert.setBoolean(15, usuario.getStatus_on());//status online
			
			insert.execute();// realizando o insert no banco de dados.
			connection.commit();// Deu tudo certo da um commit para salvar no banco.
			
		} catch (Exception e) {
			e.printStackTrace();
			try {
				connection.rollback();// se der errado da um rollback para reverte.
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		}
	}// fim metodo insert
//=============================================================================================================================================	
	

	/*
	 * M�todo listar() pesquisar() consulatr() 'dei um refactor'
	 * Respons�vel Por Listar Todos os Usu�rios do Sistema
	 */
	
//=======================================================================================================================================================
	// Metodo para (listar) um objeto para pesquisa "List<BeanCursoJsp>" e retorna a pesquisa do usuario cadastrado
	public List<UsuarioBean> listar (String descricaoconsulta) throws SQLException{
		String sql = "SELECT * FROM usuario where login <> 'admin' and nome like'%"+ descricaoconsulta + "%' ORDER BY nome asc";// select os usuarios menos o admin do sistema/campo nome "like%%"consultar o nome no banco"
		                                                                                                                        //"%' ORDER BY nome asc" deixa a lista em ordem alfabetica 
		return consultarUsuarios(sql);
		
	}// fim do metodo Pesquisar
//=======================================================================================================================================================
	
	// Metodo para carregar e retorna uma lista de usuario cadastrado
	public List<UsuarioBean> listar() throws Exception {// por n�o ter upadte, insert a exec��o pode ser jogada pra cima (thrws Excpetion).
		String sql = "SELECT * FROM usuario where login <> 'admin' ORDER BY nome asc";// fazendo um select das requisi��es cadastrada dentro do banco...                                                          //escondendo admin do sistema com login <> 'admin'
		
		return consultarUsuarios(sql);
		
	}// fim do metodo listar
	
//=======================================================================================================================================================
	
	//metodo para Consultar usuario dentro do banco retorna atraves de uma array
   private List<UsuarioBean> consultarUsuarios(String sql) throws SQLException {
			List<UsuarioBean> listar = new ArrayList<UsuarioBean>();// instanciando uma lista do banco como ArrayList
			PreparedStatement statement = connection.prepareStatement(sql);// preparando o banco
			ResultSet resultSet = statement.executeQuery();// mostrar o resutado, e executar a query
   
	 while (resultSet.next()) {// criando o While/quando houver resultado continuar rodando

		UsuarioBean beanCursoJsp = new UsuarioBean();// intanciando objeto, para cada objeto setar algo. Exemplo: login,senha
		
		beanCursoJsp.setId(resultSet.getLong("id"));
		beanCursoJsp.setLogin(resultSet.getString("login"));// para cada objeto setar (login , senha )
		beanCursoJsp.setSenha(resultSet.getString("senha"));
		beanCursoJsp.setNome(resultSet.getString("nome"));
		beanCursoJsp.setFuncao(resultSet.getString("funcao"));
		
		beanCursoJsp.setCep(resultSet.getString("cep"));
		beanCursoJsp.setRua(resultSet.getString("rua"));
		beanCursoJsp.setBairro(resultSet.getString("bairro"));
		beanCursoJsp.setCidade(resultSet.getString("cidade"));
		beanCursoJsp.setEstado(resultSet.getString("estado"));
		beanCursoJsp.setIbge(resultSet.getString("ibge"));
		
		beanCursoJsp.setFotoBase64(resultSet.getString("fotobase64"));
		beanCursoJsp.setContentType(resultSet.getString("contenttype"));

		beanCursoJsp.setAtivo(resultSet.getBoolean("ativo"));
		beanCursoJsp.setStatus_on(resultSet.getBoolean("status_on"));
		beanCursoJsp.setSexo(resultSet.getString("sexo"));
		
		listar.add(beanCursoJsp);// adicionando objeto na lista
	}
	
	return listar;// vai da o retorno da lista que foi consultada
}// FIM - metodo para Consultar usuario dentro do banco
//============================================================================================================================================	

//============================================================================================================================================
	/*
	 * M�todo delete()
	 * Respons�vel Por Fazer a Exclus�o (Delete) no BD
	 * @param String id = Atributo ID do Usu�rio
	 */
	// metodo para deletar usuarios
	public void delete(String id) {// passando o paramentro do login

		try {
			String sql = "DELETE  FROM usuario WHERE id = ' "+ id +" ' and login <> 'admin' ";//deletando no banco de dados
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

//============================================================================================================================================
	/*
	 * M�todo consultar()
	 * Respons�vel Por Fazer Consultas (SELECT) no BD
	 * @param String id = Atributo ID do Usu�rio
	 */
	// metodo consultar usuario
	public List <UsuarioBean> consultar(String id) throws Exception {
		List <UsuarioBean> usuario = new ArrayList<UsuarioBean>();
		String sql = "SELECT * FROM usuario WHERE id ='" +id+ "' AND login <> 'admin'";
		return consultarUsuarios(sql);
	}
	
	
	/*
	 * M�todo consultar()
	 * Respons�vel Por Fazer Consultas (SELECT) no BD
	 * @param String id = Atributo ID do Usu�rio
	 */
	public List <UsuarioBean> consultarLogin(String login) throws Exception {
		List <UsuarioBean> usuario = new ArrayList<UsuarioBean>();
		String sql = "SELECT * FROM usuario WHERE login ='" +login+ "'";
		return consultarUsuarios(sql);
	}
	
//============================================================================================================================================

	
//============================================================================================================================================	
	
	/*
	 * M�todo validarLogina senha
	 * Respons�vel Por Validar Login(N�o Pode Existir 1 Mesmo Login Para 2 Usu�rios Diferentes)
	 * @param String login = Atributo Login do Usu�rio
	 */
	//Metodo para validar login, verificar se ja existe cadastrado
	
	public boolean validarLogin(String login) throws Exception {
		
		String sql = "SELECT count(1) as qtd FROM usuario WHERE login ='" + login+ "'";//count = validar e trazer para tela se ja existe o login cadastrado.
		PreparedStatement preparedStatement = connection.prepareStatement(sql);
		ResultSet resultSet = preparedStatement.executeQuery();
		
		if (resultSet.next()) {// se existe o usuario
			
			return resultSet.getInt("qtd") <= 0;//retorno true se n�o tiver login cadastrado
		}
		return false;// se tiver login existe retorna false.
	}
	
//============================================================================================================================================	
	
	/*
	 * M�todo validarSenha
	 * Respons�vel Por Validar Senha(N�o Pode Existir 1 Mesma Senha Para 2 Usu�rios Diferentes)
	 * @param String senha = Atributo Senha do Usu�rio
	 */
	public boolean validarSenha(String senha) throws Exception {
		String sql = "SELECT COUNT(1) as qtde FROM usuario WHERE senha = '"+ senha +"'";
		PreparedStatement preparedStatement = connection.prepareStatement(sql);
		ResultSet resultSet = preparedStatement.executeQuery();
			if(resultSet.next()) {
				return resultSet.getInt("qtde") <= 0;
			}
		return false;
	}
	
//=========================================================================================================================================
	

	
	
	
	
	
	
}// fim da class DaoUsuario
