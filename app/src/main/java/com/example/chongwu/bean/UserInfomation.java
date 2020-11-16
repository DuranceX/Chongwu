package com.example.chongwu.bean;

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
    private int driedFish;   //小鱼干数目
    private String userSchool;
    private String userSex;

    public int getDriedFish() {
        return driedFish;
    }

    public void setDriedFish(int driedFish) {
        this.driedFish = driedFish;
    }

    public String getUserSchool() {
        return userSchool;
    }

    public void setUserSchool(String userSchool) {
        this.userSchool = userSchool;
    }

    public String getUserSex() {
        return userSex;
    }

    public void setUserSex(String userSex) {
        this.userSex = userSex;
    }

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
