package com.example.first_app.ui.loginActivity;

/**
 * Class exposing authenticated user details to the UI.
 */
class LoggedInUserView {
    private String userId;
    //... other data fields that may be accessible to the UI

    LoggedInUserView(String userId) {
        this.userId = userId;
    }

    String getDUserId() {
        return userId;
    }
}