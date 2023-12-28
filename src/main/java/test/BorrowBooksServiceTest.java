package test;

import static org.junit.Assert.assertEquals;

import java.sql.SQLException;

public class BorrowBooksServiceTest {
    @org.junit.Test
    public void testBorrowBook() throws SQLException {
        BorrowBooksService service = new BorrowBooksService();
        int result = service.borrowBook("user1", "book1", "2022-01-01", "2022-01-31");
        assertEquals(1, result);
    }
}