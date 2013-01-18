/**
 * Kakaw HEX color extensions.
 */
@interface NSColor (KKHexColors)

/**
 * Get a NSColor object from a HEX code.
 *
 * @returns NSColor instance
 */
+ (id)colorWithHex:(NSString *)hex;

@end