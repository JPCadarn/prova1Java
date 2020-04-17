<%@page import="models.Professor"%>
<%@page import="models.Disciplina"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Disciplinas</title>
</head>
<body>

	<%
		List<Professor> professores;
		if (session.getAttribute("professores") == null) {
			professores = new ArrayList<Professor>();
			session.setAttribute("professores", professores);
		} else
			professores = (ArrayList<Professor>) session.getAttribute("professores");
		
		List<Disciplina> disciplinas;
		if (session.getAttribute("disciplinas") == null) {
			disciplinas = new ArrayList<Disciplina>();
			session.setAttribute("disciplinas", disciplinas);
		} else
			disciplinas = (ArrayList<Disciplina>) session.getAttribute("disciplinas");
	%>

	<div
		style="position: relative; display: inline-block; width: 50%; margin-bottom: 40px; margin-left: 15%; border-collapse: collapse;">

		<%
			if (disciplinas.size() > 0) {
		%>
		<table style="width: 100%">
			<tr>
				<th>Nome</th>
				<th>Carga Horária</th>
				<th>Data de Início</th>
				<th>Data de Término</th>
				<th>Professor</th>
				<th>Número Máximo de Alunos</th>
			</tr>
			<%
				for (Disciplina disciplina : disciplinas) {
					out.print(""
						+"<tr style=\"border: 1px solid black;\"> " 
						+ "<td style=\"border: 1px solid black;\"> "+ disciplina.getNome() + "</td>"  
						+ "<td style=\"border: 1px solid black;\"> " + disciplina.getCargaHoraria() + "</td>"
						+ "<td style=\"border: 1px solid black;\"> " + disciplina.getDataInicioFormatada() + "</td>"
						+ "<td style=\"border: 1px solid black;\"> " + disciplina.getDataFimFormatada() + "</td>"
						+ "<td style=\"border: 1px solid black;\"> " + professores.get(disciplina.getIdProfessor()).getNome() + "</td>"
						+ "<td style=\"border: 1px solid black;\"> " + disciplina.getNumeroMaximoParticipantes() + "</td>"
						+ "<td style=\"border: 1px solid black;\">  <a href=\"DisciplinaDetail.jsp?id=" + disciplinas.indexOf(disciplina) + "\"> Editar</a>" + "<a href=\"DisciplinaDelete.jsp?idExcluir=" + disciplinas.indexOf(disciplina) + "\"> Excluir</a></td></tr>"
					);
				}
			%>
		</table>
		<%
			} else {
		%>
			<p>Não há disciplinas cadastradas</p>
		<%
			}
		%>
	</div>



	<div
		style="position: relative; display: inline-block; width: 70%; margin-bottom: 40px; margin-left: 15%; border-collapse: collapse;">
		<form action="CadastroDisciplina" method="POST">
			<p>Nome:<input type="text" name="nome"></p>
			<p>Carga Horária:<input type="text" name="cargaHoraria"></p>
			<p>Data de Início:<input type="date" name="dataInicio"></p>
			<p>Data de Término:<input type="date" name="dataFim"></p>
			<p>Número Máximo de Participantes:<input type="number" name="numeroParticipantes"></p>
			<% if (professores.size() > 0){ %>
				<select name="idProfessor">
					<% for (int i=0; i < professores.size();i++){ %>
						<option value="<%= i%>"><%= professores.get(i).getNome()%></option>
					<%}%>
				</select>
			<%}%>	
			<input type="submit" value="Cadastrar" />

		</form>
	</div>
	
	<a href="Index.jsp"> Voltar</a>

</body>
</html>