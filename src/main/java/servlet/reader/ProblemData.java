package servlet.reader;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javabean.Base;
import javabean.DateTime;
import javabean.Util;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@WebServlet("/reader/problemData")
public class ProblemData extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json; charset:utf8");
        // 准备参数
        Connection connection = null;
        PreparedStatement pstmt = null;
        JSONArray jsonCorrectnessRate = new JSONArray(); // add this
        PreparedStatement pstmt2 = null;
        ResultSet resultSet = null;
        ResultSet resultSet2 = null;
        String sql = "";
        String sql2 = "";
        JSONObject jsonObject = new JSONObject();
        JSONArray jsonData = new JSONArray();
        JSONArray jsonDays = new JSONArray();
        // 返回参数
        int code = 1;
        String msg = "error";
        int count = 0;
        PrintWriter out = resp.getWriter();

        // 开始查询
        try {
            connection = Base.getConnection();
            int i = 30;
            // 获取30天
            while (i != 0) {
                i--;
                // 计算正确率

                sql = "select count(*) as count from problem where date_format(create_time,'%Y-%m-%d')=? order by id desc";
                sql2 = "select count(*) as correct from problem where date_format(create_time,'%Y-%m-%d')=? and correct =1";
                String date = DateTime.showDate(-i); // 设置日期
                String md = DateTime.showMD(-i);
                pstmt = connection.prepareStatement(sql);
                pstmt2 = connection.prepareStatement(sql2);
                pstmt2.setString(1, date);
                resultSet2 = pstmt2.executeQuery();
                int correct = 0; // add this
                if (resultSet2.next()) {
                    correct = resultSet2.getInt("correct");
                }

                pstmt.setString(1, date);
                resultSet = pstmt.executeQuery();

                while (resultSet.next()) {
                    int total = resultSet.getInt("count");
                    jsonData.add(total);

                    jsonDays.add(md);
                    double correctnessRate = total == 0 ? 0 : (double) correct / total;
                    jsonCorrectnessRate.add(correctnessRate);

                }
            }
            jsonObject.put("data", jsonData);
            jsonObject.put("days", jsonDays);
            jsonObject.put("correctnessRate", jsonCorrectnessRate);

            if (!jsonObject.isEmpty()) {
                code = 0;
                msg = "查询成功";
            } else {
                msg = "数据为空";
            }
        } catch (ClassNotFoundException e) {
            msg = "没找到";
            e.printStackTrace();
        } catch (SQLException e) {
            msg = "sql错误";
        } finally {
            try {
                Base.closeResource(connection, pstmt, resultSet);
            } catch (SQLException e) {
                msg = "关闭失败";
            }
        }
        out.print(Util.jsonResponse(code, msg, jsonObject.toString()));
    }

}
