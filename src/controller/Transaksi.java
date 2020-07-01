package controller;

import data.Barang;
import data.Admin;
import data.Gudang;
import database.Koneksi;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

public class Transaksi {
    Koneksi koneksi;
    ArrayList<Barang> arrBarang;
    ArrayList<Admin> arrAdmin;
    ArrayList<Gudang> arrGudang;
    private Admin Admin;
    private Gudang Gudang;
    
    public Transaksi() throws SQLException {
        this.koneksi = new Koneksi();
        this.arrBarang = new ArrayList<>();
        this.arrAdmin = new ArrayList<>();
        this.arrGudang = new ArrayList<>();
    }
    
    public ArrayList<Barang>getDataBarang() throws SQLException {
        this.arrBarang.clear();
        ResultSet rs = this.koneksi.GetData("SELECT * FROM BARANG_90493 JOIN ADMIN_90493 ON "
                + "BARANG_90493.USER_NAME = ADMIN_90493.USER_NAME ");
        while(rs.next()) {
            Barang barang = new Barang();
            Barang.setId_Barang(rs.getInt("id_barang"));
            Barang.setUser_name(rs.getString("user_name"));
            Barang.setNama_barang(rs.getString("nama_barang"));
            Barang.setTanggal_masuk(rs.getDate("tanggal_masuk"));
            Barang.setTanggal_expired(rs.getDate("tanggal_expired"));
            Barang.setKemasan_barang(rs.getInt("kemasan_barang"));
            Barang.setJumlah_stok(rs.getDouble("jumlah_stok"));
            Barang.setJenis_sembako(rs.getString("jenis_sembako"));
            Barang.setHarga(rs.getDouble("harga"));
            this.arrBarang.add(barang);
        }
        return this.arrBarang;
    }
    public ArrayList<Admin>getDataAdmin() throws SQLException {
        this.arrAdmin.clear();
        ResultSet rs = this.koneksi.GetData("SELECT * FROM ADMIN_90493");
        while(rs.next()) {
            Admin admin = new Admin();
            Admin.setUser_name(rs.getString("user_name"));
            Admin.setNama(rs.getString("nama"));
            Admin.setPassword(rs.getString("password"));
            this.arrAdmin.add(Admin);
        }
        return this.arrAdmin;
    }
    public ArrayList<Gudang>getDataGudang() throws SQLException {
        this.arrGudang.clear();
        ResultSet rs = this.koneksi.GetData("SELECT * FROM GUDANG_90493");
        while(rs.next()) {
            Gudang gudang = new Gudang();
            Gudang.setId_Gudang(rs.getInt("id_gudang"));
            Gudang.setLokasi(rs.getString("lokasi"));
            Gudang.setKapasitas(rs.getInt("kapasitas"));
            this.arrGudang.add(Gudang);
        }
        return this.arrGudang;
    }
    
    
    public void insertTransaksi(Barang barang) {
        try {
            
            String Tanggal_masuk = new SimpleDateFormat("dd/mm/yyyy").format(barang.getTanggal_masuk());
            String Tanggal_expired = new SimpleDateFormat("dd/mm/yyyy").format(barang.getTanggal_expired());
            this.koneksi.ManipulasiData("INSERT INTO BARANG_90493 VALUES (ID_BARANG.NEXTVAL,"+barang.getNama_barang()+",TO_DATE('"+Tanggal_masuk+"','dd/mm/yyyy'),TO_DATE('"+Tanggal_expired+"','dd/mm/yyyy'),'"+barang.getJumlah_stok()+","+barang.getHarga()+")");
            ResultSet rs = this.koneksi.GetData("SELECT ID_BARANG.CURRVAL FROM DUAL");
            rs.next();
            int id_barang = rs.getInt("CURRVAL");
            this.koneksi.ManipulasiData("UPDATE BARANG_90493 SET NAMA_BARANG = "+barang.getNama_barang()+"WHWERE ID_BARANG = "+barang.getId_Barang());
            
        }
        catch (SQLException ex) {
            System.out.println(ex);
        }
    }
    public void insertTransaksi(Gudang gudang) {
        try {
            this.koneksi.ManipulasiData("INSERT INTO GUDANG_90493 VALUES(ID_GUDANG.NEXTVAL,"+gudang.getLokasi()+","+gudang.getKapasitas()+")");
            ResultSet rsg = this.koneksi.GetData("SELECT ID_GUDANG.CURRVAL FROM DUAL");
            rsg.next();
            int id_gudang = rsg.getInt("CURRVAL");
            this.koneksi.ManipulasiData("UPDATE GUDANG_90493 SET KAPASITAS = "+gudang.getKapasitas()+"WHWERE ID_GUDANG = "+gudang.getId_Gudang()); 
        }
        catch (SQLException ex) {
            System.out.println(ex);
        }
    }

  
}
