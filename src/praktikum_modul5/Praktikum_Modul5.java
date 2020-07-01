/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package praktikum_modul5;

import database.Koneksi;
import java.sql.SQLException;
import view.Login_view;

/**
 *
 * @author user
 */
public class Praktikum_Modul5 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws SQLException {
        Koneksi k = new Koneksi();
        Login_view l = new Login_view();
    }
    
}
