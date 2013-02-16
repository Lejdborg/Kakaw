#import "KKView.h"

@interface KKView ()

@property (nonatomic, strong) CAGradientLayer *gradientLayer;
@property (nonatomic, strong) NSArray *gradientColors;
@property (nonatomic, readwrite) CGPoint gradientStartPoint;
@property (nonatomic, readwrite) CGPoint gradientEndPoint;

@end

@implementation KKView

// -----------------------------------------------------------------------------
#pragma mark - VIEW LIFECYCLE
// -----------------------------------------------------------------------------

- (id)initWithFrame:(NSRect)frame {
	if (self = [super initWithFrame:frame]) {
        [self setWantsLayer:YES];
        [self setLayerContentsPlacement:NSViewLayerContentsPlacementScaleAxesIndependently];
        [self setLayerContentsRedrawPolicy:NSViewLayerContentsRedrawNever];
    }

	return self;
}

// -----------------------------------------------------------------------------
#pragma mark - LAYER STYLES
// -----------------------------------------------------------------------------

- (void)setCornerRadius:(CGFloat)cornerRadius {
    _cornerRadius = cornerRadius;
    [self applyLayerProperties];
}

- (void)setBackgroundColor:(NSColor *)backgroundColor {
    _backgroundColor = backgroundColor;
    [self applyLayerProperties];
}

- (void)setBorderColor:(NSColor *)borderColor {
    _borderColor = borderColor;
    [self applyLayerProperties];
}

- (void)setBorderWidth:(CGFloat)borderWidth {
    _borderWidth = borderWidth;
    [self applyLayerProperties];
}

- (void)setShadowColor:(NSColor *)shadowColor {
    _shadowColor = shadowColor;
    [self applyLayerProperties];
}

- (void)setShadowOffset:(CGSize)shadowOffset {
    _shadowOffset = shadowOffset;
    [self applyLayerProperties];
}

- (void)setShadowOpacity:(float)shadowOpacity {
    _shadowOpacity = shadowOpacity;
    [self applyLayerProperties];
}

- (void)setShadowRadius:(CGFloat)shadowRadius {
    _shadowRadius = shadowRadius;
    [self applyLayerProperties];
}

// -----------------------------------------------------------------------------
#pragma mark - GRADIENTS
// -----------------------------------------------------------------------------

- (void)drawHorizontalGradientWithColors:(NSArray *)colors {
    [self drawGradientWithColors:colors
                      startPoint:CGPointMake(0.0, 0.5)
                        endPoint:CGPointMake(1.0, 0.5)];
}

- (void)drawVerticalGradientWithColors:(NSArray *)colors {
    [self drawGradientWithColors:colors
                      startPoint:CGPointMake(0.5, 1.0)
                        endPoint:CGPointMake(0.5, 0.0)];
}

- (void)drawGradientWithColors:(NSArray *)colors
                    startPoint:(CGPoint)startPoint
                      endPoint:(CGPoint)endPoint {
    [self setGradientColors:colors];
    [self setGradientStartPoint:startPoint];
    [self setGradientEndPoint:endPoint];

    [self applyLayerProperties];
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
#pragma mark - LAYOUT
// -----------------------------------------------------------------------------

+ (BOOL)requiresConstraintBasedLayout {
	return YES;
}

- (void)layout {
	[super layout];
}

// -----------------------------------------------------------------------------
#pragma mark - VIEW HIERARCHY
// -----------------------------------------------------------------------------

- (void)viewDidMoveToSuperview {
	[self applyLayerProperties];
}

- (void)viewDidMoveToWindow {
	[self applyLayerProperties];
}

// -----------------------------------------------------------------------------
#pragma mark - LAYER MANAGEMENT
// -----------------------------------------------------------------------------

- (void)applyLayerProperties {
    // Clear old gradient
    if (self.gradientLayer) {
        [self.gradientLayer removeFromSuperlayer];
    }

    // Apply layer styles
    [self.layer setBackgroundColor:self.backgroundColor.CGColor];
	[self.layer setCornerRadius:self.cornerRadius];
    [self.layer setBorderColor:self.borderColor.CGColor];
    [self.layer setBorderWidth:self.borderWidth];
    [self.layer setShadowColor:self.shadowColor.CGColor];
    [self.layer setShadowOffset:self.shadowOffset];
    [self.layer setShadowOpacity:self.shadowOpacity];
    [self.layer setShadowRadius:self.shadowRadius];

    // Draw gradients
    if (self.gradientColors) {
        [self setGradientLayer:[CAGradientLayer layer]];

        NSMutableArray *colors = [NSMutableArray array];
        for (NSColor *color in self.gradientColors) {
            [colors addObject:(id)color.CGColor];
        }
        [self.gradientLayer setColors:colors];

        [self.gradientLayer setBounds:self.layer.bounds];
        [self.gradientLayer setPosition:CGPointMake(self.bounds.size.width / 2.0,
                                                    self.bounds.size.height / 2.0)];

        [self.gradientLayer setStartPoint:self.gradientStartPoint];
        [self.gradientLayer setEndPoint:self.gradientEndPoint];

        [self.gradientLayer setCornerRadius:self.cornerRadius];
        [self.layer insertSublayer:self.gradientLayer atIndex:0];
    }
}

- (void)setLayer:(CALayer *)layer {
	[super setLayer:layer];
	[self applyLayerProperties];
}

@end