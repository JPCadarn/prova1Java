package models;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Disciplina {
	private String nome;
	private int cargaHoraria;
	private Date dataInicio;
	private Date dataFim;
	private int idProfessor;
	private int numeroMaximoParticipantes;
	
	public String getNome() {
		return nome;
	}
	
	public void setNome(String nome) {
		this.nome = nome;
	}
	
	public int getCargaHoraria() {
		return cargaHoraria;
	}
	
	public void setCargaHoraria(int cargaHoraria) {
		this.cargaHoraria = cargaHoraria;
	}
	
	public int getIdProfessor() {
		return idProfessor;
	}
	
	public void setIdProfessor(int idProfessor) {
		this.idProfessor = idProfessor;
	}
	
	public int getNumeroMaximoParticipantes() {
		return numeroMaximoParticipantes;
	}
	
	public void setNumeroMaximoParticipantes(int numeroMaximoParticipantes) {
		this.numeroMaximoParticipantes = numeroMaximoParticipantes;
	}	
	
	public String getDataInicioFormatada() {
		SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
		if (this.dataInicio == null)
			return format.format(new Date());
		
		return format.format(this.dataInicio);
	}
	
	public String getDataInicioDateInput() {
		SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
		if (this.dataInicio == null)
			return format.format(new Date());
		
		return format.format(this.dataInicio);
	}
	
	public Date getDataInicio() {
		return dataInicio;
	}

	public void setDataInicio(Date dataInicio) {
		
		this.dataFim = dataInicio;
	}
	
	public Date getDataFim() {
		return dataFim;
	}

	public void setDataFim(Date dataFim) {
		
		this.dataFim = dataFim;
	}
	
	public String getDataFimFormatada() {
		SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
		if (this.dataFim == null)
			return format.format(new Date());
		
		return format.format(this.dataFim);
	}
	
	public String getDataFimDateInput() {
		SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
		if (this.dataFim == null)
			return format.format(new Date());
		
		return format.format(this.dataFim);
	}	
}