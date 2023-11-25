package data;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class QuizDatabase {

    private static QuizDatabase INSTANCE = null;
    public static synchronized Connection get() {
        if(INSTANCE != null) {
            return connection;
        }
        INSTANCE = new QuizDatabase();
        return connection;
    }

    private String DB_URL = "jdbc:derby://localhost:1527/quiz_db;create=true";
    static Connection connection;
    private QuizDatabase() {
        try {
            connection = DriverManager.getConnection(DB_URL);
            System.out.println("DB Connection done.");
            connection.close();
        } catch(Exception e) {
            System.out.println("DB Connection failed.");
        }
    }
}
