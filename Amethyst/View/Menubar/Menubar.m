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
        self.level = NSModalPanelWindowLevel;
        self.backgroundColor = [NSColor colorWithCGColor:CGColorCreateGenericRGB(1, 1, 1, 0.5)];
        self.opaque = NO;
        self.restorable = NO;
        
        last_good_offset += screenFrame.size.width;
    }
    
    return self;
}

+ (instancetype)forScreen:(NSScreen *)screen {
    return [[Menubar alloc] initForScreen:screen];
}

+ (instancetype)sharedMenubarForScreen:(NSScreen *)screen {
    static NSMutableArray<Menubar *> *_menubars = nil;
    Menubar *result = nil;

    if (!_menubars) {
        /* initialise array */
        _menubars = [NSMutableArray array];
    
        /* create new Menubar object */
        result = [Menubar forScreen:screen];
        
        /* and add it */
        [_menubars addObject:result];
    }
    else {
        /* search menubar with particular screen in _menubars */
        for (Menubar *menubar in _menubars)
            if (menubar.screen == screen)
                result = menubar;
    }
    
    return result;
}

// Fixes elements not responding correct to keyboard events
- (BOOL)canBecomeKeyWindow {
    return YES;
}

- (void)awakeFromNib {
    self.level = NSDockWindowLevel;
}
@end
