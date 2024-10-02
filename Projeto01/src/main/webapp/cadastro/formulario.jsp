<%@page import="org.libertas.Pessoa"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<%
		int idpessoa = Integer.parseInt(request.getParameter("id"));
		Pessoa p = new Pessoa();
		PessoaDao pdao = new PessoaDao();
		if (idpessoa > 0){
			p = pdao.consultar(idpessoa);
		}
		else {
			//limpa os dados para novo
			p.setNome("");
			p.setTelefone("");
			p.setEmail("");
			p.setCidade("");
		}
		
		%>
	<form action="gravar.jsp" method="post">
		<input type="hidden" name="idpessoa" value="<%= p.getIdpessoa() %>">
	Nome:
	<input type="text" name="nome"/>
	<br/>
	Telefone:
	<input type="text" name="telefone"/>
	<br/>
	Email:
	<input type="text" name="email"/>
	<br/>
	Cidade:
	<input type="text" name="cidade"/>
	<br/>
	<input type="submit" name="salvar"/>

	</form>

</body>
</html>