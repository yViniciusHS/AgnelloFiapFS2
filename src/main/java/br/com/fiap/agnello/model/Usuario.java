package br.com.fiap.agnello.model;

public class Usuario {
    private String email;
    private String nome;
    private String nivel;
    private int pontosXp;
    private String membroDesde;
    private String endereco;
    private String cep;
    private String senha;

    public Usuario() {}

    // Getters e Setters
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    public String getNome() { return nome; }
    public void setNome(String nome) { this.nome = nome; }
    public String getNivel() { return nivel; }
    public void setNivel(String nivel) { this.nivel = nivel; }
    public int getPontosXp() { return pontosXp; }
    public void setPontosXp(int pontosXp) { this.pontosXp = pontosXp; }
    public String getMembroDesde() { return membroDesde; }
    public void setMembroDesde(String membroDesde) { this.membroDesde = membroDesde; }
    public String getEndereco() { return endereco; }
    public void setEndereco(String endereco) { this.endereco = endereco; }
    public String getCep() { return cep; }
    public void setCep(String cep) { this.cep = cep; }
    public String getSenha() { return senha; }
    public void setSenha(String senha) { this.senha = senha; }
}