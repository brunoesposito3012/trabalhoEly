<%@page import="org.trabalhos.Livros" %>
<%@page import="org.trabalhos.LivrosDao" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <meta charset="UTF-8">
    <title>Gravar Livros</title>
</head>
<body class="bg-light">
    <div class="container mt-5">
        <%
            LivrosDao dao = new LivrosDao();
            Livros l = new Livros();
            l.setIdlivro(Integer.parseInt(request.getParameter("idlivro")));
            l.setTitulo(request.getParameter("titulo"));
            l.setAutor(request.getParameter("autor"));
            l.setEditora(request.getParameter("editora"));
            l.setAnoPublicacao(request.getParameter("anopublicacao"));
            
            if (l.getIdlivro() > 0) {
                dao.editar(l);
            } else {
                dao.adicionar(l);
            }
        %>
        
        <div class="card">
            <div class="card-header">
                <h4>Resultado da Operação</h4>
            </div>
            <div class="card-body text-center">
                <h5 class="alert alert-success">Livro salvo com sucesso!</h5>
                <a href="listar.jsp" class="btn btn-success">OK</a>
            </div>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
