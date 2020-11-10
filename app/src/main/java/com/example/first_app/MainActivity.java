package com.example.first_app;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {
    public  static final String EXTRA_MESSAGE = "com.example.first_app.MESSAGE";
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        Button button2 = (Button) findViewById(R.id.button2);
        button2.setOnClickListener(new View.OnClickListener() {
            @Override
            //@description 为开始学习按钮创建一个点击就会收到的Toast
            public void onClick(View v) {
                Toast.makeText(MainActivity.this, "你还不能学习哦", Toast.LENGTH_SHORT).show();
            }
        });
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


}