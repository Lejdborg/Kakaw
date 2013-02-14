#import "NSColor+KKHexColors.h"

@implementation NSColor (KKHexColors)

+ (instancetype)colorWithHex:(NSString *)hex {
    NSString *hexString = [[hex stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];

    // Strip # if it appears
    if ([hexString hasPrefix:@"#"]) {
        hexString = [hexString substringFromIndex:1];
    }

    if ([hexString length] != 6) {
        return [NSColor whiteColor];
    }

    NSString *red = [hexString substringWithRange:NSMakeRange(0, 2)];
    NSString *green = [hexString substringWithRange:NSMakeRange(2, 2)];
    NSString *blue = [hexString substringWithRange:NSMakeRange(4, 2)];

    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:red] scanHexInt:&r];
    [[NSScanner scannerWithString:green] scanHexInt:&g];
    [[NSScanner scannerWithString:blue] scanHexInt:&b];

    return [NSColor colorWithCalibratedRed:((float)r / 255.0f)
                                     green:((float)g / 255.0f)
                                      blue:((float)b / 255.0f)
                                     alpha:1.0f];
}

@end