package com.example.chongwu.util;

import android.content.Context;
import android.content.Intent;
import android.util.Log;
import android.view.View;

import com.example.chongwu.loginActivity.LoginActivity;
import com.example.chongwu.view.SettingsActivity;
import com.example.chongwu.view.ShopActivity;

/**
 * @description 为每个Activity的菜单提供点击方式的类
 * @author Lu Ning
 * @time 2020/11/15 22:56
 */
public class MainMenuUtil {

    /**
     * @description 提供登陆方式
     * @param context
     * @return
     * @author Lu Ning
     * @time 2020/11/15 22:57
     */
    public static void signInAccount(Context context, View view){
        Intent intent = new Intent(context, LoginActivity.class);
        Log.d("change","跳转至登陆页面");
        context.startActivity(intent);
    }

    public static void openShop(Context context, View view){
        Intent intent = new Intent(context, ShopActivity.class);
        Log.d("change","打开商店");
        context.startActivity(intent);
    }

    public static void openSetting(Context context, View view){
        Intent intent = new Intent(context, SettingsActivity.class);
        Log.d("change","打开设置");
        context.startActivity(intent);
    }

    /**
     * @description 回到首页，目前存在bug
     * @param
     * @return
     * @author Lu Ning
     * @time 2020/11/15 23:38
     */
    public static void backToMainActivity(Context context, View view){
        Intent intent = new Intent(context, MainMenuUtil.class);
//        intent.setFlags(Intent.FLAG_ACTIVITY_CLEAR_TASK | Intent.FLAG_ACTIVITY_NEW_TASK);
        Log.d("change","重回首页");
        context.startActivity(intent);
    }


}
