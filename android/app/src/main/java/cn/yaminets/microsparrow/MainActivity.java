package cn.yaminets.microsparrow;

import android.os.Build;
import android.os.Bundle;
import io.flutter.app.FlutterActivity;
import io.flutter.plugins.GeneratedPluginRegistrant;
import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;


public class MainActivity extends FlutterActivity {
  private static final String CHANNEL = "samples.flutter.io/cookies";

  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    new MethodChannel(getFlutterView(), CHANNEL).setMethodCallHandler(
            new MethodCallHandler() {
              @Override
              public void onMethodCall(MethodCall call, Result result) {
                 if (call.method.equals("getCookies")) {
                        String cookies = getCookies();
                        result.success(cookies);
                    } else {
                        result.notImplemented();
                    }
              }
            });
    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP){
      getWindow().setStatusBarColor(0);
    }
    GeneratedPluginRegistrant.registerWith(this);

  }

  private String getCookies(){
    CookieManager cookieManager = CookieManager.getInstance();
    String cookieStr = cookieManager.getCookie("https://www.yuque.com/dashboard");
    return cookieStr;
  }
}
