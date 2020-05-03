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

- (void)push:(NSView *)view {
    /* Set its position in menubar */
    NSRect frame = view.frame;
    frame.origin.x = _offset;
    
    /* Set button properties */
    [view setFrame:frame];
    
    /* Position next to last button */
    [[[self window] contentView] addSubview:view];
    
    /* Update offset */
    _offset += frame.size.width;
}

- (void)pushButton {
    /* Create button */
    [self push:[[MacButton alloc] init]];
}

- (void)setRunAppTextField:(TextField *)runAppTextField {
    /* cannot add 2 runAppTextFields */
    if (_runAppTextField)
        return;
    
    _runAppTextField = runAppTextField;
}

- (void)pushRunAppTextField {
    [self setRunAppTextField:[[TextField alloc] init]];
    [self push:_runAppTextField];
}

- (void)selectRunAppTextField {
    _runAppTextField.stringValue = @"__SELECT_ME_MAGIC@npyl";
}

@end
