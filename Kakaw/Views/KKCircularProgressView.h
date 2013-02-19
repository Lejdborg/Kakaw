/**
 * This is a custom pie chart style progress view.
 *
 * The base color and the fill color are configurable.
 */
@interface KKCircularProgressView : NSView

/// ----------------------------------------------------------------------------
/// @name Progress View Settings
/// ----------------------------------------------------------------------------

/** How much progress: 0-1 */
@property (nonatomic, assign) CGFloat progress;

/** The background color of the progress chart. Defaults to transparent. */
@property (nonatomic, strong) NSColor *baseColor;

/** The fill color of the progress arc. Defaults to black. */
@property (nonatomic, strong) NSColor *fillColor;

@end