@interface KKView : NSView

/** Prevent mouse clicks from propagating through the view. */
@property (readwrite) BOOL preventClickThrough;

/**
 * Draw a top-down gradient background
 *
 * @param startColor
 * @param endColor
 */
- (void)setGradientStartColor:(NSColor *)startColor endColor:(NSColor *)endColor;

@end