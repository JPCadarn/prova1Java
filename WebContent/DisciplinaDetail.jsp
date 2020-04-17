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
		
		int id = Integer.parseInt(request.getParameter("id"));
		if (disciplinas.size() < 1 || disciplinas.size() < id) {
			request.getRequestDispatcher("DisciplinasView.jsp").forward(request, response);
		}

		Disciplina disciplina = disciplinas.get(id);
	%>


	<div
		style="position: relative; display: inline-block; width: 70%; margin-bottom: 40px; margin-left: 15%; border-collapse: collapse;">
		<form action="CadastroDisciplina" method="POST">
			<p>Nome:<input value=<%=disciplina.getNome()%> type="text" name="nome"></p>
			<p>Carga Horária:<input value=<%=disciplina.getCargaHoraria()%> type="text" name="cargaHoraria"></p>
			<p>Data de Início:<input value=<%=disciplina.getDataInicioDateInput()%> type="date" name="dataInicio"></p>
			<p>Data de Término:<input value=<%=disciplina.getDataFimDateInput()%> type="date" name="dataFim"></p>
			<p>Número Máximo de Participantes:<input value=<%=disciplina.getNumeroMaximoParticipantes()%> type="number" name="numeroParticipantes"></p>
			<% if (professores.size() > 0){ %>
				<select name="idProfessor">
					<% 
						for (int i=0; i < professores.size();i++){
							if(i == disciplina.getIdProfessor()){%>
								<option value="<%= i%>" selected><%= professores.get(i).getNome()%></option>
							<%}else{%>
								<option value="<%= i%>"><%= professores.get(i).getNome()%></option>
							<%}
						}
					%>
				</select>
			<%}%>
			<input type="hidden" name="id" value=<%=id%> /> 
			<input type="submit" value="Cadastrar" />

		</form>
	</div>
	
	<a href="Index.jsp"> Voltar</a>

</body>
</html>