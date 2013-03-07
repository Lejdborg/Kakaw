/**
 * Kakaw color extensions.
 */
@interface NSColor (KKColor)

/**
 * Get a NSColor object from a HEX code.
 *
 * @param hex
 * @returns NSColor instance
 */
+ (instancetype)colorWithHex:(NSString *)hex;

/**
 * Converts an NSColor instance to a CGColorRef.
 *
 * @param color
 * @returns CGColor representation of color
 */
+ (CGColorRef)CGColorFromNSColor:(NSColor *)color;

@end