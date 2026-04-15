package br.com.fiap.agnello.dao;

import br.com.fiap.agnello.conexao.ConexaoBD;
import br.com.fiap.agnello.model.Vinho; // Importante importar o modelo!
import java.sql.*;

public class VinhoDAO {

    // Mudamos de 'void' para 'Vinho' e o nome para 'buscarPorId'
    public Vinho buscarPorId(String id) {
        String sql = "SELECT * FROM t_agnello_vinho WHERE id_vinho = ?";
        Vinho vinho = null;

        try (Connection conn = ConexaoBD.obterConexao();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, id);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                vinho = new Vinho();
                vinho.setId(rs.getString("id_vinho"));
                vinho.setNome(rs.getString("nome"));
                vinho.setPreco(rs.getDouble("preco"));
                vinho.setTag(rs.getString("tag"));
                vinho.setClasseTag(rs.getString("classe_tag"));
                vinho.setPais(rs.getString("pais"));
                vinho.setRegiao(rs.getString("regiao"));
                vinho.setImagemUrl(rs.getString("imagem_url"));
                vinho.setDescricao(rs.getString("descricao"));
                vinho.setProducao(rs.getString("producao"));
                vinho.setCorpo(rs.getInt("corpo"));
                vinho.setTaninos(rs.getInt("taninos"));
                vinho.setAlcool(rs.getInt("alcool"));
                vinho.setAcidez(rs.getInt("acidez"));
                vinho.setDocura(rs.getInt("docura"));
            }
        } catch (SQLException e) {
            System.err.println("Erro ao buscar no banco: " + e.getMessage());
        }
        return vinho; // Agora a Servlet recebe o objeto preenchido!
    }
}