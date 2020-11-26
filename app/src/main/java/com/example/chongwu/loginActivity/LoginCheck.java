package com.example.chongwu.loginActivity;

import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.util.Log;
import android.widget.Toast;

import com.example.chongwu.Factory.UserDaoFactory;
import com.example.chongwu.bean.User;
import com.example.chongwu.dao.UserDao;

import java.sql.SQLException;

/**
 * @author: 那些回不来夏天丶
 * @date: 2020/11/20
 */
public class LoginCheck {

    public static Boolean flag;

    public static boolean isExisted(String username, String password){
        flag=false;
        UserDao userDao = UserDaoFactory.getUserDaoInstance();
        new Thread(new Runnable() {
            @Override
            public void run() {
                if(userDao.FindUser(username))
                {
                    if(userDao.checkUser(username,password))
                    {
                        flag = true;
                        Log.d("DBconnection Result", username + "登陆成功");
                    }
                }
            }
        }).start();
        try {
            Thread.sleep(1000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        return flag;
    }
}
