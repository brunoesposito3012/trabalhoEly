<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String desc = request.getParameter("descricao");
		int quant = Integer.parseInt(request.getParameter("quant"));
		double dolar = Double.parseDouble(request.getParameter("dolar"));
		
		double unitReais = dolar * 5.48;
		double totalReais = unitReais * quant;
	%>
	
	<table border="1">
		<tr>
			<td><b>Produto:</b></td><%= desc %></td>
		</tr>
		<tr>
			<td><b>Quantidade:</b></td><%= quant %></td>
		<tr>
			<td><b>Preço em Dolar:</b></td><%= df.format(dolar) %></td>
		</tr>
		<tr>
			<td><b>Preço Unitário em Reais:</b></td><%= df.format(unitReais) %></td>
		</tr>
		<tr>
			<td><b>Preço total</b></td><% df.format(totalReais) %></td>
		</tr>
	</table>

</body>
</html>