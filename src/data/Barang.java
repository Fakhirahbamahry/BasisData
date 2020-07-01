/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package data;
import java.util.Date;
public class Barang {
    static Integer Id_Barang ;
    static String User_name;
    private static String Nama_barang;
    private static Date Tanggal_masuk;
    private static Date Tanggal_expired;
    private static Integer Kemasan_barang;
    private static Double Jumlah_stok;
    private static Double Harga;
    private static String Jenis_sembako;
    
    public String getUser_name() {
        return User_name;
    }
    
    public static void setUser_name(String User_name) {
        Barang.User_name = User_name;
    }
    public Integer getId_Barang() {
        return Id_Barang;
    }
    
    public static void setId_Barang(Integer Id_Barang) {
        Barang.Id_Barang = Id_Barang;
    }
    public String getNama_barang() {
        return Nama_barang;
    }
    
    public static void setNama_barang(String Nama_barang) {
        Barang.Nama_barang = Nama_barang;
    }
    public Date getTanggal_masuk() {
        return Tanggal_masuk;
    }
    
    public static void setTanggal_masuk(Date Tanggal_masuk) {
        Barang.Tanggal_masuk = Tanggal_masuk;
    }
    public Date getTanggal_expired() {
        return Tanggal_expired;
    }
    
    public static void setTanggal_expired(Date Tanggal_expired) {
        Barang.Tanggal_expired = Tanggal_expired;
    }
    public Integer getKemasan_barang() {
        return Kemasan_barang;
    }
    
    public static void setKemasan_barang(Integer Kemasan_barang) {
        Barang.Kemasan_barang = Kemasan_barang;
    }
    public Double getJumlah_stok() {
        return Jumlah_stok;
    }
    
    public static void setJumlah_stok(Double Jumlah_stok) {
    Barang.Jumlah_stok = Jumlah_stok;
    }
     public Double getHarga() {
        return Harga;
    }
    
    public static void setHarga(Double Harga) {
        Barang.Harga = Harga;
    }
     public String getJenis_sembako() {
        return Jenis_sembako;
    }
    
    public static void setJenis_sembako(String Jenis_sembako) {
        Barang.Jenis_sembako = Jenis_sembako;
    }

}