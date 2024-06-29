package lowMantaincePlantsPackage;

import java.util.*;
import java.sql.*;

public class LowMaintainancePlantProductsDAO {
    private Connection con;

    public LowMaintainancePlantProductsDAO(Connection con) {
        this.con = con;
    }

    public List<LowMaintainancePlantProducts> getAllHangingPlantProducts() {
        List<LowMaintainancePlantProducts> hangProd = new ArrayList<>();

        String query = "SELECT * FROM lowmaintenanceplants";
        try (PreparedStatement pst = con.prepareStatement(query);
             ResultSet rs = pst.executeQuery()) {

            while (rs.next()) {
            	LowMaintainancePlantProducts row = new LowMaintainancePlantProducts();
                row.setId(rs.getInt("pid"));
                row.setPname(rs.getString("pname"));
                row.setOriginalprice(rs.getBigDecimal("original_price"));
                row.setDiscountprice(rs.getBigDecimal("discount_price"));
                row.setImage(rs.getString("image"));

                hangProd.add(row);
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Replace with a proper logging mechanism
        }
        return hangProd;
    }

    public LowMaintainancePlantProducts getHangingPlantProductsById(int id) {
    	LowMaintainancePlantProducts product = null;
        String query = "SELECT * FROM lowmaintenanceplants WHERE pid = ?";

        try (PreparedStatement pst = con.prepareStatement(query)) {
            pst.setInt(1, id);
            try (ResultSet rs = pst.executeQuery()) {
                if (rs.next()) {
                    product = new LowMaintainancePlantProducts();
                    product.setId(rs.getInt("pid"));
                    product.setPname(rs.getString("pname"));
                    product.setOriginalprice(rs.getBigDecimal("original_price"));
                    product.setDiscountprice(rs.getBigDecimal("discount_price"));
                    product.setImage(rs.getString("image"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Replace with a proper logging mechanism
        }
        return product;
    }

    public Description getHangingPlantsDescriptionById(int id) {
        Description description = null;
        String query = "SELECT ld.lowid, ld.description " +
                       "FROM lowmaintenanceplants l " +
                       "JOIN descriptions ld ON l.pid = ld.lowid " +
                       "WHERE l.pid = ?";

        try (PreparedStatement pst = con.prepareStatement(query)) {
            pst.setInt(1, id);
            try (ResultSet rs = pst.executeQuery()) {
                if (rs.next()) {
                    description = new Description();
                    description.setHangplants_id(rs.getInt("lowid"));
                    description.setDescription(rs.getString("description"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Replace with a proper logging mechanism
        }
        return description;
    }
}