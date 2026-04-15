package br.com.fiap.agnello.servlet;

import br.com.fiap.agnello.dao.UsuarioDAO;
import br.com.fiap.agnello.model.Usuario;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;


 // Servlet responsável por carregar os dados dinâmicos do perfil do usuário.

@WebServlet("/perfil")
public class UsuarioServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Recupera a sessão
        HttpSession session = request.getSession();

        //  Obtém o usuário logado na sessão
        Usuario usuarioLogado = (Usuario) session.getAttribute("usuarioLogado");

        if (usuarioLogado != null) {
            // Busca dados em tempo real no banco
            UsuarioDAO dao = new UsuarioDAO();
            Usuario usuarioAtualizado = dao.buscarPorEmail(usuarioLogado.getEmail());


            request.setAttribute("usuario", usuarioAtualizado);


            request.getRequestDispatcher("perfil.jsp").forward(request, response);
        } else {
            // Se não houver sessão, manda para o login
            response.sendRedirect("login.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Redireciona chamadas POST para o GET
        doGet(request, response);
    }
}