package com.chongwu.bean;

/**
 * @descripution 用户类
 * @author Cardy Xie
 * @time 2020/11/13 10:49
 */
public class User {
    String id;
    String psw;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPsw() {
        return psw;
    }

    public void setPsw(String psw) {
        this.psw = psw;
    }

    public String toString()
    {
        return "user[ id=" + this.id + " psw=" + this.psw + " ]";
    }
}
