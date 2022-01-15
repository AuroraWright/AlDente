#import <Cocoa/Cocoa.h>
#import <IOKit/pwr_mgt/IOPMLib.h>

@interface DisableClamshellSleep : NSObject

+ (void)RootDomain_SetDisableClamShellSleep:(bool)disable;

@end
