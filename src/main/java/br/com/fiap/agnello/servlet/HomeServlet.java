package br.com.fiap.agnello.servlet;

import br.com.fiap.agnello.dao.VinhoDAO;
import br.com.fiap.agnello.model.Vinho;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/home")
public class HomeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        VinhoDAO dao = new VinhoDAO();
        List<Vinho> listaVinhos = dao.listarTodos();

        request.setAttribute("vinhos", listaVinhos);
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }
}