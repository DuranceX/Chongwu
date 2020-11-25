package com.example.chongwu.loginActivity;

import androidx.lifecycle.LiveData;
import androidx.lifecycle.MutableLiveData;
import androidx.lifecycle.ViewModel;

import android.annotation.SuppressLint;
import android.util.Patterns;
import android.widget.EditText;
import android.widget.Toast;

import com.example.chongwu.Login.LoginCheck;
import com.example.chongwu.bean.loginData.LoginRepository;
import com.example.chongwu.bean.loginData.Result;
import com.example.chongwu.bean.User;
import com.example.chongwu.R;

public class LoginViewModel extends ViewModel {

    private MutableLiveData<LoginFormState> loginFormState = new MutableLiveData<>();
    private MutableLiveData<LoginResult> loginResult = new MutableLiveData<>();
    private LoginRepository loginRepository;

    LoginViewModel(LoginRepository loginRepository) {
        this.loginRepository = loginRepository;
    }

    LiveData<LoginFormState> getLoginFormState() {
        return loginFormState;
    }

    LiveData<LoginResult> getLoginResult() {
        return loginResult;
    }

    public void login(String username, String password) {
        // can be launched in a separate asynchronous job
        if(checkUser(username, password))
        {
            User data = new User(username,password);
            loginResult.setValue(new LoginResult(new LoggedInUserView(data.getUserId())));
        }
        else {
            loginResult.setValue(new LoginResult(R.string.login_failed));
        }
//        if (result instanceof Result.Success) {
//            User data = ((Result.Success<User>) result).getData();
//            loginResult.setValue(new LoginResult(new LoggedInUserView(data.getUserId())));
//        } else {
//            loginResult.setValue(new LoginResult(R.string.login_failed));
//        }
    }

    public void loginDataChanged(String username, String password) {
        if (!isUserNameValid(username)) {
            loginFormState.setValue(new LoginFormState(R.string.invalid_username, null));
        } else if (!isPasswordValid(password)) {
            loginFormState.setValue(new LoginFormState(null, R.string.invalid_password));
        } else {
            loginFormState.setValue(new LoginFormState(true));
        }
    }

    // A placeholder username validation check

    /**
     * @description 实时检查用户名是否有效
     * @param
     * @return
     * @author Lu Ning
     * @time 2020/11/14 13:39
     */
    private boolean isUserNameValid(String username) {
        if (username == null) {
            return false;
        }
        if (username.contains("@")) {
            return Patterns.EMAIL_ADDRESS.matcher(username).matches();
        } else {
            return !username.trim().isEmpty();
        }
    }

    // A placeholder password validation check
    /**
     * @description 密码是否有效？，但是这有毛用？
     * @param   password
     * @return
     * @author Lu Ning
     * @time 2020/11/14 13:40
     */
    private boolean isPasswordValid(String password) {
        return password != null && password.trim().length() > 5;
    }

    public boolean checkUser(String username,String password){
        if(LoginCheck.isExisted(username, password))
        {
            return true;
        };
        return false;
    }
}