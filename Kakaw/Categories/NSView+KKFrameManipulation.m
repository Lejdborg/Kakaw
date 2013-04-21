#import "NSView+KKFrameManipulation.h"

@implementation NSView (KKFrameManipulation)

// -----------------------------------------------------------------------------
#pragma mark - FRAME SIZE
// -----------------------------------------------------------------------------

- (NSSize)size {
    return self.frame.size;
}

- (void)setSize:(NSSize)size {
    NSRect rect = self.frame;
    rect.size = size;
    [self setFrame:rect];
}

- (CGFloat)width {
    return self.frame.size.width;
}

- (void)setWidth:(CGFloat)width {
    NSRect rect = self.frame;
    rect.size.width = width;
    [self setFrame:rect];
}

- (CGFloat)height {
    return self.frame.size.height;
}

- (void)setHeight:(CGFloat)height {
    NSRect rect = self.frame;
    rect.size.height = height;
    [self setFrame:rect];
}

// -----------------------------------------------------------------------------
#pragma mark - FRAME POSITION
// -----------------------------------------------------------------------------

- (NSPoint)origin {
    return self.frame.origin;
}

- (void)setOrigin:(NSPoint)origin {
    NSRect rect = self.frame;
    rect.origin = origin;
    [self setFrame:rect];
}

- (CGFloat)x {
    return self.frame.origin.x;
}

- (void)setX:(CGFloat)x {
    NSRect rect = self.frame;
    rect.origin.x = x;
    [self setFrame:rect];
}

- (CGFloat)y {
    return self.frame.origin.y;
}

- (void)setY:(CGFloat)y {
    NSRect rect = self.frame;
    rect.origin.y = y;
    [self setFrame:rect];
}

@end