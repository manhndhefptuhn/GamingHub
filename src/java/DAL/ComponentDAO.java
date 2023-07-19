/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Context.DBContext;
import java.sql.Connection;
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
    
    
    
}
