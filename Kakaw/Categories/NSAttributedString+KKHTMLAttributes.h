/**
 * Extensions for converting HTML to attributed strings.
 */
@interface NSAttributedString (KKHTMLAttributes)

/**
 * Translates HTML into an attributed string and returns the result.
 *
 * Example:
 *
 *     NSString *html = @"<strong>Hello World</strong>";
 *     NSAttributedString *attr = [NSAttributedString attributedStringFromHTMLString:html];
 *
 * @param html A HTML string
 * @returns Configured attributed string
 */
+ (id)attributedStringFromHTMLString:(NSString *)html;

@end