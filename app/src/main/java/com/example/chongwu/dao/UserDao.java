package com.example.chongwu.dao;

import android.util.Log;

import com.example.chongwu.bean.User;
import com.example.chongwu.util.DbUtil;

import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDao {

    /**
     * @description 根据sql语句查询，并输出结果
     * @return null
     * @author Cardy Xie
     * @time 2020/11/13 10:49
     */
    public void selectUser() throws SQLException {
        //3.sql语句
        //String sql = "INSERT INTO test Values('test3','hhhhh');";
        String sql = "select * from test where id='test';";
        //String sql = "INSERT INTO test('123','456');";
        //4.获取用于向数据库发送sql语句的ps
        DbUtil.getConnection();
        ResultSet rs = DbUtil.executeQuery(sql);
        User user = new User();
        if(rs.next())
        {
            user.setUserId(rs.getString(1));
            user.setUserPassword(rs.getString(2));
        }
        Log.d("DBconnection Result", user.toString());
    }

    public boolean FindUser(String name) {
        String sql = "select * from test where id='" + name + "'";
        DbUtil.getConnection();
        ResultSet rs = DbUtil.executeQuery(sql);
        try {
            if(rs.next()) {
                Log.d("DBconnection Result", sql);
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean checkUser(String name, String psw){
        String sql = "select * from test where id='" + name + "'";
        ResultSet rs = DbUtil.executeQuery(sql);
        try {
            if (rs.next())
            {
                if(rs.getString(2).equals(psw))
                    return true;
                return false;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
