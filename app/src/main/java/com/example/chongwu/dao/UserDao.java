package com.example.chongwu.dao;

import android.util.Log;

import com.example.chongwu.bean.User;
import com.example.chongwu.util.DbUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDao {
    private Connection conn = DbUtil.getConnection();
    /**
     * @description 根据sql语句查询，并输出结果
     * @return null
     * @author Cardy Xie
     * @time 2020/11/13 10:49
     */

    public void selectUser() throws SQLException {
        String sql = "select * from user_login where id='test';";
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

    /**
     * @description 判断用户是否存在，如果存在返回true，不存在则返回false
     * @param name，用户名；psw，密码
     * @return Boolean
     * @author Cardy Xie
     * @time 2020/11/26 21:58
     */
    public boolean FindUser(String name){
        String sql = "select * from user_login where username='" + name + "'";
//        PreparedStatement prest = conn.prepareStatement(sql);
//        ResultSet rs = prest.executeQuery(sql);
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

    /**
     * @description 判断用户名的密码是否匹配，如果匹配则返回true，不匹配则返回false
     * @param name,用户名;psw,密码
     * @return Boolean
     * @author Cardy Xie
     * @time 2020/11/26 22:00
     */public boolean checkUser(String name, String psw){
        String sql = "select * from user_login where username='" + name + "'";
//        PreparedStatement prest = conn.prepareStatement(sql);
//        ResultSet rs = prest.executeQuery(sql);
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

    public int insertUser(String name,String psw)
    {
        String sql = "insert into user_login values('" + name + "','" +psw + "')";
        int x = DbUtil.executeUpdate(sql);
        return x;
    }

    public int insertUserInfo(String name,String telephone,String sex)
    {
        String sql = "insert into user_information values('" + name + "','" + telephone + "','" + sex + "')";
        int x = DbUtil.executeUpdate(sql);
        return x;
    }
}
