package com.cdkshop.com.cdkshop.tool;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

//填充CDK
@WebServlet("/generate") public class KeyGenerator extends HttpServlet {
    @Override protected void doGet(HttpServletRequest req, HttpServletResponse resp)
        throws ServletException, IOException {
        Connection con = (Connection) req.getServletContext().getAttribute("connect");
        List<String> game_list = __fetchExistGame(con);
        for (String id : game_list) {
            __addSomeTo(id, con);
            resp.getWriter().println("add to " + id);
        }
    }

    //添加随机条`
    private void __addSomeTo(String game_id, Connection con) {
        try {
            PreparedStatement stm = con.prepareStatement("insert into stock values(?,?);");
            int rand_amount = (int) (1 + Math.random() * 8);
            for (int i = 0; i != rand_amount; i++) {
                stm.setString(1, __randomKey());
                stm.setString(2, game_id);
                stm.executeUpdate();
            }
            stm.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    //获取已存在游戏ID列表
    private List<String> __fetchExistGame(Connection con) {
        List<String> list = new ArrayList<String>();
        try {
            Statement stm = con.createStatement();
            ResultSet result = stm.executeQuery("select game_id from stock group by game_id;");
            while (result.next()) {
                list.add(result.getString("game_id"));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return list;
    }

    //生成随机字符串
    private String __randomKey() {
        StringBuilder str = new StringBuilder();
        str.append("FAKE-CDK-");
        for (int i = 0; i != 16; i++) {
            str.append((char) ((int) 'A' + Math.random() * 26));
        }
        return str.toString();
    }

}
