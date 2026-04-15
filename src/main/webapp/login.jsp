<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Agnello | Entrar</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&family=Italiana&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="css/styles.css">
</head>
<body class="bg-light d-flex align-items-center justify-content-center" style="height: 100vh;">
    <div class="card border-0 shadow-lg rounded-5 p-5" style="max-width: 400px; width: 100%;">
        <div class="text-center mb-4">
            <a href="index.jsp" class="brand-font fs-1 text-decoration-none" style="color: var(--hero-bg);">Agnello</a>
            <p class="text-muted mt-2">Bem-vindo de volta à nossa adega.</p>
        </div>

        <%-- Exibição de mensagens de erro vindas do LoginServlet --%>
        <% if (request.getAttribute("erro") != null) { %>
            <div class="alert alert-danger small animate__animated animate__shakeX">
                <i class="bi bi-exclamation-triangle-fill me-2"></i><%= request.getAttribute("erro") %>
            </div>
        <% } %>

        <%-- Mensagem de sucesso após cadastro --%>
        <% if (request.getParameter("sucesso") != null) { %>
            <div class="alert alert-success small animate__animated animate__fadeIn">
                <i class="bi bi-check-circle-fill me-2"></i>Conta criada com sucesso! Faça login.
            </div>
        <% } %>

        <form action="login" method="post">
            <div class="mb-3">
                <label class="form-label small fw-bold text-muted">E-MAIL</label>

                <input type="email" name="email" id="email"
                       value="luiz@exemplo.com.br"
                       class="form-control rounded-3 bg-light border-0 py-2" required>
            </div>
            <div class="mb-4">
                <label class="form-label small fw-bold text-muted">PALAVRA-PASSE</label>

                <input type="password" name="senha" id="senha"
                       value="123"
                       class="form-control rounded-3 bg-light border-0 py-2" required>
            </div>

            <button type="submit" class="btn btn-dark w-100 rounded-pill py-2 fw-bold" style="background-color: var(--hero-bg);">
                ENTRAR
            </button>


            <button type="button" onclick="preencherAdmin()" class="btn btn-link w-100 mt-2 text-muted small text-decoration-none" style="font-size: 0.7rem;">
                <i class="bi bi-magic me-1"></i> Preencher dados de demonstração
            </button>
        </form>

        <div class="text-center mt-4 small">
            <span class="text-muted">Ainda não tem conta?</span>
            <a href="cadastro.jsp" style="color: var(--sand-hover); font-weight: 600;">Criar agora</a>
        </div>
    </div>

<script src="js/script.js"></script>


</body>
</html>