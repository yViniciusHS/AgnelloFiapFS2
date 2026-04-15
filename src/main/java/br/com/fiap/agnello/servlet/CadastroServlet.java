package br.com.fiap.agnello.servlet;

import br.com.fiap.agnello.dao.UsuarioDAO;
import br.com.fiap.agnello.model.Usuario;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;


 //Servlet responsável pelo processamento de criação de novas contas.

@WebServlet("/cadastro")
public class CadastroServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Captura dos parâmetros vindos do formulário cadastro.jsp
        String nome = request.getParameter("nome");
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");
        String endereco = request.getParameter("endereco");
        String cep = request.getParameter("cep");

        // Validação simples: impede o prosseguimento se campos essenciais estiverem vazios
        if (nome == null || email == null || senha == null || nome.isEmpty() || email.isEmpty()) {
            request.setAttribute("erro", "Por favor, preencha todos os campos obrigatórios.");
            request.getRequestDispatcher("cadastro.jsp").forward(request, response);
            return;
        }

        // Instanciação do modelo com dados iniciais
        Usuario u = new Usuario();
        u.setNome(nome);
        u.setEmail(email);
        u.setSenha(senha);
        u.setEndereco(endereco);
        u.setCep(cep);

        // Atributos padrão para membros do Clube Agnello
        u.setNivel("INICIANTE");
        u.setPontosXp(0);
        u.setMembroDesde("Abr 2026");

        UsuarioDAO dao = new UsuarioDAO();

        // Tenta persistir no banco de dados da Azure
        if (dao.cadastrar(u)) {

            response.sendRedirect("login.jsp?sucesso=true");
        } else {

            request.setAttribute("erro", "Não foi possível criar a conta. Verifique se o e-mail já está cadastrado.");
            request.getRequestDispatcher("cadastro.jsp").forward(request, response);
        }
    }
}