package br.com.fiap.agnello.servlet;

import br.com.fiap.agnello.dao.UsuarioDAO;
import br.com.fiap.agnello.model.Usuario;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

/**
 * Servlet responsável por carregar os dados dinâmicos do perfil do usuário.
 * Atua como o Controller que conecta o Banco de Dados (Azure) à View (perfil.jsp).
 */
@WebServlet("/perfil")
public class UsuarioServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 1. Recupera a sessão atual
        HttpSession session = request.getSession();

        // 2. Obtém o usuário logado na sessão (definido no LoginServlet)
        Usuario usuarioLogado = (Usuario) session.getAttribute("usuarioLogado");

        if (usuarioLogado != null) {
            // 3. Busca dados em tempo real no banco para garantir que XP e Nível estejam atualizados
            UsuarioDAO dao = new UsuarioDAO();
            Usuario usuarioAtualizado = dao.buscarPorEmail(usuarioLogado.getEmail());

            // 4. Define o atributo para o JSP. No perfil.jsp você usará ${usuario.nome}, etc.
            request.setAttribute("usuario", usuarioAtualizado);

            // 5. Encaminha para o JSP (Forward mantém o objeto no Request)
            request.getRequestDispatcher("perfil.jsp").forward(request, response);
        } else {
            // 6. Segurança: Se não houver sessão, manda para o login
            response.sendRedirect("login.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Redireciona chamadas POST para o GET para evitar erros de método não suportado
        doGet(request, response);
    }
}