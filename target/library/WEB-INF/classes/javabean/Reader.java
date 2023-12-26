package javabean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Reader {
	@SuppressWarnings("null")
	public String login(String user, String psw) throws ClassNotFoundException, SQLException {

		if (user == null || user.trim().equals("")) {
			return "账号不能为空";
		} else if (psw == null || psw.trim().equals("")) {
			return "密码不能为空";
		}
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet resultSet = null;
		String sql = "select * from borrow_card where ID=? and PASSWORD=?";
		connection = Base.getConnection();
		pstmt = (PreparedStatement) connection.prepareStatement(sql);
		pstmt.setString(1, user);
		pstmt.setString(2, psw);
		resultSet = pstmt.executeQuery();
		if (resultSet.next()) {
			return "1";
		}
		return "账号或密码错误";
	}

	public String register(String user, String psw, String email) throws ClassNotFoundException, SQLException {
		if (user == null || user.trim().equals("")) {
			return "账号不能为空";
		} else if (psw == null || psw.trim().equals("")) {
			return "密码不能为空";
		} else if (email == null || email.trim().equals("")) {
			return "电子邮件不能为空";
		} else if (!email.matches("^[\\w.-]+@[\\w.-]+\\.[a-z]{2,}$")) {
			return "电子邮件格式不正确";
		}

		Connection connection = null;
		PreparedStatement pstmt = null;
		String sql = "insert into borrow_card (ID, PASSWORD, READER,RULE_ID,STATUS,EMAIL) values (?, ?, ?, ? ,?)";
		connection = Base.getConnection();
		pstmt = (PreparedStatement) connection.prepareStatement(sql);
		pstmt.setString(1, user);
		pstmt.setString(2, psw);
		pstmt.setString(3, user);
		pstmt.setInt(4, 1);
		pstmt.setInt(5, 1);
		pstmt.setString(6, email);
		int affectedRows = pstmt.executeUpdate();
		if (affectedRows > 0) {
			return "1";
		}
		return "注册失败";
	}
}
