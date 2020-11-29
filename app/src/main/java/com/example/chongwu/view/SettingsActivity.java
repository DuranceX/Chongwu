package com.example.chongwu.view;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.appcompat.app.ActionBar;
import androidx.appcompat.app.AppCompatActivity;
import androidx.preference.PreferenceFragmentCompat;

import com.example.chongwu.R;
import com.example.chongwu.util.MainMenuUtil;

public class SettingsActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.settings_activity);
        getSupportFragmentManager()
                .beginTransaction()
                .replace(R.id.settings, new SettingsFragment())
                .commit();
        ActionBar actionBar = getSupportActionBar();
        if (actionBar != null) {
            actionBar.setDisplayHomeAsUpEnabled(true);
        }
    }

    @Override
    /**
     * @description 销毁设置页面
     * @param []
     * @return void
     * @author Lu Ning
     * @time 2020/11/16 15:54
     */
    protected void onDestroy() {
        super.onDestroy();
        Log.d("SettingsActivity","销毁设置页面");
    }

    public static class SettingsFragment extends PreferenceFragmentCompat {
        @Override
        public void onCreatePreferences(Bundle savedInstanceState, String rootKey) {
            setPreferencesFromResource(R.xml.root_preferences, rootKey);
        }
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
            case R.id.register:
                MainMenuUtil.registerAccount(this,null);  //调用自util
                break;
            default:
        }
        return true;
    }
}