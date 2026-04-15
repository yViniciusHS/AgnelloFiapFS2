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

    // atributos para o Gráfico do Sommelier
    private int corpo;
    private int taninos;
    private int alcool;
    private int acidez;
    private int docura;

    public Vinho() {}

    // --- Getters e Setters  ---
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

    public int getCorpo() { return corpo; }
    public void setCorpo(int corpo) { this.corpo = corpo; }

    public int getTaninos() { return taninos; }
    public void setTaninos(int taninos) { this.taninos = taninos; }

    public int getAlcool() { return alcool; }
    public void setAlcool(int alcool) { this.alcool = alcool; }

    public int getAcidez() { return acidez; }
    public void setAcidez(int acidez) { this.acidez = acidez; }

    public int getDocura() { return docura; }
    public void setDocura(int docura) { this.docura = docura; }
}