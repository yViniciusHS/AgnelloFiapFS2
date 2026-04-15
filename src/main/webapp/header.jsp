<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<header class="custom-header">
    <div class="container-fluid px-4 px-lg-5 header-grid">
        <div class="header-left">
            <%-- Alterado de index.jsp para home para garantir o carregamento do banco --%>
            <a href="home" class="logo text-decoration-none">Agnello</a>
        </div>

        <ul class="nav-links mb-0 d-none d-lg-flex">
            <%-- Filtros agora apontam para a rota dinâmica --%>
            <li><a href="home" class="filter-btn" data-filter="tinto">Tintos</a></li>
            <li><a href="home" class="filter-btn" data-filter="branco">Brancos</a></li>
            <li><a href="home" class="filter-btn" data-filter="rose">Rosés</a></li>
            <li><a href="home" class="filter-btn" data-filter="all">Todos</a></li>
            <li><a href="sommelier.jsp" class="fw-bold" style="color: var(--sand-button);">Sommelier</a></li>
            <li class="expandable-search">
                <button class="search-toggle" id="searchToggleBtn"><i class="bi bi-search"></i></button>
                <input type="text" class="search-input" id="searchInput" placeholder="Buscar...">
            </li>
        </ul>

        <div class="user-actions d-flex align-items-center gap-3">
            <% if (session.getAttribute("usuarioLogado") != null) { %>
                <a href="perfil" class="profile-btn"><i class="bi bi-person-circle"></i></a>
            <% } else { %>
                <a href="login.jsp" class="text-white text-decoration-none small text-uppercase letter-spacing-2 fw-bold">Entrar</a>
                <a href="cadastro.jsp" class="btn btn-outline-light btn-sm rounded-pill px-3"
                   style="font-size: 0.7rem; border-color: var(--sand-button); color: var(--sand-button);">CADASTRE-SE</a>
            <% } %>

            <button class="cart-btn border-0" data-bs-toggle="offcanvas" data-bs-target="#cartOffcanvas">
                <i class="bi bi-cart2"></i> <span id="cart-total-header">R$ 0,00</span>
            </button>
        </div>
    </div>
</header>