/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package data;
public class Gudang {
    static Integer Id_Gudang;
    private static String Lokasi ;
    private static Integer Kapasitas;
    
    public Integer getId_Gudang() {
        return Id_Gudang;
    }
    
    public static void setId_Gudang(Integer Id_Gudang) {
        Gudang.Id_Gudang = Id_Gudang;
    }
    
    public String getLokasi() {
        return Lokasi;
    }
    
   public static void setLokasi(String Lokasi) {
        Gudang.Lokasi = Lokasi;
    }
    
    public Integer getKapasitas() {
        return Kapasitas;
    }
    
    public static void setKapasitas(Integer Kapasitas) {
        Gudang.Kapasitas= Kapasitas;
    }
}