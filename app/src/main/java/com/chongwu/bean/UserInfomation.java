package com.chongwu.bean;

/**
 * @description 用户信息类
 * @param 
 * @return 
 * @author Lu Ning
 * @time 2020/11/13 17:14
 */
public class UserInfomation {
    private String userID;
    private String userName;
    //后面一些必要的用户信息如性别等等数据库设计后再完善。

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }
}
