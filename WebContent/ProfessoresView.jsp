<%@page import="java.util.ArrayList"%>
<%@page import="models.Professor"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cadastro de Professores</title>
</head>
<body>

	<%
		List<Professor> professores;
		if (session.getAttribute("professores") == null) {
			professores = new ArrayList<Professor>();
			session.setAttribute("professores", professores);
		} else
			professores = (ArrayList<Professor>) session.getAttribute("professores");
	%>

	<div
		style="position: relative; display: inline-block; width: 50%; margin-bottom: 40px; margin-left: 15%; border-collapse: collapse;">

		<%
			if (professores.size() > 0) {
		%>
		<table style="width: 100%">
			<tr>
				<th>Nome</th>
				<th>email</th>
				<th>Telefone</th>
				<th>Data Nascimento</th>
			</tr>
			<%
				for (Professor p : professores) {
						out.print("<tr style=\"border: 1px solid black;\"> " 
								+ "<td style=\"border: 1px solid black;\"> "+ p.getNome() + "</td>" + "<td style=\"border: 1px solid black;\"> " + p.getEmail() + "</td>" 
								+ "<td style=\"border: 1px solid black;\"> " + p.getTelefone() + "</td>"
								+ "<td style=\"border: 1px solid black;\"> " + p.getDataNasFormated() + "</td>"
								+ "<td style=\"border: 1px solid black;\">  <a href=\"ProfessorDetail.jsp?professorId=" + professores.indexOf(p) + "\"> Editar</a></td>" + "</tr>");
					}
			%>
		</table>
		<%
			} else {
		%>
			<p>Não há professores cadastrados</p>
		<%
			}
		%>
	</div>

	<div
		style="position: relative; display: inline-block; width: 50%; margin-bottom: 40px; margin-left: 15%; border-collapse: collapse;">

		<form action="CadastroProfe" method="POST">
			<p>
				Nome:<input type="text" name="txtnome" />
			</p>

			<p>
				E-Mail:<input type="text" name="txtemail" />
			</p>

			<p>
				Telefone:<input type="text" name="txttelefone" />
			</p>

			<p>
				Data de Nascimento:<input type="date" name="txtdtnasc" />
			</p>

			<input type="submit" value="Cadastrar" />

		</form>
	</div>

	<a href="Index.jsp"> Voltar</a>
</body>

</html>