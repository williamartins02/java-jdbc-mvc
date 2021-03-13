package connection;

import java.sql.Connection;
import java.sql.DriverManager;

/*Responsavel por fazer a conex�o com o bando de dados
 * @author William*/

public class SingleConnection {
	
	private static String banco ="jdbc:postgresql://localhost:5432/curso-jsp?autoReconnect=true";
	private static String password="admin";
	private static String user="postgres";
	private static Connection connection = null;

	// todas vezes que chamar a "class SingleConnection" essa static mantem o banco sempre ativo
	//Static: Mantem a regra de chamar uma vez so o singleConnection, para todo nosso sistema..
	static {
		conectar();
	}//fim static conectar.
	
	
	//construtor =  pra fazer uma unica conex�o, mas todas telas instacia essa conex�o.
	// n�o instancia, sim chama para fazer uma conex�o s�.
	public SingleConnection() {
		
	}
	
	//metodo de exer��o para tratamento de erros.
	private static void conectar() {
		
		try {
			
			 if(connection == null) {
				 
				 Class.forName("org.postgresql.Driver");//drive do postgresql.
				 connection = DriverManager.getConnection(banco, user, password);//chamando os atributos para conex�o
				 connection.setAutoCommit(false);// AutoCommit false para evitar salvamento autimatico no BD = apos o SQL ser rodado no BD  precisamos fazer isso manual invoncando o commit.
			 }
			
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("Erro ao conectar com o banco de dados.");
			
		}//fim try/catch
		
	}//fim metodo conectar.
	
	//Metodo para retornar a conex�o.
	public static Connection getConnection() {
		return connection;
		
	}//Fim metodo return
}
