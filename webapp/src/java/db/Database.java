package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Provides access to the underlying PostgreSQL database.
 *
 * @author Chris Mayfield
 */
public class Database {

    /** JDBC driver name. */
    private static final String DRIVER = "org.postgresql.Driver";

    /** Database connection string. */
    private static final String DB_URL = "jdbc:postgresql://db.cs.jmu.edu/techx";

    /** Database user name. */
    private static final String DB_USER = "techx";

    /** Database password. */
    private static final String DB_PASS = "PzT^DMkQCB5p@#ZQ";

    /**
     * Static block; loads the JDBC driver. comment for john
     */
    static {
        try {
            Class.forName(DRIVER);
        } catch (ClassNotFoundException exc) {
            exc.printStackTrace();
        }
    }

    /**
     * Opens a new connection to the database.
     */
    public static Connection open() throws SQLException {
        return DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);
    }

}
