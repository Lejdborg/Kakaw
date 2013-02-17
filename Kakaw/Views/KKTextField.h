@interface KKTextField : NSTextField

/// ----------------------------------------------------------------------------
/// @name Content size
/// ----------------------------------------------------------------------------

/**
 * Resize the textfield to fit the contents perfectly within the specified
 * constraints.
 *
 * @param size The maximum size the text field will get
 */
- (void)resizeToFit:(NSSize)size;

/// ----------------------------------------------------------------------------
/// @name Layer Styles
/// ----------------------------------------------------------------------------

/** The color of the textview's border */
@property (nonatomic, strong) NSColor *borderColor;

/** Specifies the width of the textview's border. */
@property (nonatomic, readwrite) CGFloat borderWidth;

@end