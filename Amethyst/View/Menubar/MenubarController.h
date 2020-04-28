//
//  MenubarController.h
//  Menubar
//
//  Created by Nickolas Pylarinos Stamatelatos on 15/08/2019.
//  Copyright © 2019 Nickolas Pylarinos. All rights reserved.
//

#ifndef MenubarController_h
#define MenubarController_h

#import <Cocoa/Cocoa.h>
#import <CoreGraphics/CoreGraphics.h>

#import "Menubar.h"

@interface MenubarController : NSWindowController {
    CGFloat _offset;    /* next-button vertical offset */
}

+ (instancetype)forMenubar:(Menubar *)menubar;

- (void)push:(NSView *)view;
- (void)pushButton;
@end

#endif /* MenubarController_h */
