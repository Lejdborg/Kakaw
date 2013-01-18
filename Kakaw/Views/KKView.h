@interface KKView : NSView

/// ----------------------------------------------------------------------------
/// @name Layer Styles
/// ----------------------------------------------------------------------------

/** Background color for filling the view */
@property (nonatomic, strong) NSColor *backgroundColor;

/** Radius for rounding corners on view */
@property (nonatomic, readwrite) CGFloat cornerRadius;

/**
 * Draw a left-right gradient background
 *
 * @param colors List of NSColors
 */
- (void)drawHorizontalGradientWithColors:(NSArray *)colors;

/**
 * Draw a top-down gradient background
 *
 * @param colors List of NSColors
 */
- (void)drawVerticalGradientWithColors:(NSArray *)colors;

/**
 * Draw a gradient at a custom angle by defining the endpoints
 *
 * @param colors List of NSColors
 * @param startPoint Point to start drawing from
 * @param endPoint Point to end drawing at
 */
- (void)drawGradientWithColors:(NSArray *)colors
                    startPoint:(CGPoint)startPoint
                      endPoint:(CGPoint)endPoint;

/// ----------------------------------------------------------------------------
/// @name Mouse Events
/// ----------------------------------------------------------------------------

/** Prevent mouse clicks from propagating through the view. */
@property (nonatomic, readwrite) BOOL preventClickThrough;

@end