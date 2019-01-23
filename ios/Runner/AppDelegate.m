#include "AppDelegate.h"
#include "GeneratedPluginRegistrant.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    FlutterViewController* controller = (FlutterViewController*)self.window.rootViewController;
    FlutterMethodChannel* batteryChannel = [FlutterMethodChannel
                                            methodChannelWithName:@"samples.flutter.io/yami"
                                            binaryMessenger:controller];
    [batteryChannel setMethodCallHandler:^(FlutterMethodCall* call, FlutterResult result) {
        // TODOif ([@"getBatteryLevel" isEqualToString:call.method]) {
        if ([@"getCookies" isEqualToString:call.method]) {
            NSString *cookies = [self getCookies];
            result(cookies);
        }else if ([@"URLDecodedString" isEqualToString:call.method]){
            NSString *code = call.arguments[@"code"];
            NSString *str = [self URLDecodedString:code];
            result(str);
        }else {
            result(FlutterMethodNotImplemented);
        }
    }];
  [GeneratedPluginRegistrant registerWithRegistry:self];
  // Override point for customization after application launch.
  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

- (NSString *)getCookies{
    NSArray *cookiesArray = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookies];
    if ([cookiesArray count] == 0) {
        return @"";
    }
    NSDictionary *cookieDict = [NSHTTPCookie requestHeaderFieldsWithCookies:cookiesArray];
    NSString *cookie = [cookieDict objectForKey:@"Cookie"];
    //分隔符逗号
    return cookie;
}


-(NSString *)URLDecodedString:(NSString *)str
{
    NSString *decodedString=(__bridge_transfer NSString *)CFURLCreateStringByReplacingPercentEscapesUsingEncoding(NULL, (__bridge CFStringRef)str, CFSTR(""), CFStringConvertNSStringEncodingToEncoding(NSUTF8StringEncoding));
    
    return decodedString;
}
@end
