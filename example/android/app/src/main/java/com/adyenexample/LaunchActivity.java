package com.bitpay.wallet;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;

import com.adyenexample.MainApplication;
import com.adyenexample.MainActivity;


import java.util.ArrayList;

public class LaunchActivity extends Activity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        MainApplication application = (MainApplication) getApplication();
        if (!application.isActivityInBackStack(MainActivity.class)) {
            Intent intent = new Intent(this, MainActivity.class);
            startActivity(intent);
        }
        finish();
    }
}
