#import "KKView.h"
#import "NSColor+KKColor.h"

@interface KKView ()
@property (nonatomic, strong) CAGradientLayer *gradientLayer;
@property (nonatomic, strong) NSArray *gradientColors;
@property (nonatomic, readwrite) CGFloat gradientAngle;
@end

@implementation KKView

// -----------------------------------------------------------------------------
#pragma mark - DRAWING
// -----------------------------------------------------------------------------

- (void)setDrawRectBlock:(KKDrawRectBlock)drawRectBlock {
    _drawRectBlock = drawRectBlock;
    [self setNeedsDisplay:YES];
}

// -----------------------------------------------------------------------------
#pragma mark - VIEW STYLES
// -----------------------------------------------------------------------------

- (void)setCornerRadius:(CGFloat)cornerRadius {
    _cornerRadius = cornerRadius;
    [self setNeedsDisplay:YES];
}

- (void)setBackgroundColor:(NSColor *)backgroundColor {
    _backgroundColor = backgroundColor;
    [self setNeedsDisplay:YES];
}

- (void)setBorderColor:(NSColor *)borderColor {
    _borderColor = borderColor;
    [self setNeedsDisplay:YES];
}

- (void)setBorderWidth:(CGFloat)borderWidth {
    _borderWidth = borderWidth;
    [self setNeedsDisplay:YES];
}

// -----------------------------------------------------------------------------
#pragma mark - GRADIENTS
// -----------------------------------------------------------------------------

- (void)drawHorizontalGradientWithColors:(NSArray *)colors {
    [self drawGradientWithColors:colors angle:0];
}

- (void)drawVerticalGradientWithColors:(NSArray *)colors {
    [self drawGradientWithColors:colors angle:270];
}

- (void)drawGradientWithColors:(NSArray *)colors
                         angle:(CGFloat)angle {
    [self setGradientColors:colors];
    [self setGradientAngle:angle];

    [self setNeedsDisplay:YES];
}

// -----------------------------------------------------------------------------
#pragma mark - MOUSE EVENTS
// -----------------------------------------------------------------------------

- (void)mouseDown:(NSEvent *)theEvent {
    if (!self.preventClickThrough) {
        [super mouseDown:theEvent];
    }
}

// -----------------------------------------------------------------------------
#pragma mark - VIEW DRAWING
// -----------------------------------------------------------------------------

- (void)drawRect:(NSRect)dirtyRect {
    NSRect contentRect = NSInsetRect(self.bounds, self.borderWidth, self.borderWidth);
    NSBezierPath *path = [NSBezierPath bezierPathWithRect:dirtyRect];

    self.backgroundColor ? [self.backgroundColor set] : [[NSColor clearColor] set];

    if (self.cornerRadius) {
        path = [NSBezierPath bezierPathWithRoundedRect:contentRect
                                               xRadius:self.cornerRadius
                                               yRadius:self.cornerRadius];
    }

    if (self.borderWidth && self.borderColor) {
        [path setLineWidth:self.borderWidth];
        [self.borderColor setStroke];
        [path stroke];
    }

    if (self.gradientColors) {
        NSGradient *gradient = [[NSGradient alloc] initWithColors:self.gradientColors];
        [gradient drawInBezierPath:path angle:self.gradientAngle];
    }

    [path fill];

    if (self.drawRectBlock) {
        self.drawRectBlock(dirtyRect);
    }
}

@end