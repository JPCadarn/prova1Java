<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Excluir Disciplina</title>
</head>
<body>
	<%
		int id = Integer.parseInt(request.getParameter("idExcluir")); 
	%>
	<form id="formExcluir" action="CadastroDisciplina" method="POST">
		<input type="text" name="idExcluir" value=<%=id%> /> 
		<input type="submit" value="Cadastrar" />
	</form>
	<script>
		document.getElementById("formExcluir").submit();
	</script>
</body>
</html>