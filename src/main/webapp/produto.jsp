<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Agnello | ${produto.nome}</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&family=Italiana&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="css/styles.css">
</head>
<body class="bg-light">

    <jsp:include page="header.jsp" />

    <main class="container my-5 py-5">
        <div class="row g-5">
            <div class="col-md-6">
                <div class="product-showcase bg-white rounded-5 shadow-sm p-4 d-flex justify-content-center align-items-center position-relative overflow-hidden" style="min-height: 600px;">
                    <div class="bg-circle" style="position: absolute; width: 400px; height: 400px; background: rgba(0,0,0,0.02); border-radius: 50%; z-index: 0;"></div>
                    <img id="product-img" src="${produto.imagemUrl}" class="img-fluid position-relative" alt="${produto.nome}" style="max-height: 500px; z-index: 1; filter: drop-shadow(0 20px 30px rgba(0,0,0,0.1));">
                </div>
            </div>

            <div class="col-md-6 ps-lg-5">
                <nav aria-label="breadcrumb" class="mb-4">
                    <ol class="breadcrumb small text-uppercase letter-spacing-2">
                        <li class="breadcrumb-item"><a href="index.jsp" class="text-muted text-decoration-none">Início</a></li>
                        <li class="breadcrumb-item active text-dark fw-bold" aria-current="page">${produto.regiao}</li>
                    </ol>
                </nav>

                <span class="tag tag-${produto.classeTag} mb-3 d-inline-block">${produto.tag}</span>
                <h1 id="product-name" class="display-3 brand-font my-2">${produto.nome}</h1>
                <p id="product-price" class="fs-2 fw-light text-dark mb-4">R$ ${produto.preco}</p>

                <p id="product-desc" class="text-muted fs-5 mb-5 fw-light" style="line-height: 1.8;">${produto.descricao}</p>

                <div class="row g-3 mb-5">
                    <div class="col-6">
                        <div class="p-3 border rounded-4 bg-white shadow-sm h-100">
                            <small class="text-muted d-block text-uppercase mb-1" style="font-size: 0.7rem; letter-spacing: 1px;">País</small>
                            <span id="product-country" class="fw-bold">${produto.pais}</span>
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="p-3 border rounded-4 bg-white shadow-sm h-100">
                            <small class="text-muted d-block text-uppercase mb-1" style="font-size: 0.7rem; letter-spacing: 1px;">Região</small>
                            <span id="product-region" class="fw-bold">${produto.regiao}</span>
                        </div>
                    </div>
                </div>

                <div class="p-4 border rounded-5 bg-white shadow-sm mb-5">
                    <h6 class="fw-bold mb-3 text-uppercase small letter-spacing-2">Segredos da Vinícola</h6>
                    <p id="product-prod" class="text-muted mb-0 small" style="line-height: 1.6;">${produto.producao}</p>
                </div>

                <div class="mb-5 p-4 bg-white rounded-5 border shadow-sm">
                    <h6 class="brand-font text-center mb-4 text-uppercase letter-spacing-2">Notas do Sommelier</h6>
                    <div style="height: 250px; position: relative;">
                        <canvas id="flavorRadarChart"
                                data-corpo="${produto.corpo}"
                                data-taninos="${produto.taninos}"
                                data-alcool="${produto.alcool}"
                                data-acidez="${produto.acidez}"
                                data-docura="${produto.docura}">
                        </canvas>
                    </div>
                </div>

                <div class="d-grid gap-3">
                    <button class="btn btn-dark btn-lg rounded-pill py-3 fw-bold shadow-lg" onclick="adicionarAoCarrinho('${produto.nome}', ${produto.preco})">
                        <i class="bi bi-bag-plus me-2"></i> ADICIONAR AO CARRINHO
                    </button>
                    <div class="p-3 border rounded-4 d-flex align-items-center gap-3 bg-white">
                        <i class="bi bi-truck text-success fs-4"></i>
                        <span class="small">Frete grátis em pedidos acima de R$ 500 para todo o Brasil.</span>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <div class="offcanvas offcanvas-end" tabindex="-1" id="cartOffcanvas">
        <div class="offcanvas-header text-white" style="background-color: var(--hero-bg, #2b0b10);">
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

    <footer class="footer-agnello py-5 mt-5">
        <div class="container text-center">
            <div class="footer-logo brand-font fs-2 mb-3">Agnello</div>
            <p class="mb-1">Agnello © 2026 - Vinhos com Propósito</p>
            <p class="small text-muted">Desenvolvido por <span class="fw-bold text-gold">Codart</span></p>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="js/script.js"></script>
</body>
</html>