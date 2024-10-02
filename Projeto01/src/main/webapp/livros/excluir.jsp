<%@page import="org.trabalhos.Livros"%>
<%@page import="org.trabalhos.LivrosDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <meta charset="UTF-8">
    <title>Excluir Livro</title>
</head>
<body class="bg-light">
    <div class="container mt-5">
        <div class="card">
            <div class="card-header">
                <h4>Resultado da Exclusão</h4>
            </div>
            <div class="card-body text-center">
                <%
                    Livros l = new Livros();
                    l.setIdlivro(Integer.parseInt(request.getParameter("idlivro")));
                    LivrosDao ldao = new LivrosDao();
                    ldao.excluir(l);
                %>
                <h5 class="alert alert-success">Livro excluído com sucesso!</h5>
                <a class="btn btn-primary" href="listar.jsp">Voltar para a lista</a>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
