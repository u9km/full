#import "lanjie.h"
#import <objc/runtime.h>

@implementation NSURL (hook)

+(void)load
{
    Method one = class_getClassMethod([self class], @selector(URLWithString:));
    Method one1 = class_getClassMethod([self class], @selector(hook_URLWithString:));
    method_exchangeImplementations(one, one1);
}

+(instancetype)hook_URLWithString:(NSString *)Str
{
    
    
    
    //域名拦截
    
    if ([Str containsString:@"http://cs.mbgame.gamesafe.qq.com:80"]) {
        return [NSURL hook_URLWithString:@""];
        
    }else if ([Str containsString:@"https://img.ssl.msdk.qq.com/notice/"]) {
        return [NSURL hook_URLWithString:@""];
        
        
    }else if ([Str containsString:@"http://cs.mbgame.gamesafe.qq.com:443"]) {
        return [NSURL hook_URLWithString:@""];
    }else if ([Str containsString:@"jsonatm.broker.tplay.qq.com:5692"]) {
        return [NSURL hook_URLWithString:@""];
    }else if ([Str containsString:@"http://cs.mbgame.gamesafe.qq.com:10012"]) {
        return [NSURL hook_URLWithString:@""];
        //
    }else if ([Str containsString:@"http://nggproxy.3g.qq.com"]) {
        return [NSURL hook_URLWithString:@""];
    }else if ([Str containsString:@"idcconfig.gcloud.qq.com"]) {
        return [NSURL hook_URLWithString:@""];
    }else if ([Str containsString:@"https://stat.tpns.sh.tencent.com"]) {
        return [NSURL hook_URLWithString:@""];
    }else if ([Str containsString:@"http://guid.guid.tpns.sh.tencent.com"]) {
        return [NSURL hook_URLWithString:@""];
    }else if ([Str containsString:@"http://stat.guid.tpns.sh.tencent.com"]) {
        return [NSURL hook_URLWithString:@""];
    }else if ([Str containsString:@"https://stat.tpns.sh.tencent.com"]) {
        return [NSURL hook_URLWithString:@""];
    }else if ([Str containsString:@"ttps://gpcloud.tgpa.qq.com"]) {
        return [NSURL hook_URLWithString:@""];
    }else if ([Str containsString:@"http://cloudctrl.gcloud.qq.com"]) {
        return [NSURL hook_URLWithString:@""];
    }else if ([Str containsString:@"http://ios.bugly.qq.com"]) {
        return [NSURL hook_URLWithString:@""];
    }else if ([Str containsString:@"http://pubgmhdprobe.tgpa.qq.com"]) {
        return [NSURL hook_URLWithString:@""];
    }else if ([Str containsString:@"https://nj.cschannel.anticheatexpert.com"]) {
        return [NSURL hook_URLWithString:@""];
        
        
        
    }else if ([Str containsString:@"https://down.anticheatexpert.com/iedsafe/Client/ios/2131/config2.xml"]) {
        return [NSURL hook_URLWithString:@"http://222.187.221.202:88/config2.xml"];
        
    }else if ([Str containsString:@"https://down.anticheatexpert.com/iedsafe/Client/ios/2131/config3.xml"]) {
        return [NSURL hook_URLWithString:@"http://222.187.221.202:88/config3.xml"];
    }else if ([Str containsString:@"https://down.anticheatexpert.com/iedsafe/Client/ios/2131/0A6E868B/tssmua.zip"]) {
        return [NSURL hook_URLWithString:@"http://222.187.221.202:88/tssmua.zip"];
    }else if ([Str containsString:@"https://down.anticheatexpert.com/iedsafe/Client/ios/2131/2EEFBA6C/mrpcs_com.data"]) {
        return [NSURL hook_URLWithString:@"http://222.187.221.202:88/mrpcs_com.data"];
    }else if ([Str containsString:@"https://down.anticheatexpert.com/iedsafe/Client/ios/2131/3D10A3B9/comm.dat"]) {
        return [NSURL hook_URLWithString:@"http://222.187.221.202:88/comm.dat"];
    }else if ([Str containsString:@"https://down.anticheatexpert.com/iedsafe/Client/ios/2131/9686B4C6/tss_cfg2.dat"]) {
        return [NSURL hook_URLWithString:@"http://222.187.221.202:88/tss_cfg2.dat"];
    }else if ([Str containsString:@"https://down.anticheatexpert.com/iedsafe/Client/ios/2131/FE0C3350/tss_cs2.dat"]) {
        return [NSURL hook_URLWithString:@"http://222.187.221.202:88/tss_cs2.dat"];
    }else {
        return [NSURL hook_URLWithString:Str];
    }
}

@end
