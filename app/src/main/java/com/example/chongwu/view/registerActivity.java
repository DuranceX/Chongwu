package com.example.chongwu.view;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.Toast;

import com.example.chongwu.Factory.UserDaoFactory;
import com.example.chongwu.R;
import com.example.chongwu.dao.UserDao;

public class registerActivity extends AppCompatActivity {

    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_register);
        EditText usernmae = findViewById(R.id.usernameET);
        EditText password = findViewById(R.id.passwordET);
        EditText telephone = findViewById(R.id.telephoneET);
        RadioGroup sexGroup = findViewById(R.id.radioGroup);
        Button registerButton = findViewById(R.id.register_button);

        registerButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String sexString="";
                if(sexGroup.getCheckedRadioButtonId() == findViewById(R.id.sex_man).getId())
                    sexString = "男";
                else
                    sexString = "女";
                register(usernmae.getText().toString(),password.getText().toString(),telephone.getText().toString(),sexString);
            }
        });
    }

    protected boolean register(String username, String password, String telephone, String sex) {
        /*UserDao userDao = UserDaoFactory.getUserDaoInstance();
        if (!userDao.FindUser(username)) {
            userDao.insertUser(username, password);
            userDao.insertUserInfo(username, telephone, sex);
            Toast.makeText(this, "注册成功", Toast.LENGTH_SHORT).show();
        } else {
            Toast.makeText(this, "用户名已存在", Toast.LENGTH_SHORT).show();
        }*/
        final boolean[] flag = {false};
        UserDao userDao = UserDaoFactory.getUserDaoInstance();
        new Thread(new Runnable() {
            @Override
            public void run() {
                if(!userDao.FindUser(username))
                {
                    flag[0] = true;
                    userDao.insertUser(username, password);
                    userDao.insertUserInfo(username, telephone, sex);
                    Log.d("DBconnection Result", username + "注册成功");
                }
                else
                {
                    Log.d("DBconnection Result", "用户名已存在");
                }
            }
        }).start();
        try {
            Thread.sleep(1000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        return flag[0];
    }
}