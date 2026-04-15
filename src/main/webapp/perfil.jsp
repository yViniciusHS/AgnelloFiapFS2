<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Agnello | Meu Perfil</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&family=Italiana&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="css/styles.css">
</head>
<body class="bg-light">


    <jsp:include page="header.jsp" />

    <div class="container my-5 pt-4">
        <div class="row g-4">
            <%-- Menu Lateral de Navegação --%>
            <div class="col-md-3">
                <div class="list-group list-group-flush rounded-4 shadow-sm overflow-hidden border-0">
                    <a href="#" class="list-group-item list-group-item-action active bg-dark text-white profile-tab-link p-3 border-0" data-target="pedidos">
                        <i class="bi bi-box-seam me-2"></i>Meus Pedidos
                    </a>
                    <a href="#" class="list-group-item list-group-item-action profile-tab-link p-3 border-0" data-target="clube">
                        <i class="bi bi-star-fill text-gold me-2"></i>Clube Agnello
                    </a>
                    <a href="#" class="list-group-item list-group-item-action profile-tab-link p-3 border-0" data-target="enderecos">
                        <i class="bi bi-geo-alt me-2"></i>Endereços
                    </a>
                    <a href="#" class="list-group-item list-group-item-action profile-tab-link p-3 border-0" data-target="dados">
                        <i class="bi bi-person me-2"></i>Dados Pessoais
                    </a>
                    <%-- Logout: Encerra a sessão no servidor --%>
                    <a href="logout" class="list-group-item list-group-item-action p-3 text-danger border-top">
                        <i class="bi bi-box-arrow-right me-2"></i>Sair
                    </a>
                </div>
            </div>

            <%-- Conteúdo das Abas --%>
            <div class="col-md-9">

                <%-- Aba: Pedidos --%>
                <div id="pedidos" class="profile-tab-content animate__animated animate__fadeIn">
                    <h2 class="brand-font mb-4">Meus Pedidos</h2>
                    <div class="card border-0 shadow-sm rounded-4 mb-3">
                        <div class="card-body p-4 d-flex justify-content-between align-items-center bg-white">
                            <div>
                                <span class="badge rounded-pill mb-2" style="background-color: var(--hero-bg);">Entregue</span>
                                <h6 class="mb-1 fw-bold">Pedido #88291</h6>
                                <small class="text-muted">Realizado em 12/02/2024</small>
                            </div>
                            <div class="text-end">
                                <p class="fw-bold mb-1" style="color: var(--hero-bg);">R$ 370,00</p>
                                <a href="#" class="text-gold text-decoration-none small fw-bold">Ver detalhes</a>
                            </div>
                        </div>
                    </div>
                </div>

                <%-- Aba: Clube Agnello --%>
                <div id="clube" class="profile-tab-content d-none animate__animated animate__fadeIn">
                    <h2 class="brand-font mb-4">Clube Agnello</h2>

                    <div class="card card-clube border-0 shadow-sm rounded-4 p-4 mb-4">
                        <div class="d-flex justify-content-between align-items-start mb-4">
                            <div>
                                <span class="xp-badge mb-2">NÍVEL: ${usuario.nivel}</span>
                                <h3 class="brand-font text-white mb-0">${usuario.nome}</h3>
                                <p class="small opacity-75 mb-0">Membro desde ${usuario.membroDesde}</p>
                            </div>
                            <div class="text-end">
                                <h2 class="text-gold mb-0">${usuario.pontosXp}</h2>
                                <p class="small opacity-75">Pontos XP</p>
                            </div>
                        </div>

                        <%-- Barra de Progresso Dinâmica  --%>
                        <div class="progress bg-dark mb-2" style="height: 10px;">
                            <div class="progress-bar bg-gold" role="progressbar"
                                 style="width: ${(usuario.pontosXp * 100) / 1000}%"
                                 aria-valuenow="${usuario.pontosXp}" aria-valuemin="0" aria-valuemax="1000"></div>
                        </div>
                        <div class="d-flex justify-content-between small opacity-75 text-white">
                            <span class="text-capitalize">${usuario.nivel.toLowerCase()}</span>
                            <span>Próximo nível: <b>Especialista</b> (Faltam ${1000 - usuario.pontosXp} XP)</span>
                        </div>
                    </div>

                    <%-- Missões e Benefícios  --%>
                    <div class="row g-4">
                        <div class="col-md-6">
                            <h5 class="brand-font mb-3">Missões para pontuar</h5>
                            <div class="card border-0 shadow-sm rounded-4 p-3 mb-2">
                                <div class="d-flex align-items-center">
                                    <div class="fs-3 text-gold me-3"><i class="bi bi-chat-left-text"></i></div>
                                    <div class="flex-grow-1">
                                        <h6 class="mb-0 small fw-bold">Avaliar um Vinho</h6>
                                        <p class="small text-muted mb-0">+50 XP</p>
                                    </div>
                                    <button class="btn btn-sm btn-dark rounded-pill">Fazer</button>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <h5 class="brand-font mb-3">Meus Benefícios</h5>
                            <ul class="list-unstyled">
                                <li class="mb-2 small"><i class="bi bi-check2-circle text-gold me-2"></i> 10% OFF em todas as compras</li>
                                <li class="mb-2 small opacity-50"><i class="bi bi-lock-fill me-2"></i> Rótulos exclusivos (Nível Especialista)</li>
                            </ul>
                        </div>
                    </div>
                </div>

                <%-- Aba: Endereços --%>
                <div id="enderecos" class="profile-tab-content d-none animate__animated animate__fadeIn">
                    <h2 class="brand-font mb-4">Meus Endereços</h2>
                    <div class="card border-0 shadow-sm rounded-4 p-4 bg-white border-start border-4" style="border-color: var(--sand-button) !important;">
                        <p class="mb-1 fw-bold">Casa (Principal)</p>
                        <p class="text-muted mb-0 small">${usuario.endereco}</p>
                        <p class="text-muted small">CEP: ${usuario.cep}</p>
                    </div>
                </div>

                <%-- Aba: Dados Pessoais --%>
                <div id="dados" class="profile-tab-content d-none animate__animated animate__fadeIn">
                    <h2 class="brand-font mb-4">Dados Pessoais</h2>
                    <div class="card border-0 shadow-sm rounded-4 p-4 bg-white">
                        <form class="row g-3">
                            <div class="col-md-6">
                                <label class="form-label text-muted small fw-bold">NOME COMPLETO</label>
                                <input type="text" class="form-control border-0 bg-light rounded-3" value="${usuario.nome}">
                            </div>
                            <div class="col-md-6">
                                <label class="form-label text-muted small fw-bold">E-MAIL</label>
                                <input type="email" class="form-control border-0 bg-light rounded-3" value="${usuario.email}" readonly>
                            </div>
                            <div class="col-12 mt-4">
                                <button type="button" class="btn btn-dark rounded-pill px-4" style="background-color: var(--hero-bg);">Salvar Alterações</button>
                            </div>
                        </form>
                    </div>
                </div>

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
    <script src="js/script.js"></script>
</body>
</html>