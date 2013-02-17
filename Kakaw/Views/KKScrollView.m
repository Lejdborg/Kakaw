#import "KKScrollView.h"
#import "KKClipView.h"

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

    if (![self.contentView isKindOfClass:[KKClipView class]]) {
        [self makeLayerBacked];
    }
}

- (void)makeLayerBacked {
    [self setWantsLayer:YES];
    id documentView = self.documentView;
    [self setContentView:[[KKClipView alloc] initWithFrame:self.contentView.frame]];
    [self setDocumentView:documentView];
}

@end