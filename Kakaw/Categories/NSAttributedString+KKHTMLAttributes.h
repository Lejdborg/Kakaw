/**
 * Kakaw HTML extensions.
 */
@interface NSAttributedString (KKHTMLAttributes)

/**
 * Translates HTML into an attributed string and returns the result.
 *
 * Example:
 *     NSString *html = @"<strong>Hello World</strong>";
 *     NSAttributedString *attr = [NSAttributedString attributedStringFromHTMLString:html];
 *
 * @param html An HTML string
 * @returns Configured attributed string
 */
+ (id)attributedStringFromHTMLString:(NSString *)html;

@end