package br.com.fiap.agnello.dao;

import br.com.fiap.agnello.conexao.ConexaoBD;
import br.com.fiap.agnello.model.Usuario;
import java.sql.*;

public class UsuarioDAO {

    public Usuario buscarPorEmail(String email) {
        String sql = "SELECT * FROM t_agnello_usuario WHERE email = ?";
        Usuario usuario = null;
        try (Connection conn = ConexaoBD.obterConexao();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                usuario = preencherUsuario(rs);
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return usuario;
    }

    public Usuario validarLogin(String email, String senha) {
        String sql = "SELECT * FROM t_agnello_usuario WHERE email = ? AND senha = ?";
        Usuario usuario = null;
        try (Connection conn = ConexaoBD.obterConexao();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, email);
            stmt.setString(2, senha);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                usuario = preencherUsuario(rs);
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return usuario;
    }

    public boolean cadastrar(Usuario u) {
        String sql = "INSERT INTO t_agnello_usuario (email, nome, senha, nivel, pontos_xp, membro_desde, endereco, cep) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = ConexaoBD.obterConexao();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, u.getEmail());
            stmt.setString(2, u.getNome());
            stmt.setString(3, u.getSenha());
            stmt.setString(4, u.getNivel());
            stmt.setInt(5, u.getPontosXp());
            stmt.setString(6, u.getMembroDesde());
            stmt.setString(7, u.getEndereco());
            stmt.setString(8, u.getCep());
            stmt.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Método auxiliar
    private Usuario preencherUsuario(ResultSet rs) throws SQLException {
        Usuario u = new Usuario();
        u.setEmail(rs.getString("email"));
        u.setNome(rs.getString("nome"));
        u.setNivel(rs.getString("nivel"));
        u.setPontosXp(rs.getInt("pontos_xp"));
        u.setMembroDesde(rs.getString("membro_desde"));
        u.setEndereco(rs.getString("endereco"));
        u.setCep(rs.getString("cep"));
        return u;
    }



}