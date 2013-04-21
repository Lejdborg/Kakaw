/**
 * Kakaw color extensions.
 */
@interface NSColor (KKColor)

/**
 * Get a NSColor object from a HEX code.
 *
 * @param hex Six character hex color (e.g. `@"FFFFFF"`)
 * @returns NSColor instance
 */
+ (instancetype)colorWithHex:(NSString *)hex;

@end