<%@page import="java.text.ParseException"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*"%>
<%@page import="models.Professor"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Professor</title>
</head>
<body>

	<%
		List<Professor> professores;
		if (session.getAttribute("professores") == null) {
			professores = new ArrayList<Professor>();
			session.setAttribute("professores", professores);
		} else
			professores = (ArrayList<Professor>) session.getAttribute("professores");

		int professorId = Integer.parseInt(request.getParameter("professorId"));

		if (professores.size() < 1 || professores.size() < professorId) {
			request.getRequestDispatcher("ProfessoresView.jsp").forward(request, response);
		}

		Professor p = professores.get(professorId);
	%>

	<div
		style="position: relative; display: inline-block; width: 50%; margin-bottom: 40px; margin-left: 15%; border-collapse: collapse;">
		<!--  Percebam que aqui no action eu to passando qual a página que elevai mandar os dados depois que eu clicar no botao -->
		<form action="CadastroProfe" method="POST">
			<p>
				Nome:<input type="text" name="txtnome" value=<%=p.getNome()%> />
			</p>

			<p>
				E-Mail:<input type="text" name="txtemail" value=<%=p.getEmail()%> />
			</p>
			
			<p>Telefone:<input type="text" name="txttelefone" value=<%=p.getTelefone()%>/></p>

			<p>
				Data de Nascimento:<input type="date" id="txtdtnasc"
					name="txtdtnasc" value="<%=p.getDataNasDateInput()%>" />
			</p>
			
			<input type="hidden" name="updateProfessor" value=<%=professorId%> /> 
			
			<input type="submit" value="Salvar" />

		</form>
	</div>

	<a href="ProfessoresView.jsp"> Voltar</a>
</body>
</html>