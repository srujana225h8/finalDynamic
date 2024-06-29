package lowMantaincePlantsPackage;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class LowMaintainancePlantDbCon {
	private static Connection connection = null;
	public static Connection getConnection() throws ClassNotFoundException, SQLException{
        if(connection == null){
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/lmplants","root","1234");
            System.out.print("connected");
        }
        return connection;
    }
}
