package medacademy.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.lang.Exception;
import java.sql.ResultSet;
import java.sql.Statement;

public class DBSingleton {

    private String instanceName = "MSSQLSERVER";
    private String serverName = "IVAN-PC";
    private String databaseName = "stud";
    private String connectionUrl = "jdbc:sqlserver://%1$s\\%2$s;databaseName=%3$s;integratedSecurity=true;";
    private String connectionString = null;
    private static Connection connection = null;

    private DBSingleton(){
        connectionString = String.format(connectionUrl,serverName ,instanceName, databaseName);
        try {
            DriverManager.registerDriver(new com.microsoft.sqlserver.jdbc.SQLServerDriver());
            System.out.println(connectionString);
            connection = DriverManager.getConnection(connectionString);
        }catch(Exception e){
            e.printStackTrace();
        }
    }

    public static Connection getConnection(){
        if (connection == null)
            return new DBSingleton().connection;
        else
            return connection;
    }

    public static ResultSet executeStatement(String query){
        Connection conn = getConnection();
        Statement stat = null;
        ResultSet set = null;
        try {
            stat = conn.createStatement();
            set = stat.executeQuery(query);
            return set;
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }
}
