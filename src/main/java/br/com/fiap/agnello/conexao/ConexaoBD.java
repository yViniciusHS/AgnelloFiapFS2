package br.com.fiap.agnello.conexao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConexaoBD {

    // 1. Defina como constantes da classe (static final)
    private static final String URL = System.getenv("DB_URL");
    private static final String USER = System.getenv("DB_USER");
    private static final String PASSWORD = System.getenv("DB_PASSWORD");

    public static Connection obterConexao() {
        try {
            if (URL == null || USER == null || PASSWORD == null) {
                throw new RuntimeException("Variáveis de ambiente (DB_URL, DB_USER, DB_PASSWORD) não configuradas!");
            }

            Class.forName("org.postgresql.Driver");

            return DriverManager.getConnection(URL, USER, PASSWORD);

        } catch (ClassNotFoundException e) {
            System.err.println("Driver não encontrado: " + e.getMessage());
            throw new RuntimeException(e);
        } catch (SQLException e) {
            System.err.println("Erro ao conectar na Azure: " + e.getMessage());
            throw new RuntimeException(e);
        }
    }
}