package com.chongwu.util;

import android.util.Log;

import java.sql.*;

public class DbUtil {
    private static Connection conn = null;
    private static ResultSet rs = null;
    private static Statement stmt = null;
    private static int UpdateInt = 0;
    private static String databaseDriver="com.mysql.cj.jdbc.Driver";
    private static String databaseURL="jdbc:mysql://rm-bp1n76xwt0nc2w0mipo.mysql.rds.aliyuncs.com/test1?useUnicode=true&characterEncoding=utf-8&useSSL=false&serverTimezone = GMT";
    private static String username="x5";
    private static String password="chongwux5";

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
            //3.sql语句
            String sql = "INSERT INTO test Values('test3','hhhhh');";
//            String sql = "INSERT INTO test('123','456');";
            //4.获取用于向数据库发送sql语句的ps
            PreparedStatement ps=conn.prepareStatement(sql);
            ps.execute(sql);
            Log.d("DBconnection","数据插入成功");
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
     * @return
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
     * @return
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
