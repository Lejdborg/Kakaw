#import "KKCircularProgressView.h"

@implementation KKCircularProgressView

// -----------------------------------------------------------------------------
#pragma mark - PROGRESS VIEW SETTINGS
// -----------------------------------------------------------------------------

- (void)setProgress:(CGFloat)progress {
    if (progress > 1.0) {
        progress = 1.0;
    }

    if (_progress != progress) {
        _progress = progress;
        [self setNeedsDisplay:YES];
    }
}

- (NSColor *)baseColor {
    if (!_baseColor) {
        _baseColor = [NSColor clearColor];
    }

    return _baseColor;
}

- (NSColor *)fillColor {
    if (!_fillColor) {
        _fillColor = [NSColor blackColor];
    }

    return _fillColor;
}

// -----------------------------------------------------------------------------
#pragma mark - VIEW DRAWING
// -----------------------------------------------------------------------------

- (void)drawRect:(CGRect)rect {
    // Calculate circle size
    CGPoint center = CGPointMake(rect.size.width / 2, rect.size.height / 2);
    CGFloat radius = MIN(rect.size.width, rect.size.height) / 2;
    CGFloat startAngle = 90;

    // Draw base
    NSBezierPath *basePath = [NSBezierPath bezierPath];
    [basePath moveToPoint:center];
    [basePath appendBezierPathWithArcWithCenter:center
                                         radius:radius
                                     startAngle:startAngle
                                       endAngle:startAngle - 360
                                      clockwise:YES];
    [self.baseColor setFill];
    [basePath fill];

    // Draw progress
    NSBezierPath *progressPath = [NSBezierPath bezierPath];
    [progressPath moveToPoint:center];
    [progressPath appendBezierPathWithArcWithCenter:center
                                             radius:radius
                                         startAngle:startAngle
                                           endAngle:startAngle - 360 * self.progress
                                          clockwise:YES];

    [self.fillColor setFill];
    [progressPath fill];
}

@end