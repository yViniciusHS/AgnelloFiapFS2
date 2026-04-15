<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Agnello | Criar Conta</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&family=Italiana&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <%-- Importação dos ícones do Bootstrap adicionada --%>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="css/styles.css">
</head>
<body class="bg-light d-flex align-items-center justify-content-center" style="min-height: 100vh; padding: 2rem 0;">
    <div class="card border-0 shadow-lg rounded-5 p-5" style="max-width: 500px; width: 100%;">
        <div class="text-center mb-4">
            <%-- Link da logo adicionado para consistência com a tela de login --%>
            <a href="home" class="brand-font fs-1 text-decoration-none d-block mb-2" style="color: var(--hero-bg);">Agnello</a>
            <h3 class="brand-font" style="color: var(--hero-bg);">Junte-se ao Clube</h3>
            <p class="text-muted">Crie a sua conta e desfrute de benefícios exclusivos.</p>
        </div>

        <%-- Tratamento de erro limpo usando JSTL e EL --%>
        <c:if test="${not empty erro}">
            <div class="alert alert-danger small animate__animated animate__shakeX">
                <i class="bi bi-exclamation-triangle-fill me-2"></i>${erro}
            </div>
        </c:if>

        <form action="cadastro" method="post">
            <div class="mb-3">
                <label class="form-label small fw-bold text-muted">NOME COMPLETO</label>
                <input type="text" name="nome" class="form-control rounded-3 bg-light border-0 py-2" required>
            </div>
            <div class="mb-3">
                <label class="form-label small fw-bold text-muted">E-MAIL</label>
                <input type="email" name="email" class="form-control rounded-3 bg-light border-0 py-2" required>
            </div>
            <div class="mb-3">
                <label class="form-label small fw-bold text-muted">PALAVRA-PASSE</label>
                <input type="password" name="senha" class="form-control rounded-3 bg-light border-0 py-2" required>
            </div>
            <div class="row g-3 mb-4">
                <div class="col-8">
                    <label class="form-label small fw-bold text-muted">ENDEREÇO</label>
                    <input type="text" name="endereco" class="form-control rounded-3 bg-light border-0 py-2" placeholder="Rua, Número, Cidade" required>
                </div>
                <div class="col-4">
                    <label class="form-label small fw-bold text-muted">CEP</label>
                    <input type="text" name="cep" class="form-control rounded-3 bg-light border-0 py-2" required>
                </div>
            </div>
            <button type="submit" class="btn btn-dark w-100 rounded-pill py-2 fw-bold" style="background-color: var(--hero-bg);">CRIAR CONTA</button>
        </form>
        <div class="text-center mt-4 small">
            <span class="text-muted">Já tem conta?</span> <a href="login.jsp" style="color: var(--sand-hover); font-weight: 600;">Entrar aqui</a>
        </div>
    </div>
</body>
</html>