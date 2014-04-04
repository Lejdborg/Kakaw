/**
 * Kakaw string validation additions.
 */
@interface NSString (KKStringValidation)

/**
 * Check whether or not a string is a valid email address.
 *
 * @returns Validity of email string
 */
- (BOOL)isValidEmail;

@end