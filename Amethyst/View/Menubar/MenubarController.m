//
//  MenubarController.m
//  Menubar
//
//  Created by Nickolas Pylarinos Stamatelatos on 15/08/2019.
//  Copyright © 2019 Nickolas Pylarinos. All rights reserved.
//

#import "MenubarController.h"
#import "Button.h"
#import "Common.h"

@implementation MenubarController
- (instancetype)initWithWindow:(NSWindow *)window {
    self = [super initWithWindow:window];
    if (self) {
        _offset = 0;
    }
    return self;
}
+ (instancetype)forMenubar:(Menubar *)menubar {
    return [[super alloc] initWithWindow:menubar];
}
- (void)push {
    /* Create button */
    MacButton *button = [[MacButton alloc] init];
    
    /* Set its position in menubar */
    NSRect frame = button.frame;
    frame.origin.x = _offset;
    
    /* Set button properties */
    [button setFrame:frame];
    [button setAction:@selector(dostuff:)];
    
    /* Position next to last button */
    [[[self window] contentView] addSubview:button];
    
    /* Update offset */
    _offset += mac_button_len;
}
@end
