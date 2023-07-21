/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Context.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;

/**
 *
 * @author admin
 */
public class ComponentDAO {
    public void updateComponent(String type, String id, String name, String price, String status){
        int stat=0;       
        if(status.equalsIgnoreCase("true")) 
            stat = 1;
         try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                Statement st = con.createStatement();
                String sql= " ";
                if(type.equalsIgnoreCase("mainboard"))
                    sql = "update `mainboard` set Mainboard_Name = '"+name+"', Price ='"+price+"', Status = '"+stat+"' where Mainboard_ID = "+id+";";
                if(type.equalsIgnoreCase("cpu"))
                    sql = "update `cpu` set CPU_Name = '"+name+"', Price ='"+price+"', Status = '"+stat+"' where CPU_ID = "+id+";";
                if(type.equalsIgnoreCase("psu"))
                    sql = "update `psu` set PSU_Name = '"+name+"', Price ='"+price+"', Status = '"+stat+"' where PSU_ID = "+id+";";
                if(type.equalsIgnoreCase("ram"))
                    sql = "update `ram` set RAM_Name = '"+name+"', Price ='"+price+"', Status = '"+stat+"' where RAM_ID = "+id+";";
                if(type.equalsIgnoreCase("storage"))
                    sql = "update `storage` set Storage_Name = '"+name+"', Price ='"+price+"', Status = '"+stat+"' where Storage_ID = "+id+";";                
                if(type.equalsIgnoreCase("vga"))
                    sql = "update `vga` set VGA_Name = '"+name+"', Price ='"+price+"', Status = '"+stat+"' where VGA_ID = "+id+";";
                
                st.executeUpdate(sql);            
                st.close();
                con.close();

            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
     }
    
    public void updateCase(String type, String id, String name, String price, String status, String image){
        int stat=0;       
        if(status.equalsIgnoreCase("true")) 
            stat = 1;
         try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                Statement st = con.createStatement();
                String sql= "update `case` set Case_Name = '"+name+"', Price ='"+price+"', Status = '"+stat+"', Images = '"+image+"' where Case_ID = "+id+";";
                
                st.executeUpdate(sql);            
                st.close();
                con.close();

            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
     }
    
    public void addCase(String type, String name, String price, String status, String image){
        int stat=0;       
        if(status.equalsIgnoreCase("true")) 
            stat = 1;
         try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {

                String sql= "INSERT INTO `"+type+"` (`Case_Name`, `Price`, `Images`,`Status`) VALUES (?,?,?,?)";
                PreparedStatement st = con.prepareStatement(sql);
                
                st.setString(1, name);
                st.setString(2, price);
                st.setString(3, image);
                st.setInt(4, stat);
                st.executeUpdate();
                
            
                st.close();
                con.close();

            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
     }
    
    public void addComponent(String type, String name, String price, String status){
        int stat=0;       
        String sql="";
        if(status.equalsIgnoreCase("true")) 
            stat = 1;
        
                if(type.equalsIgnoreCase("mainboard"))
                    sql = "INSERT INTO `mainboard` (`Mainboard_Name`,`Price`,`Status`) VALUES (?,?,?)";
                if(type.equalsIgnoreCase("cpu"))
                    sql = "INSERT INTO `cpu` (`CPU_Name`,`Price`,`Status`) VALUES (?,?,?)";
                if(type.equalsIgnoreCase("psu"))
                    sql = "INSERT INTO `psu` (`PSU_Name`,`Price`,`Status`) VALUES (?,?,?)";
                if(type.equalsIgnoreCase("ram"))
                    sql = "INSERT INTO `ram` (`RAM_Name`,`Price`,`Status`) VALUES (?,?,?)";
                if(type.equalsIgnoreCase("storage"))
                    sql = "INSERT INTO `storage` (`Storage_Name`,`Price`,`Status`) VALUES (?,?,?)";               
                if(type.equalsIgnoreCase("vga"))
                    sql = "INSERT INTO `vga` (`VGA_Name`,`Price`,`Status`) VALUES (?,?,?)";
        
         try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            
            if (con != null) {

                
                PreparedStatement st = con.prepareStatement(sql);
                
                st.setString(1, name);
                st.setString(2, price);
                st.setInt(3, stat);
                st.executeUpdate();
                
            
                st.close();
                con.close();

            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
     }

    
}
