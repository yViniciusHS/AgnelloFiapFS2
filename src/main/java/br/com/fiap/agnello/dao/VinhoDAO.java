package br.com.fiap.agnello.dao;

import br.com.fiap.agnello.conexao.ConexaoBD;
import br.com.fiap.agnello.model.Vinho;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Camada de persistência para os vinhos da Vinheria Agnello.
 * Conecta-se ao banco PostgreSQL na Azure.
 */
public class VinhoDAO {

    /**
     * Busca todos os vinhos para exibir na vitrine da index.jsp.
     * Garante que preços e informações sejam consistentes em todo o site.
     */
    public List<Vinho> listarTodos() {
        List<Vinho> vinhos = new ArrayList<>();
        String sql = "SELECT * FROM t_agnello_vinho ORDER BY nome ASC";

        try (Connection conn = ConexaoBD.obterConexao();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                // Reaproveita o método auxiliar para preencher o objeto
                vinhos.add(preencherVinho(rs));
            }
        } catch (SQLException e) {
            System.err.println("Erro ao listar vinhos da Azure: " + e.getMessage());
        }
        return vinhos;
    }

    /**
     * Busca um vinho específico por ID para a página produto.jsp.
     */
    public Vinho buscarPorId(String id) {
        String sql = "SELECT * FROM t_agnello_vinho WHERE id_vinho = ?";
        Vinho vinho = null;

        try (Connection conn = ConexaoBD.obterConexao();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    vinho = preencherVinho(rs);
                }
            }
        } catch (SQLException e) {
            System.err.println("Erro ao buscar vinho no banco: " + e.getMessage());
        }
        return vinho;
    }

    /**
     * Método auxiliar para evitar repetição de código (DRY).
     * Mapeia as colunas do banco Azure para os atributos do objeto Vinho.
     */
    private Vinho preencherVinho(ResultSet rs) throws SQLException {
        Vinho v = new Vinho();
        v.setId(rs.getString("id_vinho"));
        v.setNome(rs.getString("nome"));
        v.setPreco(rs.getDouble("preco")); // Corrige a diferença entre 142.00 e 142.99
        v.setTag(rs.getString("tag"));
        v.setClasseTag(rs.getString("classe_tag"));
        v.setPais(rs.getString("pais"));
        v.setRegiao(rs.getString("regiao"));
        v.setImagemUrl(rs.getString("imagem_url"));
        v.setDescricao(rs.getString("descricao"));
        v.setProducao(rs.getString("producao"));

        // Atributos para o Gráfico de Radar do Sommelier Digital
        v.setCorpo(rs.getInt("corpo"));
        v.setTaninos(rs.getInt("taninos"));
        v.setAlcool(rs.getInt("alcool"));
        v.setAcidez(rs.getInt("acidez"));
        v.setDocura(rs.getInt("docura"));
        return v;
    }
}