/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Context.DBContext;
import Model.Storage;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author Zarius
 */
public class StorageDAO {
    public Storage getStorageByID(int storageID){
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                Statement st = con.createStatement();
                String sql = "SELECT * FROM `storage` where `Storage_ID` = " + storageID +";";
                ResultSet rs = st.executeQuery(sql);
                if (rs.next()) {
                    Storage s = new Storage();
                    s.setStorageID(rs.getInt(1));
                    s.setStorageName(rs.getString(2));
                    s.setPrice(rs.getInt(3));
                    s.setDescription(rs.getString(4));
                    s.setImage(rs.getString(5));
                    s.setStatus(rs.getBoolean(6));
                    return s;
                }
                rs.close();
                st.close();
                con.close();
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }
}
