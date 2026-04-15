<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Agnello | Sommelier Digital</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&family=Italiana&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="css/styles.css">
    <style>
        .sommelier-hero {
            background: linear-gradient(rgba(0,0,0,0.6), rgba(0,0,0,0.6)), url('img/b961f52d-f246-43c2-a1b8-5e05d8ff493a.png');
            background-size: cover; background-position: center; height: 40vh;
            display: flex; align-items: center; justify-content: center; color: white; text-align: center;
        }
        .pilar-card { transition: transform 0.3s ease; border: 1px solid rgba(0,0,0,0.05); }
        .pilar-card:hover { transform: translateY(-10px); border-color: var(--hero-bg); }
        .text-gold { color: #d4af37; }
        .result-card { background: white; border-radius: 20px; transition: 0.3s; border: 1px solid #eee; }
        .result-card:hover { transform: scale(1.02); box-shadow: 0 10px 20px rgba(0,0,0,0.05); }
        .btn-filter { border-width: 2px; font-weight: 600; transition: 0.4s; }
    </style>
</head>
<body class="bg-light">

   <jsp:include page="header.jsp" />

    <section class="sommelier-hero">
        <div class="container">
            <h1 class="brand-font display-3">Sommelier Digital</h1>
            <p class="lead">Sua inteligência para harmonização e escolha de rótulos.</p>
        </div>
    </section>

    <section class="container my-5 py-5">
        <div class="text-center mb-5">
            <h2 class="brand-font">Como você prefere o seu vinho hoje?</h2>
            <p class="text-muted">Busque por perfil sensorial, pratos ou ocasiões.</p>
        </div>

        <div class="row justify-content-center g-4">
            <div class="col-md-8">

                <c:set var="filtrosRapidos" value="leve,intenso,fresco,churrasco,romantico,piscina" />
                <%-- Normaliza o parâmetro busca para evitar erros de comparação --%>
                <c:set var="buscaAtual" value="${not empty param.busca ? param.busca.toLowerCase() : ''}" />

                <form action="sommelier" method="GET">
                    <div class="input-group input-group-lg shadow-sm rounded-pill overflow-hidden border mb-4">
                        <span class="input-group-text bg-white border-0 ps-4"><i class="bi bi-search text-gold"></i></span>

                        <input type="text" name="busca" class="form-control border-0"
                               placeholder="Buscar por nome, uva ou prato..."
                               value="${not empty buscaAtual and filtrosRapidos.contains(buscaAtual) ? '' : param.busca}">
                        <button type="submit" class="btn btn-dark px-5" style="background-color: var(--hero-bg); border: none;">RECOMENDAR</button>
                    </div>
                </form>

                <%-- Botões com destaque dinâmico  --%>
                <div class="d-flex flex-wrap justify-content-center gap-3 mb-2">
                    <a href="sommelier?busca=leve" class="btn btn-filter rounded-pill px-4 ${buscaAtual == 'leve' ? 'btn-dark' : 'btn-outline-dark'}">Vinhos Leves</a>
                    <a href="sommelier?busca=intenso" class="btn btn-filter rounded-pill px-4 ${buscaAtual == 'intenso' ? 'btn-dark' : 'btn-outline-dark'}">Vinhos Intensos</a>
                    <a href="sommelier?busca=fresco" class="btn btn-filter rounded-pill px-4 ${buscaAtual == 'fresco' ? 'btn-dark' : 'btn-outline-dark'}">Vinhos Frescos</a>

                    <a href="sommelier?busca=churrasco" class="btn btn-filter rounded-pill px-4 ${buscaAtual == 'churrasco' ? 'btn-dark' : 'btn-outline-dark'}">
                        <i class="bi bi-fire me-1"></i>Churrasco
                    </a>
                    <a href="sommelier?busca=romantico" class="btn btn-filter rounded-pill px-4 ${buscaAtual == 'romantico' ? 'btn-dark' : 'btn-outline-dark'}">
                        <i class="bi bi-heart-fill me-1 text-danger"></i>Jantar Romântico
                    </a>
                    <a href="sommelier?busca=piscina" class="btn btn-filter rounded-pill px-4 ${buscaAtual == 'piscina' ? 'btn-dark' : 'btn-outline-dark'}">
                        <i class="bi bi-sun-fill me-1 text-warning"></i>Dia na Piscina
                    </a>
                </div>

                <c:if test="${not empty param.busca}">
                    <div class="text-center">
                        <a href="sommelier" class="btn btn-link text-muted small text-decoration-none">
                            <i class="bi bi-x-circle me-1"></i>Limpar filtros e busca
                        </a>
                    </div>
                </c:if>
            </div>
        </div>

        <div class="row g-4 mt-5">
            <c:if test="${not empty vinhosRecomendados}">
                <div class="col-12 mb-2">
                    <h4 class="brand-font border-bottom pb-2">Rótulos Sugeridos para: <span class="text-muted text-capitalize">${param.busca}</span></h4>
                </div>
                <c:forEach var="v" items="${vinhosRecomendados}">
                    <div class="col-md-4">
                        <div class="result-card p-4 h-100 text-center shadow-sm">
                            <span class="tag ${v.classeTag} mb-3 d-inline-block">${v.tag}</span>
                            <img src="${v.imagemUrl}" class="img-fluid mb-3" style="max-height: 200px; mix-blend-mode: multiply;">
                            <h5 class="brand-font">${v.nome}</h5>
                            <p class="product-price small fw-bold">
                                <fmt:formatNumber value="${v.preco}" type="currency" currencySymbol="R$" />
                            </p>
                            <a href="detalhe-vinho?id=${v.id}" class="btn btn-dark btn-sm w-100 rounded-pill">VER DETALHES</a>
                        </div>
                    </div>
                </c:forEach>
            </c:if>

            <c:if test="${empty vinhosRecomendados and not empty param.busca}">
                <div class="col-12 text-center py-5">
                    <i class="bi bi-search-heart display-1 text-muted opacity-25"></i>
                    <p class="text-muted mt-3">Ainda não temos uma sugestão exata para "${param.busca}", <br>mas tente outro termo ou explore nossa adega!</p>
                </div>
            </c:if>
        </div>
    </section>

    <section class="py-5 bg-white border-top">
        <div class="container">
            <div class="row align-items-center mb-5">
                <div class="col-md-6">
                    <h2 class="brand-font display-5">Aprenda a Degustar</h2>
                    <p class="lead text-muted">Entenda os 5 pilares fundamentais que compõem o sabor vindo da nossa adega.</p>
                </div>
            </div>

            <div class="row g-4">
                <div class="col-md-4">
                    <div class="pilar-card p-4 rounded-4 bg-light h-100">
                        <span class="display-6 text-gold fw-bold">01</span>
                        <h4 class="brand-font mt-2">Corpo</h4>
                        <p class="small text-muted">A sensação de "peso" do vinho na boca.</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="pilar-card p-4 rounded-4 bg-light h-100">
                        <span class="display-6 text-gold fw-bold">02</span>
                        <h4 class="brand-font mt-2">Taninos</h4>
                        <p class="small text-muted">Aquela sensação de "boca seca" vinda da casca.</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="pilar-card p-4 rounded-4 bg-light h-100">
                        <span class="display-6 text-gold fw-bold">03</span>
                        <h4 class="brand-font mt-2">Acidez</h4>
                        <p class="small text-muted">O frescor que faz você salivar.</p>
                    </div>
                </div>
                <div class="col-md-4 offset-md-2">
                    <div class="pilar-card p-4 rounded-4 bg-light h-100">
                        <span class="display-6 text-gold fw-bold">04</span>
                        <h4 class="brand-font mt-2">Álcool</h4>
                        <p class="small text-muted">Percebido como uma sensação de calor na garganta.</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="pilar-card p-4 rounded-4 bg-light h-100">
                        <span class="display-6 text-gold fw-bold">05</span>
                        <h4 class="brand-font mt-2">Doçura</h4>
                        <p class="small text-muted">O açúcar residual que equilibra a acidez.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <footer class="footer-agnello py-5 mt-5">
        <div class="container text-center">
            <div class="footer-logo brand-font fs-2 mb-3">Agnello</div>
            <p class="mb-1">Agnello © 2026 - Vinhos com Propósito</p>
            <p class="small text-muted">Desenvolvido por <span class="fw-bold text-gold">Codart</span></p>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="js/script.js"></script>
</body>
</html>