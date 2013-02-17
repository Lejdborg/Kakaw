#import "KKTextField.h"

@implementation KKTextField

// -----------------------------------------------------------------------------
#pragma mark - VIEW LIFECYCLE
// -----------------------------------------------------------------------------

- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self setup];
    }

    return self;
}

- (id)initWithFrame:(NSRect)frame {
	if (self = [super initWithFrame:frame]) {
        [self setup];
    }

	return self;
}

- (void)setup {
    [self setWantsLayer:YES];
    [self setLayerContentsPlacement:NSViewLayerContentsPlacementScaleAxesIndependently];
    [self setLayerContentsRedrawPolicy:NSViewLayerContentsRedrawOnSetNeedsDisplay];
}

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
#pragma mark - LAYER STYLES
// -----------------------------------------------------------------------------

- (void)setBorderColor:(NSColor *)borderColor {
    _borderColor = borderColor;
    [self applyLayerProperties];
}

- (void)setBorderWidth:(CGFloat)borderWidth {
    _borderWidth = borderWidth;
    [self applyLayerProperties];
}

// -----------------------------------------------------------------------------
#pragma mark - LAYER MANAGEMENT
// -----------------------------------------------------------------------------

- (void)applyLayerProperties {
    [self.layer setBorderColor:self.borderColor.CGColor];
    [self.layer setBorderWidth:self.borderWidth];
}

- (void)setLayer:(CALayer *)layer {
	[super setLayer:layer];
	[self applyLayerProperties];
}

@end