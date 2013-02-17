#import "KKClipView.h"

@interface KKClipView ()
@property (nonatomic, strong) CAScrollLayer *layer;
@end

@implementation KKClipView
@dynamic layer;

// -----------------------------------------------------------------------------
#pragma mark - VIEW LIFECYCLE
// -----------------------------------------------------------------------------

- (id)initWithFrame:(NSRect)frame {
    if ((self = [super initWithFrame:frame])) {
        [self setLayer:[CAScrollLayer layer]];
        [self setWantsLayer:YES];

        [self setLayerContentsRedrawPolicy:NSViewLayerContentsRedrawNever];
        [self setBackgroundColor:[NSColor clearColor]];
    }

    return self;
}

@end