package br.com.fiap.agnello.servlet;

import br.com.fiap.agnello.dao.VinhoDAO;
import br.com.fiap.agnello.model.Vinho;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;


 //Servlet responsável pela lógica do Sommelier Digital.

@WebServlet("/sommelier")
public class SommelierServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Captura o termo de busca vindo do formulário ou dos botões de atalho
        String busca = request.getParameter("busca");
        VinhoDAO dao = new VinhoDAO();
        List<Vinho> recomendacoes;

        if (busca != null && !busca.trim().isEmpty()) {
            //utiliza o metodo buscarPorPerfil
            //Ele deteta automaticamente se é um perfil técnico (Leve/Intenso/Fresco) ou se deve fazer uma busca textual por ocasião.

            recomendacoes = dao.buscarPorPerfil(busca);
        } else {
            // Caso a busca esteja vazia, exibe todos os vinhos como sugestão inicial
            recomendacoes = dao.listarTodos();
        }

        // Envia a lista filtrada para o sommelier.jsp
        request.setAttribute("vinhosRecomendados", recomendacoes);

        // Mantém o encaminhamento para a página do sommelier
        request.getRequestDispatcher("sommelier.jsp").forward(request, response);
    }
}