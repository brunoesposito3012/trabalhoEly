<%@page import="org.trabalhos.Livros" %>
<%@page import="org.trabalhos.LivrosDao" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <meta charset="UTF-8">
    <title>Cadastro de Livros</title>
</head>
<body class="bg-light">
    <div class="container mt-5">
        <h2 class="mb-4">Formulário de Livros</h2>
        <%
            int Idlivro = Integer.parseInt(request.getParameter("idlivro"));
            Livros l = new Livros();
            LivrosDao ldao = new LivrosDao();
            if (Idlivro > 0) {
                l = ldao.consultar(Idlivro);
            } else {
                l.setTitulo("");
                l.setAutor("");
                l.setEditora("");
                l.setAnoPublicacao("");
            }
        %>
        <form action="gravar.jsp" method="post">
            <input type="hidden" name="idlivro" value="<%= l.getIdlivro() %>" />
            <div class="mb-3">
                <label for="titulo" class="form-label">Título</label>
                <input type="text" name="titulo" class="form-control" value="<%= l.getTitulo() %>" required />
            </div>
            <div class="mb-3">
                <label for="autor" class="form-label">Autor</label>
                <input type="text" name="autor" class="form-control" value="<%= l.getAutor() %>" required />
            </div>
            <div class="mb-3">
                <label for="editora" class="form-label">Editora</label>
                <input type="text" name="editora" class="form-control" value="<%= l.getEditora() %>" required />
            </div>
            <div class="mb-3">
                <label for="anopublicacao" class="form-label">Ano de Publicação</label>
                <input type="text" name="anopublicacao" class="form-control" value="<%= l.getAnoPublicacao() %>" required />
            </div>
            <button type="submit" class="btn btn-success">Salvar</button>
        </form>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
