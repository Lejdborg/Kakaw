@interface KKTextFieldCell : NSTextFieldCell

/** Set center vertical alignment */
@property (assign) BOOL centerVerticalAlignment;

/** Single or multi line */
@property (readonly, getter = isMultiline) BOOL multiline;

/**
 * Set a shadow for the text field
 *
 * @param shadowColor Color of the shadow
 * @param shadowOffset Shadow placement relative to text
 */
- (void)setShadowColor:(NSColor *)shadowColor withOffset:(NSSize)shadowOffset;

@end