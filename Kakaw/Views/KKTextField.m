#import "KKTextField.h"
#import "NSColor+KKColor.h"

@implementation KKTextField

// -----------------------------------------------------------------------------
#pragma mark - CONTENT SIZE
// -----------------------------------------------------------------------------

- (void)resizeToFit:(NSSize)size {
    [self.cell setWraps:YES];
    [self.cell setLineBreakMode:NSLineBreakByWordWrapping];

    // Set the frame constraints
    NSRect frame = self.frame;
    frame.size.width = size.width;
    frame.size.height = size.height;

    // Calculate new size within the constraints
    frame.size = [self.cell cellSizeForBounds:frame];

    // Make sure the top left corner of the view is at the same position
    frame.origin.y = frame.origin.y + (self.frame.size.height - frame.size.height);

    [self setFrame:frame];
}

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