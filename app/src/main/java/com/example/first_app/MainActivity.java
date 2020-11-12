package com.example.first_app;

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

import com.chongwu.util.DbUtil;

public class MainActivity extends AppCompatActivity {
    public  static final String EXTRA_MESSAGE = "com.example.first_app.MESSAGE";
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        Button button2 =findViewById(R.id.button2);
        new Thread(new Runnable() {
            @Override
            public void run() {
                DbUtil.getConnection();
            }
        }).start();
    }

    protected void onPause()
    {
        super.onPause();
        EditText editText = findViewById(R.id.editText);
        Log.d("MainActivity","修改了文本");
        editText.setHint("Welcome back");
    }
    

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
        getMenuInflater().inflate(R.menu.main,menu);
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
            case R.id.name:
                Toast.makeText(this, "你按下了宠悟", Toast.LENGTH_SHORT).show();
            case R.id.about_us:
                Toast.makeText(this, "你想了解我们的情况", Toast.LENGTH_SHORT).show();
            case R.id.item:
                Toast.makeText(this, "其实啥都没有", Toast.LENGTH_SHORT).show();
            default:
        }
        return true;
    }
}