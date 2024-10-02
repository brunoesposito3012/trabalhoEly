<%@page import="org.trabalhos.Livros" %>
<%@page import="org.trabalhos.LivrosDao" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lista de Livros</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body class="bg-light">
    <div class="container mt-5">
        <h2 class="my-3 text-center">Lista de Livros</h2>
        <div class="text-center mb-3">
            <a href="formulario.jsp?idlivro=0" class="btn btn-success">Adicionar Livro</a>
            <a href="index.jsp" class="btn btn-primary">Início</a>
        </div>
        <table class="table table-striped">
            <thead class="table-dark">
                <tr>
                    <th>TÍTULO</th>
                    <th>AUTOR</th>
                    <th>EDITORA</th>
                    <th>ANO DE PUBLICAÇÃO</th>
                    <th>AÇÕES</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="l" items="${ldao.listar()}">
                    <tr>
                        <td>${l.titulo}</td>
                        <td>${l.autor}</td>
                        <td>${l.editora}</td>
                        <td>${l.anopublicacao}</td>
                        <td>
                            <a href="formulario.jsp?idlivro=${l.idlivro}" class="btn btn-warning btn-sm">Alterar</a>
                            <a href="excluir.jsp?idlivro=${l.idlivro}" class="btn btn-danger btn-sm">Excluir</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
