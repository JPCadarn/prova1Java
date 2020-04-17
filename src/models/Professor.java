package models;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Professor implements Serializable {

	private String nome;
	private String email;
	private String telefone;
	private Date dataNasc;

	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getDataNasc() {
		return dataNasc;
	}

	public void setDataNasc(Date dataNasc) {
		
		this.dataNasc = dataNasc;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getDataNasFormated() {
		SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
		if (this.dataNasc == null)
			return format.format(new Date());
		
		return format.format(this.dataNasc);
	}
	
	public String getDataNasDateInput() {
		SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
		if (this.dataNasc == null)
			return format.format(new Date());
		
		return format.format(this.dataNasc);
	}

	public String getTelefone() {
		return telefone;
	}

	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}
	
	

}
