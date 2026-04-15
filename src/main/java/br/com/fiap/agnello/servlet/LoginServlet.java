package br.com.fiap.agnello.servlet;

import br.com.fiap.agnello.dao.UsuarioDAO;
import br.com.fiap.agnello.model.Usuario;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");

        UsuarioDAO dao = new UsuarioDAO();
        Usuario usuario = dao.validarLogin(email, senha);

        if (usuario != null) {
            // Cria a Sessão para o utilizador
            HttpSession session = request.getSession();
            session.setAttribute("usuarioLogado", usuario);
            response.sendRedirect("index.jsp");
        } else {
            // Retorna com erro
            request.setAttribute("erro", "Email ou palavra-passe incorretos!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}