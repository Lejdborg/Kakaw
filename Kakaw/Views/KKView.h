/**
 * Kakaw base view that provides drawing extensions to NSView.
 */
@interface KKView : NSView

/// ----------------------------------------------------------------------------
/// @name Layer Styles
/// ----------------------------------------------------------------------------

/** Radius for rounding corners on view */
@property (nonatomic, readwrite) CGFloat cornerRadius;

/** Background color for filling the view */
@property (nonatomic, strong) NSColor *backgroundColor;

/** The color of the view's border */
@property (nonatomic, strong) NSColor *borderColor;

/** Specifies the width of the view's border. */
@property (nonatomic, readwrite) CGFloat borderWidth;

/// ----------------------------------------------------------------------------
/// @name Gradients
/// ----------------------------------------------------------------------------

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
 * @param angle Drawing angle
 */
- (void)drawGradientWithColors:(NSArray *)colors
                         angle:(CGFloat)angle;

/// ----------------------------------------------------------------------------
/// @name Mouse Events
/// ----------------------------------------------------------------------------

/** Prevent mouse clicks from propagating through the view. */
@property (nonatomic, readwrite) BOOL preventClickThrough;

@end