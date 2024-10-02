<%@page import="org.libertas.Pessoa"%>
<%@page import="org.libertas.PessoaDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h1>Cadastro de Pessoas</h1>
	<a href ="formulario.jsp?id=0">Novo</a>
	
	<table border="1">
	<th>Nome</th>
	<th>Telefone</th>
	<th>Email</th>
	<th>Cidade</th>
	
	<%
		PessoaDao dao = new PessoaDao();
		for (Pessoa p : dao.listar()){
			out.print("<tr>");
			out.print("<td>" + p.getNome() + "</td>");
			out.print("<td>" + p.getTelefone() + "</td>");
			out.print("<td>" + p.getEmail() + "</td>");
			out.print("<td>" + p.getCidade() + "</td>");
			out.print("</tr>");
				
		}
	
	%>
	</table>
	<a href="index.jps">Inicio</a>
</body>
</html>