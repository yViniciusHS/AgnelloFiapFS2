document.addEventListener("DOMContentLoaded", function() {

    // 1. Splash Screen (Animação de entrada)
    const introOverlay = document.querySelector(".intro-overlay");
    if(introOverlay) {
        if (typeof gsap !== 'undefined') {
            document.body.style.overflow = 'hidden';
            const tl = gsap.timeline();
            tl.to(".intro-logo", { opacity: 0, scale: 0.85, duration: 1.2, delay: 0.6, ease: "power2.inOut" })
              .to(".intro-overlay", { yPercent: -100, duration: 1.2, ease: "power3.inOut" }, "-=0.2")
              .from(".hero-content", {
                  opacity: 0,
                  y: 30,
                  duration: 1,
                  onComplete: () => document.body.style.overflow = 'auto'
              }, "-=0.8");
        } else {
            introOverlay.style.display = 'none';
        }
    }

    // 2. Gráfico de Radar na Página de Produto (agora via Servlet)
    if (window.location.pathname.includes('detalhe-vinho')) {
        const params = new URLSearchParams(window.location.search);
        const id = params.get('id');

        const radarData = {
            "sip-happens": [4, 2, 5, 8, 3],
            "valle-andino": [8, 7, 6, 4, 1],
            "sapphire-sunset": [3, 1, 5, 6, 4]
        };

        const ctx = document.getElementById('flavorRadarChart');
        if (ctx && typeof Chart !== 'undefined' && radarData[id]) {
            new Chart(ctx, {
                type: 'radar',
                data: {
                    labels: ['Corpo', 'Taninos', 'Álcool', 'Acidez', 'Doçura'],
                    datasets: [{
                        data: radarData[id],
                        backgroundColor: 'rgba(201, 185, 147, 0.2)',
                        borderColor: '#c9b993',
                        pointBackgroundColor: '#2b0b10',
                        borderWidth: 2
                    }]
                },
                options: {
                    scales: {
                        r: {
                            min: 0, max: 10,
                            ticks: { display: false },
                            grid: { color: 'rgba(0,0,0,0.05)' },
                            pointLabels: { font: { size: 11, family: 'Inter' } }
                        }
                    },
                    plugins: { legend: { display: false } },
                    maintainAspectRatio: false
                }
            });
        }
    }

    // 3. Busca Expansível (Header)
    const searchToggleBtn = document.getElementById('searchToggleBtn');
    const expandableSearch = document.querySelector('.expandable-search');
    const searchInput = document.getElementById('searchInput');

    if (searchToggleBtn && expandableSearch) {
        searchToggleBtn.addEventListener('click', (e) => {
            e.preventDefault();
            expandableSearch.classList.toggle('active');
            if (expandableSearch.classList.contains('active') && searchInput) {
                searchInput.focus();
            }
        });
    }

    // 4. Lógica de Filtros na Vitrine
    const filtrosBotao = document.querySelectorAll('.filter-btn');
    const cardsVinho = document.querySelectorAll('.product-card');

    filtrosBotao.forEach(botao => {
        botao.addEventListener('click', (e) => {
            e.preventDefault();
            const categoria = botao.getAttribute('data-filter');

            cardsVinho.forEach(card => {
                const tag = card.querySelector('.tag');
                if (categoria === 'all' || (tag && tag.classList.contains(categoria))) {
                    card.style.display = 'block';
                } else {
                    card.style.display = 'none';
                }
            });
        });
    });
});

// --- SISTEMA DE CARRINHO (Global) ---
let carrinho = [];
let total = 0;

function adicionarAoCarrinho(nome, preco) {
    carrinho.push({ nome, preco });
    total += preco;
    atualizarInterfaceCarrinho();

    const cartEl = document.getElementById('cartOffcanvas');
    if (cartEl) {
        const bsOffcanvas = bootstrap.Offcanvas.getOrCreateInstance(cartEl);
        bsOffcanvas.show();
    }
}

function atualizarInterfaceCarrinho() {
    const totalEl = document.getElementById('cartTotal');
    const badgeEl = document.querySelector('.cart-btn');
    const cartBody = document.querySelector('.offcanvas-body-items');

    if (totalEl) totalEl.innerText = `Total: R$ ${total.toFixed(2)}`;
    if (badgeEl) {
        badgeEl.innerHTML = `<i class="bi bi-cart2"></i> R$ ${total.toFixed(2)} (${carrinho.length})`;
    }

    if (cartBody) {
        if (carrinho.length === 0) {
            cartBody.innerHTML = '<p class="text-muted text-center py-4">Seu carrinho está vazio.</p>';
        } else {
            cartBody.innerHTML = carrinho.map((item) => `
                <div class="d-flex justify-content-between align-items-center border-bottom pb-2 mb-2">
                    <div>
                        <span class="d-block fw-bold small text-dark">${item.nome}</span>
                        <span class="text-muted" style="font-size: 0.75rem;">1 unidade</span>
                    </div>
                    <span class="fw-bold small">R$ ${item.preco.toFixed(2)}</span>
                </div>
            `).join('');
        }
    }
}