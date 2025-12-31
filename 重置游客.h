void ResetGuestAccount() {
    NSFileManager *fm = [NSFileManager defaultManager];
    [fm removeItemAtPath:[NSString stringWithFormat:@"%@/Documents/ano_tmp", NSHomeDirectory()] error:nil];
    [fm removeItemAtPath:[NSString stringWithFormat:@"%@/Documents", NSHomeDirectory()] error:nil];
    [fm removeItemAtPath:[NSString stringWithFormat:@"%@/Library", NSHomeDirectory()] error:nil];
    [fm removeItemAtPath:[NSString stringWithFormat:@"%@/tmp", NSHomeDirectory()] error:nil];

    NSString *prefsPath = [NSString stringWithFormat:@"%@/Library/Preferences", NSHomeDirectory()];
    NSArray *prefsFiles = [fm contentsOfDirectoryAtPath:prefsPath error:nil];

    NSArray *bundleIdentifiersToRemove = @[
        @"tencent",  // existing
        @"ig",       // existing
        @"rekoo",    // TW
        @"vn",       // VNG
        @"imobile",  // BGMI
        @"korean"    // Korean placeholder
    ];

    for (NSString *file in prefsFiles) {
        for (NSString *bundleId in bundleIdentifiersToRemove) {
            if ([file containsString:bundleId] || [file hasSuffix:@".plist"]) {
                [fm removeItemAtPath:[prefsPath stringByAppendingPathComponent:file] error:nil];
                break;
            }
        }
    }

    NSDictionary *spec = @{ (__bridge id)kSecClass: (__bridge id)kSecClassGenericPassword };
    SecItemDelete((__bridge CFDictionaryRef)spec);
    spec = @{ (__bridge id)kSecClass: (__bridge id)kSecClassInternetPassword };
    SecItemDelete((__bridge CFDictionaryRef)spec);
    spec = @{ (__bridge id)kSecClass: (__bridge id)kSecClassIdentity };
    SecItemDelete((__bridge CFDictionaryRef)spec);
    spec = @{ (__bridge id)kSecClass: (__bridge id)kSecClassCertificate };
    SecItemDelete((__bridge CFDictionaryRef)spec);
    spec = @{ (__bridge id)kSecClass: (__bridge id)kSecClassKey };
    SecItemDelete((__bridge CFDictionaryRef)spec);

    UIWindow *window = nil;
    if (@available(iOS 13.0, *)) {
        for (UIWindowScene *scene in [UIApplication sharedApplication].connectedScenes) {
            if (scene.activationState == UISceneActivationStateForegroundActive) {
                for (UIWindow *w in scene.windows) {
                    if (w.isKeyWindow) {
                        window = w;
                        break;
                    }
                }
            }
        }
    }
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    if (!window) window = [UIApplication sharedApplication].keyWindow;
#pragma clang diagnostic pop

    UIViewController *rootVC = window.rootViewController;
    UIAlertController *done = [UIAlertController alertControllerWithTitle:@"Guest reset complete. Game will exit in 5s."
                                                                  message:nil
                                                           preferredStyle:UIAlertControllerStyleAlert];
    [rootVC presentViewController:done animated:YES completion:nil];

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)),
                   dispatch_get_main_queue(), ^{
        exit(0);
    });
}