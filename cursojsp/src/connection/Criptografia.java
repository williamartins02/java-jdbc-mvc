package connection;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class Criptografia {	
	public String gerarHashMD5(String conteudo) {
    	        byte[] b;
		try {
	                MessageDigest md = MessageDigest.getInstance("md5");  
	                md.reset();  
	                b = md.digest(conteudo.getBytes());  
			
			return  new BigInteger(1, b).toString(16);
		} 
		catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
			return "";
		}  
	}
}
