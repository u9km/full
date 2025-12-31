


#import "NSObject+URL.h"
#import "EtcHostsURLProtocol.h"

@implementation NSObject (URL)

+ (void)load
{
    [NSURLProtocol registerClass:[EtcHostsURLProtocol class]];
    [EtcHostsURLProtocol configureHostsWithBlock:^(id <EtcHostsConfiguration> configuration) {
        [configuration resolveHostName:@"down.anticheatexpert.com" toIPAddress:@"127.0.0.1"];
        [configuration resolveHostName:@"down.pandora.qq.com" toIPAddress:@"127.0.0.1"];
        [configuration resolveHostName:@"ios.crashsight.qq.com" toIPAddress:@"127.0.0.1"];
        [configuration resolveHostName:@"ios.bugly.qq.com" toIPAddress:@"127.0.0.1"];
        [configuration resolveHostName:@"nj.cschannel.anticheatexpert.com" toIPAddress:@"127.0.0.1"];

        [configuration resolveHostName:@"validation.igamecj.com/verify" toIPAddress:@"127.0.0.1"];
        [configuration resolveHostName:@"file-scan.pubgmobile.com/integrity" toIPAddress:@"127.0.0.1"];
        [configuration resolveHostName:@"anticheat.pubgmobile.com/penalty" toIPAddress:@"127.0.0.1"];
        [configuration resolveHostName:@"pubg.gameban.tencent.com/v1/report" toIPAddress:@"127.0.0.1"];
        [configuration resolveHostName:@"security.tencent.com/api/ban" toIPAddress:@"127.0.0.1"];

 [configuration resolveHostName:@"scanner.gcloud.qq.com/check" toIPAddress:@"127.0.0.1"];
        [configuration resolveHostName:@"silent-ban.pubgmobile.com" toIPAddress:@"127.0.0.1"];
        [configuration resolveHostName:@"ai-detection.tencent.com" toIPAddress:@"127.0.0.1"];

    }];
}
   

@end
