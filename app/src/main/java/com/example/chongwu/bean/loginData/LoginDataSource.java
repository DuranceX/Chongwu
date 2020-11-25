package com.example.chongwu.bean.loginData;

import com.example.chongwu.Login.LoginCheck;
import com.example.chongwu.bean.User;

import java.io.IOException;

/**
 * Class that handles authentication w/ login credentials and retrieves user information.
 */


/**
 * @description 登陆结果，如果用户登录成功则返回Result类的Success子类对象，反之返回Result类的Error子类对象
 * @param
 * @return 返回Error的子类对象
 * @author Cardy Xie
 * @time 2020/11/20 20:06
 */public class LoginDataSource {

    public Result login(String username, String password) {

        try {
            // TODO: handle loggedInUser authentication
            if(LoginCheck.isExisted(username, password))
            {
                User user = new User(username,password);
                return new Result.Success<>(user);
            }
        } catch (Exception e) {
            return new Result.Error(new IOException("Error logging in", e));
        }
        return null;
    }

    public void logout() {
        // TODO: revoke authentication
    }
}