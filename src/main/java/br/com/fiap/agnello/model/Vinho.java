package br.com.fiap.agnello.model;

public class Vinho {
    private String id;
    private String nome;
    private double preco;
    private String tag;
    private String classeTag;
    private String pais;
    private String regiao;
    private String imagemUrl;
    private String descricao;
    private String producao;

    public Vinho() {}

    // Getters e Setters
    public String getId() { return id; }
    public void setId(String id) { this.id = id; }
    public String getNome() { return nome; }
    public void setNome(String nome) { this.nome = nome; }
    public double getPreco() { return preco; }
    public void setPreco(double preco) { this.preco = preco; }
    public String getTag() { return tag; }
    public void setTag(String tag) { this.tag = tag; }
    public String getClasseTag() { return classeTag; }
    public void setClasseTag(String classeTag) { this.classeTag = classeTag; }
    public String getPais() { return pais; }
    public void setPais(String pais) { this.pais = pais; }
    public String getRegiao() { return regiao; }
    public void setRegiao(String regiao) { this.regiao = regiao; }
    public String getImagemUrl() { return imagemUrl; }
    public void setImagemUrl(String imagemUrl) { this.imagemUrl = imagemUrl; }
    public String getDescricao() { return descricao; }
    public void setDescricao(String descricao) { this.descricao = descricao; }
    public String getProducao() { return producao; }
    public void setProducao(String producao) { this.producao = producao; }
}