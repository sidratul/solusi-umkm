package com.sidratul.solusiumkm.model;

public class Umkm {
    private Integer id;
    private String kodeUmkm;
    private String namaUmkm;
    private String pemilikUmkm;
    private KategoriUmkm kategoriUmkm;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getKodeUmkm() {
        return kodeUmkm;
    }

    public void setKodeUmkm(String kodeUmkm) {
        this.kodeUmkm = kodeUmkm;
    }

    public String getNamaUmkm() {
        return namaUmkm;
    }

    public void setNamaUmkm(String namaUmkm) {
        this.namaUmkm = namaUmkm;
    }

    public String getPemilikUmkm() {
        return pemilikUmkm;
    }

    public void setPemilikUmkm(String pemilikUmkm) {
        this.pemilikUmkm = pemilikUmkm;
    }

    public KategoriUmkm getKategoriUmkm() {
        return kategoriUmkm;
    }

    public void setKategoriUmkm(KategoriUmkm kategoriUmkm) {
        this.kategoriUmkm = kategoriUmkm;
    }

    public String getKeteranganUmkm() {
        return keteranganUmkm;
    }

    public void setKeteranganUmkm(String keteranganUmkm) {
        this.keteranganUmkm = keteranganUmkm;
    }

    public String getVisi() {
        return visi;
    }

    public void setVisi(String visi) {
        this.visi = visi;
    }

    public String getMisi() {
        return misi;
    }

    public void setMisi(String misi) {
        this.misi = misi;
    }

    public String getAlamat() {
        return alamat;
    }

    public void setAlamat(String alamat) {
        this.alamat = alamat;
    }

    public String getNoTelp() {
        return noTelp;
    }

    public void setNoTelp(String noTelp) {
        this.noTelp = noTelp;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    private String keteranganUmkm;
    private String visi;
    private String misi;
    private String alamat;
    private String noTelp;
    private String email;

}