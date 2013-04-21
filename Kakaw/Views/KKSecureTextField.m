#import "KKSecureTextField.h"
#import "NSColor+KKColor.h"

@implementation KKSecureTextField

// -----------------------------------------------------------------------------
#pragma mark - VIEW STYLES
// -----------------------------------------------------------------------------

- (void)setBorderColor:(NSColor *)borderColor {
    _borderColor = borderColor;
    [self setNeedsDisplay:YES];
}

- (void)setBorderWidth:(CGFloat)borderWidth {
    _borderWidth = borderWidth;
    [self setNeedsDisplay:YES];
}

// -----------------------------------------------------------------------------
#pragma mark - VIEW DRAWING
// -----------------------------------------------------------------------------

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];

    if (self.borderColor && self.borderWidth) {
        NSBezierPath *path = [NSBezierPath bezierPathWithRect:dirtyRect];

        [path setLineWidth:self.borderWidth];
        [self.borderColor setStroke];
        [path stroke];
    }
}

@end