package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;

public class Query {

    public int div_num;

    private int[][] solData;
    private int[][] grantData;
    private int[][] intData;
    private int[][] intStateData;
    private int[][] dpsData;
    private int[][] stateDps;

    public Query(HttpServletRequest request) {
        div_num = parseInt(request, "div_num");
    }

    private int parseInt(HttpServletRequest request, String name) {
        String str = request.getParameter(name);
        try {
            return Integer.parseInt(str);
        } catch (NumberFormatException exc) {
            return 0;
        }
    }

    private String parseStr(HttpServletRequest request, String name) {
        String str = request.getParameter(name);
        if (str != null) {
            return str;
        } else {
            return "ALL";
        }
    }

    public int[][] getScores() {
        // return cached copy if exists
        if (solData != null) {
            return solData;
        }
        String sql = "SELECT * FROM avgscores(?)";
        try {
            // set the query parameters
            PreparedStatement st;
            ResultSet rs;
            Connection db = Database.open();

            st = db.prepareStatement(sql);

            st.setInt(1, div_num);
            // execute query, save results
            // This len variable allows the table to be dynamic in size
            int len = 0;
            rs = st.executeQuery();
            while (rs.next()) {
                len++;
            }

            len = len / 5;

            solData = new int[len][6];
//            data = new int[9][6];
            int row = 0,
                    col = 1;
            rs = st.executeQuery();

            while (rs.next()) {
                solData[row][0] = rs.getInt(1);
                solData[row][col] = rs.getInt(3);

                if (col == 5) {
                    col = 1;
                    row++;
                } else {
                    col++;
                }
            }

            // close database resources
            rs.close();
            st.close();
            db.close();
            return solData;

        } catch (SQLException exc) {
            // lazy hack to simplify hw5
            throw new RuntimeException(exc);
        }
    }

    public int[][] getGrants() {
        // return cached copy if exists
        if (grantData != null) {
            return grantData;
        }
        String sql = "SELECT year, total_tech_grant FROM grants WHERE div_num = ?;";
        try {
            // set the query parameters
            Connection db = Database.open();
            PreparedStatement st = db.prepareStatement(sql);
            st.setInt(1, div_num);

            // execute query, save results
            ResultSet rs = st.executeQuery();
            grantData = new int[5][2];
            for (int row = 0; row < 5; row++) {
                grantData[row][0] = 2011 + row;  // school year
                for (int col = 1; col < 2; col++) {
                    if (rs.next()) {
                        grantData[row][col] = rs.getInt(2);  // sol score
                    }
                }
            }

            // close database resources
            rs.close();
            st.close();
            db.close();
            return grantData;
        } catch (SQLException exc) {
            // lazy hack to simplify hw5
            throw new RuntimeException(exc);
        }
    }
    
    public int[][] getDps() {
        if (dpsData != null) {
            return dpsData;
        }
        
        String sql = "SELECT * FROM dollar_per_stu(?)";
        
        try {
            // set the query parameters
            Connection db = Database.open();
            PreparedStatement st = db.prepareStatement(sql);
            st.setInt(1, div_num); 
            ResultSet rs = st.executeQuery();
            
            dpsData = new int[4][2];
            int row = 0;
            
            while (rs.next()) {
                dpsData[row][0] = rs.getInt(1);  // school year
                dpsData[row][1] = rs.getInt(2);  // dps
                row++;
            }
        } catch (SQLException exc) {
            // lazy hack to simplify hw5
            throw new RuntimeException(exc);
        }
        
        return dpsData;
    }
    
        public int[][] getStateDps() {
        if (stateDps != null) {
            return stateDps;
        }
        
        String sql = "SELECT * FROM dollar_per_stu(0)";
        
        try {
            // set the query parameters
            Connection db = Database.open();
            PreparedStatement st = db.prepareStatement(sql); 
            ResultSet rs = st.executeQuery();
            
            stateDps = new int[4][2];
            int row = 0;
            
            while (rs.next()) {
                stateDps[row][0] = rs.getInt(1);  // school year
                stateDps[row][1] = rs.getInt(2);  // dps
                row++;
            }
        } catch (SQLException exc) {
            // lazy hack to simplify hw5
            throw new RuntimeException(exc);
        }
        
        return stateDps;
    }

    public int[][] getInternet() {
        // return cached copy if exists
        if (intData != null) {
            return intData;
        }
        String sql = "SELECT * FROM get_internet(?)";
        try {
            // set the query parameters
            Connection db = Database.open();
            PreparedStatement st = db.prepareStatement(sql);
            st.setInt(1, div_num);
            intData = new int[7][2];

            // Since there is no idea of state's average
            if (div_num != 0) {
                // execute query, save results
                ResultSet rs = st.executeQuery();
                int row = 0;
                while (rs.next()) {
                    intData[row][0] = rs.getInt(1);  // school year
                    intData[row][1] = rs.getInt(2);  // internet
                    row++;
                }

                // close database resources
                rs.close();
            }
            st.close();
            db.close();
            return intData;
        } catch (SQLException exc) {
            // lazy hack to simplify hw5
            throw new RuntimeException(exc);
        }
    }

    public int[][] stateInternet() {

        // return cached copy if exists
        if (intStateData != null) {
            return intStateData;
        }

        /**
         * This data has been found by this sql:
         *
         * SELECT year, avg(internet) FROM internet GROUP BY year ORDER BY year
         * ASC;
         *
         */
        intStateData = new int[7][2];

        intStateData[0][0] = 2008;
        intStateData[0][1] = 42;
        intStateData[1][0] = 2009;
        intStateData[1][1] = 48;
        intStateData[2][0] = 2010;
        intStateData[2][1] = 51;
        intStateData[3][0] = 2011;
        intStateData[3][1] = 52;
        intStateData[4][0] = 2012;
        intStateData[4][1] = 55;
        intStateData[5][0] = 2013;
        intStateData[5][1] = 58;
        intStateData[6][0] = 2014;
        intStateData[6][1] = 62;

        return intStateData;
    }

    public int[][] testData() {
        return new int[][]{
            {2006, 479, 467, 481, 470, 448},
            {2007, 480, 472, 483, 472, 453},
            {2008, 476, 466, 481, 462, 451},
            {2009, 472, 470, 482, 459, 457},
            {2010, 474, 473, 435, 451, 449},
            {2011, 471, 461, 434, 414, 448},
            {2012, 422, 446, 433, 419, 428},
            {2013, 424, 435, 443, 422, 439},
            {2014, 421, 429, 444, 429, 438}};
    }

}
