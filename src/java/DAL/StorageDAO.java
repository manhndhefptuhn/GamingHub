/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Context.DBContext;
import Model.Storage;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Zarius
 */
public class StorageDAO {

    public Storage getStorageByID(int storageID) {
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                Statement st = con.createStatement();
                String sql = "SELECT * FROM `storage` where `Storage_ID` = " + storageID + ";";
                ResultSet rs = st.executeQuery(sql);
                if (rs.next()) {
                    Storage s = new Storage();
                    s.setStorageID(rs.getInt(1));
                    s.setStorageName(rs.getString(2));
                    s.setPrice(rs.getInt(3));
                    s.setStatus(rs.getBoolean(4));
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

    public List<Storage> getAllStorageActive() {
        List<Storage> storages = new ArrayList<>();
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                String sql = "SELECT * FROM `storage` where `status` = 1";
                PreparedStatement ps = con.prepareStatement(sql);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    Storage s = new Storage();
                    s.setStorageID(rs.getInt(1));
                    s.setStorageName(rs.getString(2));
                    s.setPrice(rs.getInt(3));
                    s.setStatus(rs.getBoolean(4));
                    storages.add(s);
                }
                rs.close();
                ps.close();
                con.close();
            }
            return storages;
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public ArrayList<Storage> getAllStorage() {
        ArrayList<Storage> listStorage = new ArrayList<>();
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                Statement st = con.createStatement();
                String sql = "SELECT * FROM `storage`";
                ResultSet rs = st.executeQuery(sql);
                while (rs.next()) {
                    Storage storage = new Storage();
                    storage.setStorageID(rs.getInt(1));
                    storage.setStorageName(rs.getString(2));
                    storage.setPrice(rs.getInt(3));
                    storage.setStatus(rs.getBoolean(4));
                    listStorage.add(storage);
                }
                rs.close();
                st.close();
                con.close();
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return listStorage;
    }
}
