/**
 * Kakaw screen extensions.
 */
@interface NSScreen (KKScreen)

/**
 * Checks if the current screen is a retina screen.
 *
 * @returns Is retina
 */
- (BOOL)kk_isRetina;

/**
 * Checks if the operating system is in dark mode (dark mode is available in
 * 10.10+)
 *
 * @returns Is dark mode
 */
- (BOOL)kk_isDarkMode;

@end