package view;

import controller.Transaksi;
import data.Barang;
import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import view.Transaksi_view;

public class Login_view {
    JFrame login = new JFrame ("Sign in");
    JLabel label = new JLabel("SISTEM GUDANG SEMBAKO");
    JLabel label1 = new JLabel("Username        :");
    JLabel label2 = new JLabel("Password        :");
    JTextField tf = new JTextField();
    JPasswordField tf1 = new JPasswordField();
    JComboBox tf2;
    JButton b = new JButton("Sign in");
    public Transaksi transaksi;
    
    public Login_view()throws SQLException{
    
    label.setBounds(120,30, 300, 30);
    label.setFont(new Font ("Arial",Font.BOLD,20));
    login.add(label);
    
    label1.setBounds(30,100, 120, 50);
    label1.setFont(new Font ("Arial",Font.PLAIN,16));
    login.add(label1);
    
    label2.setBounds(30,140, 120, 50);
    label2.setFont(new Font ("Arial",Font.PLAIN,16));
    login.add(label2);
    
    tf.setBounds(150, 110, 200,30);
    login.add(tf);
    
    tf1.setBounds(150, 150, 200,30);
    login.add(tf1);
    
    b.setBounds(150, 240, 200,30);
    login.add(b);
    
    b.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent ae) {
                login.setVisible(false);
                try {
                    Transaksi_view tv = new Transaksi_view();
                } catch (SQLException ex) {
                    Logger.getLogger(Login_view.class.getName()).log(Level.SEVERE, null, ex);
                }
            }});

    login.setSize(500,350);
    login.setLayout(null);
    login.setVisible(true);
    login.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
    login.setLocation(300, 150);

    
}
}
