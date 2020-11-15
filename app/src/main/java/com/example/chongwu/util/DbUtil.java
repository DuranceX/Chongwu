package com.example.chongwu.util;

import android.util.Log;

import java.sql.*;

public class DbUtil {
    private static Connection conn = null;
    private static ResultSet rs = null;
    private static Statement stmt = null;
    private static int UpdateInt = 0;
    private static String databaseDriver="com.mysql.jdbc.Driver";
    private static String databaseURL="jdbc:mysql://rm-bp1n76xwt0nc2w0mipo.mysql.rds.aliyuncs.com/test1?useUnicode=true&characterEncoding=utf-8&useSSL=false&serverTimezone = GMT";
    private static String username="x5";
    private static String password="chongwux5";

    /**
     * @description 返回一个连接对象
     * @return Connection
     * @author Cardy Xie
     * @time 2020/11/13 10:52
     */
    public static synchronized Connection getConnection()
    {
        try {
            Class.forName(databaseDriver);
            Log.d("DBConnection","驱动加载成功！！！");
        }catch(ClassNotFoundException e){
            e.printStackTrace();
        }
        try {
            Log.d("DBConnection","开始连接");
            conn = DriverManager.getConnection(databaseURL,username, password);
            Log.d("DBConnection","数据库连接成功！！！");
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            Log.d("DBConnection","数据库连接失败");
            e.printStackTrace();
        }
        return conn;
    }

    /**
     * SQL Statement  for  select
     * @param sql
     * @return ResultSet 返回查询得到的结果集
     */
    public static ResultSet executeQuery(String sql)
    {
        try {
            stmt =  conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            rs = stmt.executeQuery(sql);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return rs;
    }

    /**
     * SQL Statement for update, delete, insert
     * @param sql
     * @return int 返回受影响的行数
     */
    public static int executeUpdate(String sql)
    {
        try {
            stmt =  conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            UpdateInt = stmt.executeUpdate(sql);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return UpdateInt;
    }
}
