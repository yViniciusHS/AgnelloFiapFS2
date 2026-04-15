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

    <header class="custom-header py-3">
        <div class="container d-flex justify-content-between align-items-center">
            <a href="index.jsp" class="logo fs-2 text-decoration-none">Agnello</a>
            <div class="user-actions d-flex gap-3 align-items-center">
                <a href="perfil.jsp" class="profile-btn text-white fs-4"><i class="bi bi-person-circle"></i></a>
                <button class="cart-btn border-0 bg-transparent text-white" data-bs-toggle="offcanvas" data-bs-target="#cartOffcanvas">
                    <i class="bi bi-cart2"></i> <span id="cart-total-header">R$ 0,00</span>
                </button>
                <a href="index.jsp" class="text-white text-decoration-none ms-2 small text-uppercase letter-spacing-2">
                    <i class="bi bi-arrow-left"></i> Voltar
                </a>
            </div>
        </div>
    </header>

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
                <h1 class="display-3 brand-font my-2">${produto.nome}</h1>
                <p class="fs-2 fw-light text-dark mb-4">R$ ${produto.preco}</p>

                <p class="text-muted fs-5 mb-5 fw-light" style="line-height: 1.8;">${produto.descricao}</p>

                <div class="row g-3 mb-5">
                    <div class="col-6">
                        <div class="p-3 border rounded-4 bg-white shadow-sm h-100">
                            <small class="text-muted d-block text-uppercase mb-1" style="font-size: 0.7rem; letter-spacing: 1px;">País</small>
                            <span class="fw-bold">${produto.pais}</span>
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="p-3 border rounded-4 bg-white shadow-sm h-100">
                            <small class="text-muted d-block text-uppercase mb-1" style="font-size: 0.7rem; letter-spacing: 1px;">Região</small>
                            <span class="fw-bold">${produto.regiao}</span>
                        </div>
                    </div>
                </div>

                <div class="p-4 border rounded-5 bg-white shadow-sm mb-5">
                    <h6 class="fw-bold mb-3 text-uppercase small letter-spacing-2">Segredos da Vinícola</h6>
                    <p class="text-muted mb-0 small" style="line-height: 1.6;">${produto.producao}</p>
                </div>

                <div class="mb-5 p-4 bg-white rounded-5 border shadow-sm">
                    <h6 class="brand-font text-center mb-4 text-uppercase letter-spacing-2">Notas do Sommelier</h6>
                    <div style="height: 250px; position: relative;">
                        <canvas id="flavorRadarChart"></canvas>
                    </div>
                </div>

                <div class="d-grid gap-3">
                    <button class="btn btn-dark btn-lg rounded-pill py-3 fw-bold shadow-lg" onclick="adicionarAoCarrinho('${produto.nome}', ${produto.preco})">
                        <i class="bi bi-bag-plus me-2"></i> ADICIONAR AO CARRINHO
                    </button>
                </div>
            </div>
        </div>
    </main>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="js/script.js"></script>
</body>
</html>