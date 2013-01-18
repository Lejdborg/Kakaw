#import "KKView.h"

@interface KKView ()

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

- (void)setBackgroundColor:(NSColor *)backgroundColor {
    _backgroundColor = backgroundColor;
    [self applyLayerProperties];
}

- (void)setCornerRadius:(CGFloat)cornerRadius {
    _cornerRadius = cornerRadius;
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
    // Clear sublayers
    for (CALayer *layer in self.layer.sublayers) {
        [layer removeFromSuperlayer];
    }

    // Apply layer styles
    [self.layer setBackgroundColor:self.backgroundColor.CGColor];
	[self.layer setCornerRadius:self.cornerRadius];
    [self.layer setBorderColor:self.borderColor.CGColor];
    [self.layer setBorderWidth:self.borderWidth];

    // Draw gradients
    if (self.gradientColors) {
        CAGradientLayer *gradientLayer = [CAGradientLayer layer];

        NSMutableArray *colors = [NSMutableArray array];
        for (NSColor *color in self.gradientColors) {
            [colors addObject:(id)color.CGColor];
        }
        [gradientLayer setColors:colors];

        [gradientLayer setBounds:self.layer.bounds];
        [gradientLayer setPosition:CGPointMake(self.bounds.size.width / 2.0,
                                               self.bounds.size.height / 2.0)];

        [gradientLayer setStartPoint:self.gradientStartPoint];
        [gradientLayer setEndPoint:self.gradientEndPoint];

        [gradientLayer setCornerRadius:self.cornerRadius];
        [self.layer addSublayer:gradientLayer];
    }
}

- (void)setLayer:(CALayer *)layer {
	[super setLayer:layer];
	[self applyLayerProperties];
}

@end