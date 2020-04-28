//
//  TextField.m
//  Amethyst
//
//  Created by Nickolas Pylarinos Stamatelatos on 28/04/2020.
//  Copyright © 2020 Ian Ynda-Hummel. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "TextField.h"
#import "Common.h"

@implementation TextField
- (instancetype)init
{
    self = [super init];
    if (self) {
        /* frame */
        const NSRect text_field_frame = NSMakeRect(0, 0, mac_button_len, menubar_height);

        [self setFrame:text_field_frame];
        
        [self setStringValue:@"HELLO!"];
        
        [[self window] setContentViewController:[[NSViewController alloc] init]];
    }
    return self;
}
@end
