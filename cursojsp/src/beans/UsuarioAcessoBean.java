package beans;


import java.time.LocalDate;


public class UsuarioAcessoBean {
	
	private Long id_acesso;
	private String ip;
	private LocalDate data_acesso;
	private Long usuario_id;
	
	public Long getId_acesso() {
		return id_acesso;
	}
	public void setId_acesso(Long long1) {
		this.id_acesso = long1;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public LocalDate getData_acesso() {
		return data_acesso;
	}
	public void setData_acesso(LocalDate data_acesso) {
		this.data_acesso = data_acesso;
	}
	public Long getUsuario_id() {
		return usuario_id;
	}
	public void setUsuario_id(Long usuario_id) {
		this.usuario_id = usuario_id;
	}
	

	


}
