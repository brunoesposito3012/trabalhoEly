<%@page import="org.trabalhos.Livros" %>
<%@page import="org.trabalhos.LivrosDao" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <meta charset="UTF-8">
    <title>Lista de Livros</title>
</head>
<body class="bg-light">
    <div class="container mt-5">
        <h2 class="mb-4">Lista de Livros</h2>
        <a href="formulario.jsp?idlivro=0" class="btn btn-success mb-3">Adicionar Livros</a>
        <a href="index.jsp" class="btn btn-primary mb-3">Início</a>

        <table class="table table-striped">
            <thead>
                <tr>
                    <th>Id do Livro</th>
                    <th>Título</th>
                    <th>Autor</th>
                    <th>Editora</th>
                    <th>Ano de Publicação</th>
                    <th>Ações</th>
                </tr>
            </thead>
            <tbody>
                <%
                    LivrosDao dao = new LivrosDao();
                    for (Livros l : dao.listar()) {
                        out.print("<tr>");
                        out.print("<td>" + l.getIdlivro() + "</td>");
                        out.print("<td>" + l.getTitulo() + "</td>");
                        out.print("<td>" + l.getAutor() + "</td>");
                        out.print("<td>" + l.getEditora() + "</td>");
                        out.print("<td>" + l.getAnoPublicacao() + "</td>");
                        out.print("<td>");
                        out.print("<a href='formulario.jsp?idlivro=" + l.getIdlivro() + "' class='btn btn-warning btn-sm'>Editar</a>");
                        out.print("<a href='excluir.jsp?idlivro=" + l.getIdlivro() + "' class='btn btn-danger btn-sm'>Excluir</a>");
                        out.print("</td>");
                        out.print("</tr>");
                    }
                %>
            </tbody>
        </table>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
