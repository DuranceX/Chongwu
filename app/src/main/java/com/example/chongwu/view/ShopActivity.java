package com.example.chongwu.view;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.Toast;

import com.example.chongwu.util.MainMenuUtil;
import com.google.android.material.bottomnavigation.BottomNavigationView;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;
import androidx.navigation.NavController;
import androidx.navigation.Navigation;
import androidx.navigation.ui.AppBarConfiguration;
import androidx.navigation.ui.NavigationUI;
import com.example.chongwu.R;

public class ShopActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_shop);
        BottomNavigationView navView = findViewById(R.id.nav_view);
        // Passing each menu ID as a set of Ids because each
        // menu should be considered as top level destinations.
        AppBarConfiguration appBarConfiguration = new AppBarConfiguration.Builder(
                R.id.navigation_home, R.id.navigation_dashboard, R.id.navigation_notifications)
                .build();
        NavController navController = Navigation.findNavController(this, R.id.nav_host_fragment);
        NavigationUI.setupActionBarWithNavController(this, navController, appBarConfiguration);
        NavigationUI.setupWithNavController(navView, navController);
    }

    @Override
    /**
     * @description 销毁商店页面
     * @param []
     * @return void
     * @author Lu Ning
     * @time 2020/11/16 15:54
     */
    protected void onDestroy() {
        super.onDestroy();
        Log.d("ShopActivity","销毁商店页面");
    }

    /**
     * @description  显示主菜单
     * @param menu
     * @return boolean
     * @author Lu Ning
     * @time 2020/11/10 21:38
     */
    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        getMenuInflater().inflate(R.menu.main_menu,menu);
        return true;
    }
    /**
     * @description 菜单选项被点击后的具体活动
     * @param
     * @return boolean
     * @author Lu Ning
     * @time 2020/11/10 21:45
     */
    @Override
    public boolean onOptionsItemSelected(@NonNull MenuItem item) {
        finish();
        switch (item.getItemId()) {
            case R.id.main:
//                MainMenuUtil.backToMainActivity(this,null);
                Intent intent = new Intent(this, MainActivity.class);
                startActivity(intent);
                break;

            case R.id.shop:
                MainMenuUtil.openShop(this,null);
//                onCreate(null); //相当于刷新
                break;

            case R.id.setting:
                MainMenuUtil.openSetting(this,null);
                break;
            case R.id.about_us:
                Toast.makeText(this, "你想了解我们的情况", Toast.LENGTH_SHORT).show();
                break;
            case R.id.sign_in:
                MainMenuUtil.signInAccount(this,null);  //调用自util
                break;
            default:
        }
        return true;
    }

}