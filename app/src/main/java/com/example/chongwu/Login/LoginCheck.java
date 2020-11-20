package com.example.chongwu.Login;

import android.util.Log;

import com.example.chongwu.Factory.UserDaoFactory;
import com.example.chongwu.bean.User;
import com.example.chongwu.dao.UserDao;

import java.sql.SQLException;

/**
 * @author: 那些回不来夏天丶
 * @date: 2020/11/20
 */
public class LoginCheck {

    public static boolean isExisted(String username, String password)
    {
        UserDao userDao = UserDaoFactory.getUserDaoInstance();
        new Thread(new Runnable() {
            @Override
            public void run() {
                if(userDao.FindUser(username))
                {
                    if(userDao.checkUser(username,password))
                        Log.d("DBconnection Result", "登陆成功");
                }
            }
        }).start();
        return false;
    }
}
