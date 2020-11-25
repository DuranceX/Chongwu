package com.example.chongwu.view;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import com.example.chongwu.R;
import com.example.chongwu.dao.UserDao;
import com.example.chongwu.util.MainMenuUtil;

import java.sql.SQLException;

public class MainActivity extends AppCompatActivity {
    public  static final String EXTRA_MESSAGE = "com.example.first_app.MESSAGE";
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        Button button2 =findViewById(R.id.button2);
    }

    protected void onPause()
    {
        super.onPause();
        EditText editText = findViewById(R.id.editText);
        Log.d("MainActivity","主页活动暂停");
        editText.setHint("Welcome back");
    }

    /**
     * @description 重回此页面后做的事
     * @param
     * @return
     * @author Lu Ning
     * @time 2020/11/16 15:52
     */
    protected void onRestart(){
        super.onRestart();
        Log.d("MainActivity","回到主页");
    }
    
    /**
     * @description 测试连接数据库，使用UserDao对象的selectUser()方法
     * @param view
     * @return null
     * @author Cardy Xie
     * @time 2020/11/13 10:48
     */
//    public void dbtest(View view)
//    {
//        UserDao userDao = new UserDao();
//        new Thread(new Runnable() {
//            @Override
//            public void run() {
//                try {
//                    userDao.selectUser();
//                } catch (SQLException e) {
//                    e.printStackTrace();
//                }
//            }
//        }).start();
//    }

    /**
     * @description 发送消息示例，用于不同Activity间跳转及信息通信
     * @param view
     * @return null
     * @author Cardy Xie
     * @time 2020/11/13 10:46
     */
    public void SendMessage(View view)
    {
        Intent intent = new Intent(this, DisplayMessageActivity.class);
        EditText editText = findViewById(R.id.editText);
        String message = editText.getText().toString();
        Log.d("MainActivity","点击了发送消息按钮");          //日志
        intent.putExtra(EXTRA_MESSAGE,message);
        startActivity(intent);
    }

    /**
     * @description 从任何地方跳转到登陆页面
     * @param view
     * @return null
     * @author Lu Ning
     * @time 2020/11/13 16:22
     */
//    public void SignInAccount(View view){
//        Intent intent = new Intent(this, LoginActivity.class);
//        Log.d("MainActivity","跳转至登陆页面");
//        startActivity(intent);
//    }  暂时不删除，此函数已经写到Util类了


    /**
     * @description 点击“开始学习”按钮触发此事件
     * @param view
     * @return boolean
     * @author Cardy Xie
     * @time 2020/11/10 22:55
     */
    public void clickLearn(View view)
    {
        Toast.makeText(MainActivity.this, "你还不能学习哦", Toast.LENGTH_SHORT).show();
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
        switch (item.getItemId()) {
            case R.id.main:
                MainMenuUtil.backToMainActivity(this,null);
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