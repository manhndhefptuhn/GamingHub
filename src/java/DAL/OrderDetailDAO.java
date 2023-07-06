/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Context.DBContext;
import Model.Cart;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Types;
import java.util.ArrayList;

/**
 *
 * @author Zarius
 */
public class OrderDetailDAO {
    public void addCartToOrder(ArrayList<Cart> listCart, int orderID) {
        
        try {
            for (Cart cart : listCart) {
                 String sql = "INSERT INTO `order_detail` \n"
                + "values (?,?,?,?,?,?)";
                 DBContext db = new DBContext();
            Connection con = db.getConnection();
            PreparedStatement st = con.prepareStatement(sql);
            st.setNull(1, Types.INTEGER);
            st.setInt(2, orderID);
            st.setInt(3, cart.getProductID());
            st.setInt(4, cart.getProductPrice());
            st.setInt(5, cart.getQuantity());
            st.setInt(6, cart.getTotalCost());
            st.executeUpdate();
            st.close();
            con.close();
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
}
