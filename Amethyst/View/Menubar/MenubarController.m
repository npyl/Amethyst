//
//  MenubarController.m
//  Menubar
//
//  Created by Nickolas Pylarinos Stamatelatos on 15/08/2019.
//  Copyright © 2019 Nickolas Pylarinos. All rights reserved.
//

#import "MenubarController.h"
#import "Button.h"
#import "TextField.h"
#import "Common.h"

@implementation MenubarController
- (instancetype)initWithWindow:(NSWindow *)window {
    self = [super initWithWindow:window];
    if (self) {
        _offset = 0;

        // TODO: Register to listen for specific keys e.g. cmd+r: run (then this will use spotlight on the background for search & suggestions)
    }
    return self;
}
+ (instancetype)forMenubar:(Menubar *)menubar {
    return [[super alloc] initWithWindow:menubar];
}

- (void)push:(NSView *)view {
    /* Set its position in menubar */
    NSRect frame = view.frame;
    frame.origin.x = _offset;
    
    /* Set button properties */
    [view setFrame:frame];
    
    /* Position next to last button */
    [[[self window] contentView] addSubview:view];
    
    /* Update offset */
    _offset += mac_button_len;
}

// TODO: Patch -push to work for any kind of menubar objects and introduce the text view
// TODO: make amethyst take into account the size of the menubar (=> new windows need to stop overlapping with the menubar)
- (void)pushButton {
    /* Create button */
    MacButton *button = [[MacButton alloc] init];
    [button setAction:@selector(dostuff:)];
    
    [self push:button];
}
@end
