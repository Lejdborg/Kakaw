#import "KKScrollView.h"
#import "NSColor+KKColor.h"

@implementation KKScrollView

// -----------------------------------------------------------------------------
#pragma mark - VIEW LIFECYCLE
// -----------------------------------------------------------------------------

- (id)initWithFrame:(NSRect)frame {
    if ((self = [super initWithFrame:frame])) {
        [self makeLayerBacked];
    }

    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];

    [self makeLayerBacked];
}

- (void)makeLayerBacked {
    [self setWantsLayer:YES];
    id documentView = self.documentView;
    [self.contentView setLayer:[CAScrollLayer layer]];
    [self.contentView setWantsLayer:YES];
    [self setDocumentView:documentView];
}

@end