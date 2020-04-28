#import <AppKit/AppKit.h>
#import <CoreGraphics/CoreGraphics.h>

#import "Menubar.h"
#import "MenubarController.h"
#import "Common.h"

@implementation Menubar
- (instancetype)initForScreen:(NSScreen *)screen {
    
    static CGFloat last_good_offset = 0;
    
    const NSRect screenFrame    = screen.frame;
    const NSRect menubarFrame   = NSMakeRect(last_good_offset, screenFrame.size.height - menubar_height + screenFrame.origin.y, screenFrame.size.width, menubar_height);
    
    self = [super initWithContentRect:menubarFrame
                            styleMask:NSWindowStyleMaskDocModalWindow
                              backing:NSBackingStoreBuffered
                                defer:YES];
    
    if (self) {
        self.level = NSFloatingWindowLevel;
        [self setBackgroundColor:[NSColor colorWithCGColor:CGColorCreateGenericRGB(1, 1, 1, 0.5)]];
        self.opaque = NO;
        self.restorable = NO;
        
        /* Create content view */
        //// Not yet needed
        //NSView *view = [[NSView alloc] initWithFrame:menubarFrame];
        //[window setContentView:view];
        
        last_good_offset += screenFrame.size.width;
    }
    
    return self;
}

+ (instancetype)forScreen:(NSScreen *)screen {
    return [[Menubar alloc] initForScreen:screen];
}
@end
