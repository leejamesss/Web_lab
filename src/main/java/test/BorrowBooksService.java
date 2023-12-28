package test;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class BorrowBooksService {
    public synchronized int borrowBook(String user, String book, String date1, String end) throws SQLException {
        String sql = "insert into borrow_books(CARD_ID,BOOK_ID,BORROW_DATE,END_DATE)values(?,?,?,?)";
        try (Connection connection = getConnection(); PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, user);
            stmt.setString(2, book);
            stmt.setString(3, date1);
            stmt.setString(4, end);
            return stmt.executeUpdate();
        }
    }

    private Connection getConnection() {
        // Implement your connection logic here

        return null;
    }
}