<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Agnello | Vinhos Orgânicos</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&family=Italiana&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>

    <div class="intro-overlay">
        <h1 class="intro-logo">Agnello</h1>
    </div>


    <jsp:include page="header.jsp" />

    <section class="hero-section">
        <div class="hero-content">
            <h6>APRESENTANDO</h6>
            <h1 class="brand-font">Vinhos<br>Orgânicos</h1>
            <div class="hero-buttons">
                <a href="#vitrine" class="btn-sand">EXPLORAR AGORA</a>
                <a href="#vitrine" class="btn-outline-sand">COLEÇÃO 2024</a>
            </div>
        </div>
    </section>

    <section id="vitrine" class="products-container">
        <h2 class="section-title brand-font">Melhor Seleção</h2>
        <p class="section-subtitle">EXPLORE NOSSA ADEGA</p>

        <div class="product-grid">

            <c:forEach var="v" items="${vinhos}">
                <div class="product-card">

                    <span class="tag ${v.classeTag}">${v.tag}</span>

                    <a href="detalhe-vinho?id=${v.id}">
                        <div class="product-image-container">
                            <img src="${v.imagemUrl}" class="product-image" alt="${v.nome}">
                        </div>
                    </a>

                    <a href="detalhe-vinho?id=${v.id}" class="text-decoration-none text-dark">
                        <h3 class="product-title brand-font">${v.nome}</h3>
                    </a>

                    <%-- Preço sincronizado diretamente do Banco de Dados --%>
                    <p class="product-price">R$ ${v.preco}</p>

                    <button class="btn-buy-now" onclick="adicionarAoCarrinho('${v.nome}', ${v.preco})">
                        Comprar agora
                    </button>
                </div>
            </c:forEach>

            <%-- Mensagem se lista vazia --%>
            <c:if test="${empty vinhos}">
                <div class="col-12 text-center py-5">
                    <p class="text-muted">Nenhum vinho encontrado na nossa adega no momento.</p>
                </div>
            </c:if>
        </div>
    </section>

    <%-- Offcanvas do Carrinho --%>
    <div class="offcanvas offcanvas-end" tabindex="-1" id="cartOffcanvas">
        <div class="offcanvas-header text-white" style="background-color: var(--hero-bg);">
            <h5 class="offcanvas-title brand-font">Meu Carrinho</h5>
            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="offcanvas"></button>
        </div>
        <div class="offcanvas-body d-flex flex-column">
            <div class="offcanvas-body-items flex-grow-1" id="cartItems">
                <p class="text-muted text-center py-4">Seu carrinho está vazio.</p>
            </div>
            <div class="border-top pt-3">
                <h5 id="cartTotal" class="brand-font">Total: R$ 0,00</h5>
                <button class="btn btn-dark w-100 rounded-pill py-3 mt-3 fw-bold">FINALIZAR COMPRA</button>
            </div>
        </div>
    </div>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.2/gsap.min.js"></script>
    <script src="js/script.js"></script>

    <footer class="footer-agnello py-5 mt-5">
        <div class="container text-center">
            <div class="footer-logo brand-font fs-2 mb-3">Agnello</div>
            <p class="mb-1">Agnello © 2026 - Vinhos com Propósito</p>
            <p class="small text-muted">Desenvolvido por <span class="fw-bold text-gold">Codart</span></p>
        </div>
    </footer>
</body>
</html>