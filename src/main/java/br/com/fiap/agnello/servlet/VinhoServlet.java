package br.com.fiap.agnello.servlet;

import br.com.fiap.agnello.dao.VinhoDAO;
import br.com.fiap.agnello.model.Vinho;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/detalhe-vinho")
public class VinhoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Pega o ID que vem na URL (ex: detalhe-vinho?id=sip-happens)
        String idVinho = request.getParameter("id");

        VinhoDAO dao = new VinhoDAO();
        Vinho vinho = dao.buscarPorId(idVinho);

        if (vinho != null) {
            // "Guarda" o objeto vinho para o JSP conseguir ler
            request.setAttribute("produto", vinho);
            // Manda para a página de produto
            request.getRequestDispatcher("produto.jsp").forward(request, response);
        } else {
            response.sendRedirect("index.jsp");
        }
    }
}