/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package data;
public class Admin {
    static String User_name;
    static String Nama;
    private static String Password;
    
    public String getUser_name() {
        return User_name;
    }
    
    public static void setUser_name(String User_name) {
        Admin.User_name = User_name;
    }
    
    public String getNama() {
        return Nama;
    }
    
    public static void setNama(String Nama) {
        Admin.Nama = Nama;
    }
    
    public String getPassword() {
        return Password;
    }
    
    public static void setPassword(String Password) {
        Admin.Password= Password;
    }
}
