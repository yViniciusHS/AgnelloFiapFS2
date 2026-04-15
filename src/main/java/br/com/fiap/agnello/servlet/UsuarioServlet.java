package br.com.fiap.agnello.servlet;

import br.com.fiap.agnello.dao.UsuarioDAO;
import br.com.fiap.agnello.model.Usuario;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;


 // Servlet responsável por carregar os dados dinâmicos do perfil do usuário.
 //Atua como o Controller que conecta o Banco de Dados (Azure) à View (perfil.jsp).

@WebServlet("/perfil")
public class UsuarioServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Recupera a sessão
        HttpSession session = request.getSession();

        //  Obtém o usuário logado na sessão
        Usuario usuarioLogado = (Usuario) session.getAttribute("usuarioLogado");

        if (usuarioLogado != null) {
            // Busca dados em tempo real no banco para garantir que XP e Nível
            UsuarioDAO dao = new UsuarioDAO();
            Usuario usuarioAtualizado = dao.buscarPorEmail(usuarioLogado.getEmail());

            // atributo para o JSP.
            request.setAttribute("usuario", usuarioAtualizado);

            // Encamina para o JSP
            request.getRequestDispatcher("perfil.jsp").forward(request, response);
        } else {
            // Se não houver sessão, manda para o login
            response.sendRedirect("login.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Redireciona chamadas POST para o GET para evitar erros
        doGet(request, response);
    }
}