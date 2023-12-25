//package servlet.reader;
//
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
//import javabean.Base;
//import net.sf.json.JSONArray;
//import net.sf.json.JSONObject;
//
//import java.io.IOException;
//import java.sql.Connection;
//
//
//@WebServlet("/reader/friend")
//public class Friend extends HttpServlet {
//    @Override
//    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
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
//
//        // 准备查询
//        java.sql.Connection connection = null;
//        java.sql.PreparedStatement pstmt = null;
//        java.sql.PreparedStatement countPstmt = null;
//        java.sql.ResultSet resultSet = null;
//        java.sql.ResultSet countSet = null;
//        String sql = "";
//        String countSql = "";
//        // 准备返回参数
//        int code = 1;
//        String msg = "无数据";
//        int count = 0;
//        HttpSession session = req.getSession();
//
//        JSONObject jsonData = new JSONObject();
//        JSONArray jsonArray = new JSONArray();
//        JSONObject jsonResult = new JSONObject();
//        // 进行查询
//        try{
//            connection = (Connection) Base.getConnection();
//            if (condition != null && conditionValue != null) {
//                where = " where " + condition + " like '%" + conditionValue + "%'";
//            }
//            sql = "select * from friend" + where + " limit " + (Integer.parseInt(page) - 1) * Integer.parseInt(limit)
//                    + "," + limit;
//            pstmt = connection.prepareStatement(sql);
//            resultSet = pstmt.executeQuery();
//
//            countSql = "select count(*) from friend" + where;
//            countPstmt = connection.prepareStatement(countSql);
//            countSet = countPstmt.executeQuery();
//            if (countSet.next()) {
//                count = countSet.getInt(1);
//            }
//            if (count > 0) {
//                code = 0;
//                msg = "查询成功";
//                while (resultSet.next()) {
//                    jsonData.put("id", resultSet.getString("id"));
//                    jsonData.put("card_id", resultSet.getString("card_id"));
//                    jsonData.put("friend_id", resultSet.getString("friend_id"));
//                    jsonData.put("friend_name", resultSet.getString("friend_name"));
//                    jsonData.put("friend_phone", resultSet.getString("friend_phone"));
//                    jsonData.put("friend_email", resultSet.getString("friend_email"));
//                    jsonData.put("friend_address", resultSet.getString("friend_address"));
//                    jsonData.put("friend_remark", resultSet.getString("friend_remark"));
//                    jsonArray.add(jsonData);
//                }
//            }
//            jsonResult.put("code", code);
//            jsonResult.put("msg", msg);
//            jsonResult.put("count", count);
//            jsonResult.put("data", jsonArray);
//            resp.getWriter().write(jsonResult.toString());
//        }catch (Exception e){
//            //输出报错信息
//            System.out.println(e);
//        }
//
//
//
//
//    }
//
//}
