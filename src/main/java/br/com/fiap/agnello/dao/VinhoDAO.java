package br.com.fiap.agnello.dao;

import br.com.fiap.agnello.conexao.ConexaoBD;
import br.com.fiap.agnello.model.Vinho;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Camada de persistência para os vinhos da Vinheria Agnello.
 * Gerencia a comunicação entre a aplicação Java e o PostgreSQL na Azure.
 */
public class VinhoDAO {

    /**
     * Busca todos os vinhos cadastrados.
     * Utilizado pela HomeServlet para preencher a vitrine principal.
     */
    public List<Vinho> listarTodos() {
        List<Vinho> vinhos = new ArrayList<>();
        String sql = "SELECT * FROM t_agnello_vinho ORDER BY nome ASC";

        try (Connection conn = ConexaoBD.obterConexao();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                vinhos.add(preencherVinho(rs));
            }
        } catch (SQLException e) {
            System.err.println("Erro ao listar vinhos da Azure: " + e.getMessage());
        }
        return vinhos;
    }

    /**
     * Busca vinhos por uma categoria específica (tinto, branco, rose).
     * Essencial para o funcionamento dos filtros do Header.
     */
    public List<Vinho> listarPorCategoria(String categoria) {
        List<Vinho> vinhos = new ArrayList<>();
        String sql = "SELECT * FROM t_agnello_vinho WHERE classe_tag = ? ORDER BY nome ASC";

        try (Connection conn = ConexaoBD.obterConexao();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, categoria.toLowerCase());
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    vinhos.add(preencherVinho(rs));
                }
            }
        } catch (SQLException e) {
            System.err.println("Erro ao filtrar vinhos por categoria: " + e.getMessage());
        }
        return vinhos;
    }

    /**
     * Busca um vinho detalhado por seu ID único.
     * Utilizado pela VinhoServlet para carregar a página produto.jsp.
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
     * Método auxiliar para centralizar o mapeamento do ResultSet para o Objeto.
     * Garante que o preço real (ex: 142.99) seja lido corretamente da Azure.
     */
    private Vinho preencherVinho(ResultSet rs) throws SQLException {
        Vinho v = new Vinho();
        v.setId(rs.getString("id_vinho")); // Remova o underline extra que causou o erro 500 // O nome correto no seu banco é sem o underline extra; // Verifique se o nome da coluna no banco é exatamente este
        v.setNome(rs.getString("nome"));
        v.setPreco(rs.getDouble("preco"));
        v.setTag(rs.getString("tag"));
        v.setClasseTag(rs.getString("classe_tag"));
        v.setPais(rs.getString("pais"));
        v.setRegiao(rs.getString("regiao"));
        v.setImagemUrl(rs.getString("imagem_url"));
        v.setDescricao(rs.getString("descricao"));
        v.setProducao(rs.getString("producao"));

        // Atributos para o Gráfico de Radar (Sommelier Digital)
        v.setCorpo(rs.getInt("corpo"));
        v.setTaninos(rs.getInt("taninos"));
        v.setAlcool(rs.getInt("alcool"));
        v.setAcidez(rs.getInt("acidez"));
        v.setDocura(rs.getInt("docura"));
        return v;
    }
}