package br.com.fiap.agnello.dao;

import br.com.fiap.agnello.conexao.ConexaoBD;
import br.com.fiap.agnello.model.Vinho;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class VinhoDAO {


     //Busca todos os vinhos cadastrados.

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

    //Busca vinhos baseada no Perfil Sensorial ou Ocasião Especial.

    public List<Vinho> buscarPorPerfil(String perfil) {
        List<Vinho> vinhos = new ArrayList<>();
        StringBuilder sql = new StringBuilder("SELECT * FROM t_agnello_vinho WHERE ");


        switch (perfil.toLowerCase()) {
            case "leve":
                // Vinhos leves: pouco corpo e boa acidez
                sql.append("corpo <= 4 AND acidez >= 6");
                break;
            case "intenso":
                // Vinhos intensos: muito corpo e taninos presentes
                sql.append("corpo >= 7 AND taninos >= 7");
                break;
            case "fresco":
                // Vinhos frescos: alta acidez e baixa doçura
                sql.append("acidez >= 7 AND docura <= 4");
                break;
            case "romantico":
                // Ocasião: Vinhos sofisticados (Reserva) ou que contenham o termo na descrição
                sql.append("(descricao ILIKE '%romantico%' OR nome ILIKE '%Reserva%')");
                break;
            case "piscina":
                // Ocasião: Brancos e Rosés refrescantes
                sql.append("classe_tag IN ('branco', 'rose') AND acidez >= 6");
                break;
            case "churrasco":
                // Ocasião: Tintos encorpados
                sql.append("classe_tag = 'tinto' AND corpo >= 7");
                break;
            default:
                // Se não for um perfil predefinido, realiza a busca textual flexível
                return buscarParaSommelier(perfil);
        }

        sql.append(" ORDER BY nome ASC");

        try (Connection conn = ConexaoBD.obterConexao();
             PreparedStatement stmt = conn.prepareStatement(sql.toString());
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                vinhos.add(preencherVinho(rs));
            }
        } catch (SQLException e) {
            System.err.println("Erro ao buscar por perfil/ocasião: " + e.getMessage());
        }
        return vinhos;
    }


     //Busca vinhos baseada em termos/ocasiões

    public List<Vinho> buscarParaSommelier(String termo) {
        List<Vinho> vinhos = new ArrayList<>();
        String sql = "SELECT * FROM t_agnello_vinho " +
                "WHERE descricao ILIKE ? OR classe_tag ILIKE ? OR nome ILIKE ? " +
                "ORDER BY nome ASC";

        try (Connection conn = ConexaoBD.obterConexao();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            String query = "%" + termo + "%";
            stmt.setString(1, query);
            stmt.setString(2, query);
            stmt.setString(3, query);

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    vinhos.add(preencherVinho(rs));
                }
            }
        } catch (SQLException e) {
            System.err.println("Erro na busca textual do sommelier: " + e.getMessage());
        }
        return vinhos;
    }


     //Busca vinhos por uma categoria específica (tinto, branco, rose).

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


     // Busca um vinho detalhado por ID único.

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

    //Mapeamento do ResultSet para o Objeto Vinho.

    private Vinho preencherVinho(ResultSet rs) throws SQLException {
        Vinho v = new Vinho();
        v.setId(rs.getString("id_vinho"));
        v.setNome(rs.getString("nome"));
        v.setPreco(rs.getDouble("preco"));
        v.setTag(rs.getString("tag"));
        v.setClasseTag(rs.getString("classe_tag"));
        v.setPais(rs.getString("pais"));
        v.setRegiao(rs.getString("regiao"));
        v.setImagemUrl(rs.getString("imagem_url"));
        v.setDescricao(rs.getString("descricao"));
        v.setProducao(rs.getString("producao"));

        // Atributos técnicos para recomendação e Gráfico de Radar
        v.setCorpo(rs.getInt("corpo"));
        v.setTaninos(rs.getInt("taninos"));
        v.setAlcool(rs.getInt("alcool"));
        v.setAcidez(rs.getInt("acidez"));
        v.setDocura(rs.getInt("docura"));
        return v;
    }
}