package dao;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import beans.CategoriaBean;
import beans.ProdutoBean;
import connection.SingleConnection;

/*
 * Classe DaoProduto
 * Classe Que Prov� os M�todos e Valida��es Para Manipular Dados, e Acesso e Manipula��o do BD
 */
public class DaoProduto {

	private Connection connection;

	/*
	 * Construtor DaoProduto() Recebe um Objeto connection da Classe
	 * SingleConnection
	 */
	public DaoProduto() {
		connection = SingleConnection.getConnection();
	}

//===============================================================================================================================

	/*
	 * M�todo salvar() Respons�vel Por Fazer a Inser��o de Dados (INSERT) no BD
	 * 
	 * @param BeanProduto produto = Objeto Produto da Classe BeanProduto
	 */
	public void salvar(ProdutoBean produto) {

		try {

			String sql = "insert into produto(nome, quantidade, valor, categoria_id) values (?, ?, ?, ?)";
			PreparedStatement insert = connection.prepareStatement(sql);
			insert.setString(1, produto.getNome());
			insert.setDouble(2,BigDecimal.valueOf(produto.getQuantidade()).setScale(4, RoundingMode.DOWN).doubleValue());
			insert.setDouble(3, produto.getValor());
			insert.setLong(4, produto.getCategoria_id());
			insert.execute();
			connection.commit();

		} catch (Exception e) {
			e.printStackTrace();
			try {
				connection.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		}
	}
	
	//===============================================================================================================================

		/*
		 * M�todo delete() Respons�vel Por Fazer a Exclus�o (Delete) no BD
		 * 
		 * @param String id = Atributo ID do Produto
		 */
		public void delete(String id) {

			try {
				String sql = "delete from produto where id = '" + id + "'";
				PreparedStatement preparedStatement = connection.prepareStatement(sql);
				preparedStatement.execute();

				connection.commit();
			} catch (Exception e) {
				e.printStackTrace();
				try {
					connection.rollback();
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
			}

		}
//===============================================================================================================================
		/*
		 * M�todo consultar() Respons�vel Por Fazer Consultas (SELECT) no BD
		 * 
		 * @param String id = Atributo ID do Produto
		 */

		public ProdutoBean consultar(String id) throws Exception {
			String sql = "select * from produto where id='" + id + "'";

			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			ResultSet resultSet = preparedStatement.executeQuery();

			if (resultSet.next()) {

				ProdutoBean produto = new ProdutoBean();
				produto.setId(resultSet.getLong("id"));
				produto.setNome(resultSet.getString("nome"));
				produto.setQuantidade(resultSet.getDouble("quantidade"));
				produto.setValor(resultSet.getDouble("valor"));
				produto.setCategoria_id(resultSet.getLong("categoria_id"));

				return produto;
			}

			return null;
		}
		//===============================================================================================================================	

		/*
		 * M�todo atualizar() M�todo Respons�vel Por Atualizar os Dados (UPDATE) no BD
		 * 
		 * @param BeanProduto produto = Objeto Produto da Classe BeanProduto
		 */

		public void atualizar(ProdutoBean produto) {
			try {
				String sql = "update produto set nome = ?, quantidade = ?, valor = ?, categoria_id= ?  where id = "
						+ produto.getId();

				PreparedStatement preparedStatement = connection.prepareStatement(sql);
				preparedStatement.setString(1, produto.getNome());
				preparedStatement.setDouble(2, produto.getQuantidade());
				preparedStatement.setDouble(3, produto.getValor());
				preparedStatement.setLong(4, produto.getCategoria_id());
				preparedStatement.executeUpdate();
				connection.commit();
			} catch (Exception e) {
				e.printStackTrace();
				try {
					connection.rollback();
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
			}
		}

//=============================================================================================================================================	
	/*
	 * 2 metodo listar, cada um com fun��es diferente
	 * Respons�vel Por Listar Todos os Produtos do Sistema
	 */
	
	//Metodo = Pesquisar  usuario pela campo pesquisa, pesquisando peelo nome" retornar uma lista conforme o nome pesquisado
	public List<ProdutoBean> listar (String produconsulta) throws SQLException{	
		String sql = "SELECT * FROM produto where nome like'%"+ produconsulta + "%' ORDER BY nome asc";
		return consultarProdutos(sql);
	}
	
	//Metodo = recebendo o SQL (banco) para retornar uma lista de usuarios cadastrado
	public List<ProdutoBean> listar() throws Exception {
		String sql = "select * from produto";
		return consultarProdutos( sql);
	}//FIM = recebendo o SQL (banco) 

	
/*
*CONTULTAR PRODUTOS, dei um refactor na prepara��o do SQL para criar outro metodo
*porque conultar e listar tem as mesma fun��o, dentro do sistemas n�o pode ser replicado.
*da um (Refactor - extract method na prepara��o do sql)
 */
	
//metodo que faz a consulta dentro do banco(SQL), conforme necessidade do usuario = pesquisa/listagem
private  List<ProdutoBean> consultarProdutos(String sql) throws SQLException {
	
	List<ProdutoBean> listar = new ArrayList<ProdutoBean>();
	
	PreparedStatement statement = connection.prepareStatement(sql);//comeco pra selelcionar para  da refactor 
	ResultSet resultSet = statement.executeQuery();// fiM MEHTOD CONSULTAR PRODUTO

	while (resultSet.next()) {
		ProdutoBean produto = new ProdutoBean();
		produto.setId(resultSet.getLong("id"));
		produto.setNome(resultSet.getString("nome"));
		produto.setQuantidade(resultSet.getDouble("quantidade"));
		produto.setValor(resultSet.getDouble("valor"));
		produto.setCategoria_id(resultSet.getLong("categoria_id"));
		listar.add(produto);//FIM pra selelcionar para  da refactor 
	}
	
	return listar;
}

//====================================================================================================================================================
	/*
	 * M�todo listarCategoria() Respons�vel Por Listar toda categoria do Sistema
	 */

	public List<CategoriaBean> listarCategorias() throws Exception {
		List<CategoriaBean> retornoListaCategoria = new ArrayList<CategoriaBean>();

		String sql = "SELECT * FROM categoria";// dando select na tabela categoria
		PreparedStatement statement = connection.prepareStatement(sql);// Consulta no banco de dados

		ResultSet resultSet = statement.executeQuery();// obtando o resultado

		while (resultSet.next()) {// para cada linha iniciar o objeto e ingetar os dados
			CategoriaBean categoria = new CategoriaBean();
			categoria.setId(resultSet.getLong("id"));
			categoria.setNome(resultSet.getString("nome"));
			retornoListaCategoria.add(categoria);// add na tabela categoria
		}
		return retornoListaCategoria;// retorna a lista
	}

//===============================================================================================================================
	/*
	 * M�todo validarNome() Respons�vel Por Validar o Nome (N�o Pode Existir 1 Mesmo
	 * Nome Para 2 Produtos Diferentes)
	 * 
	 * @param String nome = Atributo Nome do Produto
	 */

	public boolean validarNome(String nome) throws Exception {
		String sql = "select count(1) as qtd from produto where nome='" + nome + "'";

		PreparedStatement preparedStatement = connection.prepareStatement(sql);
		ResultSet resultSet = preparedStatement.executeQuery();
		if (resultSet.next()) {

			return resultSet.getInt("qtd") <= 0;/* Return true */
		}

		return false;
	}
}

//===============================================================================================================================	