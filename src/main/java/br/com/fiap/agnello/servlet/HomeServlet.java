package br.com.fiap.agnello.servlet;

import br.com.fiap.agnello.dao.VinhoDAO;
import br.com.fiap.agnello.model.Vinho;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

/**
 * Servlet responsável por gerenciar o carregamento da página inicial (Home).
 * Mapeado para a rota "/home".
 */
@WebServlet("/home")
public class HomeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 1. Instancia o DAO para acessar o banco de dados na Azure
        VinhoDAO dao = new VinhoDAO();

        // 2. Chama o método que busca todos os vinhos (sincronizando preços e informações)
        List<Vinho> listaVinhos = dao.listarTodos();

        // 3. Define a lista como um atributo da requisição.
        // O nome "vinhos" deve coincidir com o 'items' no <c:forEach> do index.jsp
        request.setAttribute("vinhos", listaVinhos);

        // 4. Encaminha a requisição para o JSP processar o HTML dinâmico
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
}