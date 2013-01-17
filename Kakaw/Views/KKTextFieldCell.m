#import "KKTextFieldCell.h"

@interface KKTextFieldCell ()
@property (strong) NSShadow *shadow;
@end

@implementation KKTextFieldCell

// -----------------------------------------------------------------------------
#pragma mark - OVERRIDE FRAME DRAWING METHODS
// -----------------------------------------------------------------------------

- (void)editWithFrame:(NSRect)aRect inView:(NSView *)controlView editor:(NSText *)editor delegate:(id)delegate event:(NSEvent *)event {
    if (!self.centerVerticalAlignment) {
        [super editWithFrame:aRect inView:controlView editor:editor delegate:delegate event:event];
    }
    else {
        [super editWithFrame:[self adjustedFrameToVerticallyCenterText:aRect]
                      inView:controlView editor:editor delegate:delegate event:event];
    }
}

- (void)selectWithFrame:(NSRect)aRect inView:(NSView *)controlView editor:(NSText *)editor delegate:(id)delegate start:(NSInteger)start length:(NSInteger)length {
    if (!self.centerVerticalAlignment) {
        [super selectWithFrame:aRect inView:controlView editor:editor delegate:delegate start:start length:length];
    }
    else {
        [super selectWithFrame:[self adjustedFrameToVerticallyCenterText:aRect] inView:controlView editor:editor delegate:delegate start:start length:length];
    }
}

- (void)drawInteriorWithFrame:(NSRect)frame inView:(NSView *)view {
    if (self.shadow) {
        [self.shadow set];
    }

    if (!self.centerVerticalAlignment) {
        [super drawInteriorWithFrame:frame inView:view];
        return;
    }

    if (!self.isMultiline) {
        [super drawInteriorWithFrame:[self adjustedFrameToVerticallyCenterText:frame] inView:view];
    }
    else {
        NSAttributedString *attrString = self.attributedStringValue;

        // If your values can be attributed strings, make them white when selected
        if (self.isHighlighted && self.backgroundStyle == NSBackgroundStyleDark) {
            NSMutableAttributedString *whiteString = [attrString mutableCopy];
            [whiteString addAttribute:NSForegroundColorAttributeName
                                value:[NSColor whiteColor]
                                range:NSMakeRange(0, whiteString.length) ];
            attrString = whiteString;
        }

        [attrString drawWithRect:[self titleRectForBounds:frame]
                         options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin];
    }
}

- (NSRect)titleRectForBounds:(NSRect)theRect {
    if (!self.isMultiline) {
        return [super titleRectForBounds:theRect];
    }

    // Get the standard text content rectangle
    NSRect titleFrame = [super titleRectForBounds:theRect];

    // Find out how big the rendered text will be
    NSAttributedString *attrString = self.attributedStringValue;
    NSRect textRect = [attrString boundingRectWithSize:titleFrame.size
                                               options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin];

    // If the height of the rendered text is less then the available height,
    // we modify the titleRect to center the text vertically
    if (textRect.size.height < titleFrame.size.height) {
        titleFrame.origin.y = theRect.origin.y + (theRect.size.height - textRect.size.height) / 2.0;
        titleFrame.size.height = textRect.size.height;
    }

    return titleFrame;
}

// -----------------------------------------------------------------------------
#pragma mark - HELPER METHODS
// -----------------------------------------------------------------------------

- (NSRect)adjustedFrameToVerticallyCenterText:(NSRect)frame {
    NSInteger offset = floor((NSHeight(frame) - (self.font.ascender - self.font.descender)) / 2);
    return NSInsetRect(frame, 0.0, offset);
}

// -----------------------------------------------------------------------------
#pragma mark - GETTERS AND SETTERS
// -----------------------------------------------------------------------------

- (BOOL)isMultiline {
    return self.lineBreakMode == NSLineBreakByCharWrapping || self.lineBreakMode == NSLineBreakByWordWrapping;
}

- (void)setShadowColor:(NSColor *)shadowColor withOffset:(NSSize)shadowOffset {
    NSShadow *shadow = [[NSShadow alloc] init];
    [shadow setShadowColor:shadowColor];
    [shadow setShadowBlurRadius:0.f];
    [shadow setShadowOffset:shadowOffset];

    [self setShadow:shadow];
}

@end