#import <Cocoa/Cocoa.h>

@interface Menubar : NSWindow
//+ (instancetype)forScreen:(NSScreen *)screen;
+ (instancetype)sharedMenubarForScreen:(NSScreen *)screen;
@end
