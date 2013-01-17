#import "NSAttributedString+KKHTMLAttributes.h"

@implementation NSAttributedString (KKHTMLAttributes)

+ (id)attributedStringFromHTMLString:(NSString *)html {
    return [[self alloc] initWithHTML:[html dataUsingEncoding:NSUTF8StringEncoding]
                   documentAttributes:nil];
}

@end