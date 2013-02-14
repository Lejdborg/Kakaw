/**
 * Kakaw HEX color extensions.
 */
@interface NSColor (KKHexColors)

/**
 * Get a NSColor object from a HEX code.
 *
 * @returns NSColor instance
 */
+ (instancetype)colorWithHex:(NSString *)hex;

@end