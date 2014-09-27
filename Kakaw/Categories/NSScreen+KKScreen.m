#import "NSScreen+KKScreen.h"

@implementation NSScreen (KKScreen)

- (BOOL)kk_isRetina {
    return [self respondsToSelector:@selector(backingScaleFactor)] && [self backingScaleFactor] >= 2.0;
}

- (BOOL)kk_isDarkMode {
    return [[[NSUserDefaults standardUserDefaults] stringForKey:@"AppleInterfaceStyle"] isEqualToString:@"Dark"];
}

@end