@interface KKSecureTextField : NSSecureTextField

/// ----------------------------------------------------------------------------
/// @name View Styles
/// ----------------------------------------------------------------------------

/** The color of the textview's border */
@property (nonatomic, strong) NSColor *borderColor;

/** Specifies the width of the textview's border. */
@property (nonatomic, readwrite) CGFloat borderWidth;

@end