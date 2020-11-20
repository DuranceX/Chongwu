package com.example.chongwu.loginActivity;

/**
 * Class exposing authenticated user details to the UI.
 */

/**
 * @description  返回登陆成功的用户名
 * @param
 * @return 返回登陆成功的用户名
 * @author Cardy Xie
 * @time 2020/11/20 20:08
 */class LoggedInUserView {
    private String userId;
    //... other data fields that may be accessible to the UI

    LoggedInUserView(String userId) {
        this.userId = userId;
    }

    String getDUserId() {
        return userId;
    }
}