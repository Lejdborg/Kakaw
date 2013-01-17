#import "KKView.h"

@interface KKView ()
@property (nonatomic, strong) NSColor *gradientStartColor;
@property (nonatomic, strong) NSColor *gradientEndColor;
@end

@implementation KKView

// -----------------------------------------------------------------------------
#pragma mark - GRADIENTS
// -----------------------------------------------------------------------------

- (void)setGradientStartColor:(NSColor *)startColor endColor:(NSColor *)endColor {
    [self setGradientStartColor:startColor];
    [self setGradientEndColor:endColor];

    [self needsToDrawRect:self.bounds];
}

// -----------------------------------------------------------------------------
#pragma mark - VIEW DRAWING
// -----------------------------------------------------------------------------

- (void)drawRect:(NSRect)dirtyRect {
    if (self.gradientStartColor && self.gradientEndColor) {
        NSGradient *gradient = [[NSGradient alloc] initWithStartingColor:self.gradientStartColor
                                                             endingColor:self.gradientEndColor];
        [gradient drawInRect:self.bounds angle:270];
    }
    else {
        [super drawRect:dirtyRect];
    }
}

// -----------------------------------------------------------------------------
#pragma mark - MOUSE EVENTS
// -----------------------------------------------------------------------------

- (void)mouseDown:(NSEvent *)theEvent {
    if (!self.preventClickThrough) {
        [super mouseDown:theEvent];
    }
}

@end