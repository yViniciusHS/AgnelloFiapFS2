package br.com.fiap.agnello.conexao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConexaoBD {

    // O Host encontra-se na página "Descrição geral" do servidor na Azure
    // O parâmetro sslmode=require é obrigatório na Azure
    private static final String URL = "jdbc:postgresql://agn.postgres.database.azure.com:5432/postgres?sslmode=require";
    private static final String USUARIO = "adminagnello";
    private static final String SENHA = "codartfiaP24";

    public static Connection obterConexao() {
        try {
            Class.forName("org.postgresql.Driver");
            return DriverManager.getConnection(URL, USUARIO, SENHA);
        } catch (ClassNotFoundException e) {
            System.err.println("Driver não encontrado: " + e.getMessage());
            throw new RuntimeException(e);
        } catch (SQLException e) {
            System.err.println("Erro ao conectar na Azure: " + e.getMessage());
            throw new RuntimeException(e);
        }
    }
}