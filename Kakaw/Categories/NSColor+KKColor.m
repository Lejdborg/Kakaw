#import "NSColor+KKColor.h"
#import <CoreGraphics/CoreGraphics.h>

static void drawCGImagePattern (void *info, CGContextRef context) {
	CGImageRef image = info;

	size_t width = CGImageGetWidth(image);
	size_t height = CGImageGetHeight(image);

	CGContextDrawImage(context, CGRectMake(0, 0, width, height), image);
}

static void releasePatternInfo (void *info) {
	CFRelease(info);
}

@implementation NSColor (KKColor)

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

+ (CGColorRef)CGColorFromNSColor:(NSColor *)color {
    if ([color respondsToSelector:@selector(CGColor)]) {
        return color.CGColor;
    }

    // This part is adapted from Rebel (https://github.com/github/Rebel) and was
    // originally written by Justin Spahr-Summers.
    //
    // See: https://github.com/github/Rebel/blob/master/Rebel/NSColor%2BRBLCGColorAdditions.m
    if ([color.colorSpaceName isEqualToString:NSPatternColorSpace]) {
		CGImageRef patternImage = [color.patternImage CGImageForProposedRect:NULL context:nil hints:nil];
		if (patternImage == NULL) {
			return NULL;
		}

		size_t width = CGImageGetWidth(patternImage);
		size_t height = CGImageGetHeight(patternImage);

		CGRect patternBounds = CGRectMake(0, 0, width, height);
		CGPatternRef pattern = CGPatternCreate(
                                               // Released in releasePatternInfo().
                                               (void *)CFRetain(patternImage),
                                               patternBounds,
                                               CGAffineTransformIdentity,
                                               width,
                                               height,
                                               kCGPatternTilingConstantSpacingMinimalDistortion,
                                               YES,
                                               &(CGPatternCallbacks){
                                                   .version = 0,
                                                   .drawPattern = &drawCGImagePattern,
                                                   .releaseInfo = &releasePatternInfo
                                               }
                                               );

		CGColorSpaceRef colorSpaceRef = CGColorSpaceCreatePattern(NULL);

		CGColorRef result = CGColorCreateWithPattern(colorSpaceRef, pattern, (CGFloat[]){ 1.0 });

		CGColorSpaceRelease(colorSpaceRef);
		CGPatternRelease(pattern);

		return (__bridge CGColorRef)(__bridge id)result;
	}

	NSColorSpace *colorSpace = NSColorSpace.genericRGBColorSpace;
	color = [color colorUsingColorSpace:colorSpace];

	CGFloat components[color.numberOfComponents];
	[color getComponents:components];

	CGColorSpaceRef colorSpaceRef = colorSpace.CGColorSpace;
	CGColorRef result = CGColorCreate(colorSpaceRef, components);

	return (__bridge CGColorRef)(__bridge id)result;
}

@end