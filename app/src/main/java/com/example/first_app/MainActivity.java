package com.example.first_app;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.EditText;

public class MainActivity extends AppCompatActivity {
    public  static final String EXTRA_MESSAGE = "com.example.first_app.MESSAGE";
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }

    protected void onPause()
    {
        super.onPause();
        EditText editText = (EditText) findViewById(R.id.editText);
        Log.d("MainActivity","修改了文本");
        editText.setHint("Welcome back");
    }
    


    /**
     * @description 
     * @param 
     * @return 
     * @author Lu Ning
     * @time 2020/11/10 20:20
     */
    public void SendMessage(View view)
    {
        Intent intent = new Intent(this, DisplayMessageActivity.class);
        EditText editText = (EditText) findViewById(R.id.editText);
        String message = editText.getText().toString();
        Log.d("MainActivity","点击了发送消息按钮");          //日志
        intent.putExtra(EXTRA_MESSAGE,message);
        startActivity(intent);
    }
}