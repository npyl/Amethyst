//
//  Button.m
//  Menubar
//
//  Created by Nickolas Pylarinos on 13/08/2019.
//  Copyright © 2019 Nickolas Pylarinos. All rights reserved.
//

#import <AppKit/AppKit.h>
#import <CoreGraphics/CoreGraphics.h>

#import "Button.h"
#import "Common.h"

@implementation MacButton
- (instancetype)init
{
    self = [super init];
    if (self) {
        /* frame */
        const NSRect button_frame = NSMakeRect(0, 0, mac_button_len, menubar_height);
        
        [self setFrame:button_frame];
        
        [self setFocusRingType:NSFocusRingTypeNone];
    }
    return self;
}

- (void)drawRect:(NSRect)rect
{
    /* Highlight happens when button is clicked */
    if ([self isHighlighted]) {
        [self highlightRect:rect];
    }
    else {
        /* Setup Button Font */
        NSFont *font = [NSFont fontWithName:@"SF Pro Text" size:NSFont.systemFontSize];
        NSDictionary *attributes = @{ NSFontAttributeName: font, };
        
        /* Draw Button Title */
        [[self title] drawAtPoint:NSMakePoint(rect.origin.x + 20, rect.origin.y + 5) withAttributes:attributes];
    }
}

- (void)highlightRect:(NSRect)rect
{
    CGContextRef myContext = [[NSGraphicsContext currentContext] CGContext];
    CGContextSetRGBFillColor(myContext, 255, 0, 0, 0.5);
    CGContextFillRect(myContext, rect);
    
    NSFont *font = [NSFont fontWithName:@"SF Pro Text" size:NSFont.systemFontSize];
    NSDictionary *attributes = @{ NSFontAttributeName: font, NSForegroundColorAttributeName : [NSColor whiteColor] };
    
    /* Draw Button Title (in White Color) */
    [[self title] drawAtPoint:NSMakePoint(rect.origin.x + 20, rect.origin.y + 5) withAttributes:attributes];
}
@end
