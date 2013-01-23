#import "KKSecureTextField.h"

@implementation KKSecureTextField

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
    [self setLayerContentsRedrawPolicy:NSViewLayerContentsRedrawNever];
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