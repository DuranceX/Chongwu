package com.example.chongwu.Factory;

import com.example.chongwu.dao.UserDao;

/**
 * @author: 那些回不来夏天丶
 * @date: 2020/11/20
 */
public class UserDaoFactory {
    public static UserDao getUserDaoInstance()
    {
        return new UserDao();
    }
}
