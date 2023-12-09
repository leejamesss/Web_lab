//package servlet.reader;
//
//
//import javabean.Base;
//import net.sf.json.JSONArray;
//import net.sf.json.JSONObject;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import java.io.IOException;
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.sql.SQLException;
//
//
////返回读者收藏的书籍
//
//@WebServlet("/reader/collection")
//public class Collection extends HttpServlet{
//    @Override
//    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        resp.setContentType("application/json; charset=utf8");
//        // 接收参数
//        String limit = req.getParameter("limit");
//        String page = req.getParameter("page");
//        String condition = (String) req.getParameter("condition");
//        String conditionValue = (String) req.getParameter("conditionValue");
//        String where = ""; // 无限制条件
//        if (page == null) {
//            page = "1";
//        }
//        if (limit == null) {
//            limit = "10";
//        }
//        // 准备查询
//        Connection connection = null;
//        PreparedStatement pstmt = null;
//        PreparedStatement countPstmt = null;
//        ResultSet resultSet = null;
//        ResultSet countSet = null;
//        String sql = "";
//        String countSql = "";
//        // 准备返回参数
//        int code = 1;
//        String msg = "无数据";
//        int count = 0;
//
//        JSONObject jsonData = new JSONObject();
//        JSONArray jsonArray = new JSONArray();
//        JSONObject jsonResult = new JSONObject();
//        // 进行查询
//        try {
//            connection = Base.getConnection();
//            //从session中获取读者id
//            String readerId = (String) req.getSession().getAttribute("readerId");
//            //查找对应读者id的收藏书籍
//            sql = "select * from collection where readerId = ? limit " + (Integer.parseInt(page) - 1) * Integer.parseInt(limit)
//                    + "," + limit;
//            pstmt = connection.prepareStatement(sql);
//            pstmt.setString(1,readerId);
//            resultSet = pstmt.executeQuery();
//            //将查询结果放入json数组中
//            while (resultSet.next()) {
//                JSONObject jsonObject = new JSONObject();
//                jsonObject.put("bookId", resultSet.getString("bookId"));
//                jsonObject.put("bookName", resultSet.getString("bookName"));
//                jsonObject.put("author", resultSet.getString("author"));
//                jsonObject.put("press", resultSet.getString("press"));
//                jsonObject.put("price", resultSet.getString("price"));
//                jsonObject.put("isbn", resultSet.getString("isbn"));
//                jsonObject.put("bookInfo", resultSet.getString("bookInfo"));
//                jsonObject.put("bookImg", resultSet.getString("bookImg"));
//                jsonObject.put("bookType", resultSet.getString("bookType"));
//                jsonObject.put("bookStatus", resultSet.getString("bookStatus"));
//                jsonObject.put("collectionTime", resultSet.getString("collectionTime"));
//                jsonArray.add(jsonObject);
//            }
//            //查询收藏书籍的总数
//            countSql = "select count(*) from collection where readerId = ?";
//            countPstmt = connection.prepareStatement(countSql);
//            countPstmt.setString(1,readerId);
//            countSet = countPstmt.executeQuery();
//            if (countSet.next()) {
//                count = countSet.getInt(1);
//            }
//            //如果有收藏书籍
//            if (count > 0) {
//                code = 0;
//                msg = "查询成功";
//            }
//            jsonResult.put("code", code);
//            jsonResult.put("msg", msg);
//            jsonResult.put("count", count);
//            jsonResult.put("data", jsonArray);
//            //将结果返回
//            resp.getWriter().write(jsonResult.toString());
//
//
//        } catch (ClassNotFoundException e) {
//            throw new RuntimeException(e);
//        } catch (SQLException e) {
//            throw new RuntimeException(e);
//        }
//
//
//    }}
