<%@page import="org.trabalhos.Livros" %>
<%@page import="org.trabalhos.LivrosDao" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gravar Livros</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body class="bg-light">
    <%
        LivrosDao ldao = new LivrosDao();
        Livros l = new Livros();
        String idLivroParam = request.getParameter("idlivro");
        
        if (idLivroParam != null && !idLivroParam.isEmpty()) {
            int idLivro = Integer.parseInt(idLivroParam);
            l = ldao.consultar(idLivro);
        }
        
        // Gravar a informação
        if (request.getMethod().equalsIgnoreCase("POST")) {
            l.setIdlivro(Integer.parseInt(request.getParameter("idlivro")));
            l.setTitulo(request.getParameter("titulo"));
            l.setAutor(request.getParameter("autor"));
            l.setEditora(request.getParameter("editora"));
            l.setAnoPublicacao(request.getParameter("anopublicacao"));

            if (l.getIdlivro() > 0) {
                ldao.editar(l);
            } else {
                ldao.adicionar(l);
            }

            // Redirecionar para a lista após salvar
            response.sendRedirect("listar.jsp");
            return;
        }
    %>

    <div class="container mt-5">
        <h1 class="mb-4">Gravar Livros</h1>
        <form method="post">
            <input type="hidden" name="idlivro" value="<%= l.getIdlivro() %>" />
            
            <div class="mb-3">
                <label for="titulo" class="form-label">Título</label>
                <input type="text" id="titulo" name="titulo" class="form-control" value="<%= l.getTitulo() != null ? l.getTitulo() : "" %>" required />
            </div>
            <div class="mb-3">
                <label for="autor" class="form-label">Autor</label>
                <input type="text" id="autor" name="autor" class="form-control" value="<%= l.getAutor() != null ? l.getAutor() : "" %>" required />
            </div>
            <div class="mb-3">
                <label for="editora" class="form-label">Editora</label>
                <input type="text" id="editora" name="editora" class="form-control" value="<%= l.getEditora() != null ? l.getEditora() : "" %>" required />
            </div>
            <div class="mb-3">
                <label for="anopublicacao" class="form-label">Ano de Publicação</label>
                <input type="text" id="anopublicacao" name="anopublicacao" class="form-control" value="<%= l.getAnoPublicacao() != null ? l.getAnoPublicacao() : "" %>" required />
            </div>
            <div class="d-flex justify-content-between">
                <button type="submit" class="btn btn-success">Salvar</button>
                <a href="listar.jsp" class="btn btn-secondary">Cancelar</a>
            </div>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
