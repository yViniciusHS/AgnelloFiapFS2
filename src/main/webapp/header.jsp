<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<header>
    <div class="custom-header">
        <div class="container d-flex justify-content-between align-items-center">
            <a href="index.jsp" class="logo-text">Velluno</a>

            <div class="search-wrapper d-none d-md-block">
                <i class="bi bi-search"></i>
                <input type="text" placeholder="Pesquisar...">
            </div>

            <button class="btn-cart" id="cart-button" onclick="window.location.href='carrinho.jsp'">
                <i class="bi bi-cart2 me-2"></i><span id="cart-total">R$ 0,00</span> (<span id="cart-count">0</span>)
            </button>
        </div>
    </div>

    <div class="bottom-nav d-none d-lg-block">
        <div class="container d-flex justify-content-between align-items-center">
            <nav>
                <a href="#">Tinto <i class="bi bi-chevron-down ms-1" style="font-size: 0.7rem;"></i></a>
                <a href="#">Branco</a>
                <a href="#">Rosé</a>
                <a href="#">Espumante</a>
                <a href="#">Outras bebidas</a>
            </nav>

            <div class="store-info">
                <div class="d-flex align-items-center">
                    <i class="bi bi-shop"></i>
                    <div>
                        <span style="opacity: 0.6; font-size: 0.7rem;">Minha loja | Fecha às 17h</span><br>
                        <strong>Lively Store <i class="bi bi-chevron-down" style="font-size: 0.7rem; color:white"></i></strong>
                    </div>
                </div>
                <div class="d-flex align-items-center ms-3">
                    <i class="bi bi-gift"></i>
                    <div>
                        <span style="opacity: 0.6; font-size: 0.7rem;">Benefícios exclusivos</span><br>
                        <strong>Clube do Vinho</strong>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>