/**
 * Things like changing the height or position of a view should be a lot easier.
 *
 * This category makes it so.
 */
@interface NSView (KKFrameManipulation)

/// ----------------------------------------------------------------------------
/// @name Frame size
/// ----------------------------------------------------------------------------

/** The view's size */
@property (nonatomic, readwrite) NSSize size;

/** The view's width */
@property (nonatomic, readwrite) CGFloat width;

/** The view's height */
@property (nonatomic, readwrite) CGFloat height;

/// ----------------------------------------------------------------------------
/// @name Frame position
/// ----------------------------------------------------------------------------

/** The view's position */
@property (nonatomic, readwrite) NSPoint origin;

/** The view's x position */
@property (nonatomic, readwrite) CGFloat x;

/** The view's y position */
@property (nonatomic, readwrite) CGFloat y;

@end