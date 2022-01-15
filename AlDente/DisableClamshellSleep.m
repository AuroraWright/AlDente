//
//  AppDelegate.m
//  CDMManager
//
//  Created by William Gustafson on 1/6/20.
//
// Credit for the implementation goes mostly to Phil Dennis-Jordan (https://philjordan.eu)
// who provided critical guidance and code examples via:
// https://stackoverflow.com/questions/59594123/enabling-closed-display-mode-w-o-meeting-apples-requirements

#import "DisableClamshellSleep.h"

@implementation DisableClamshellSleep

+ (void)RootDomain_SetDisableClamShellSleep:(bool)disable
{
    io_connect_t connection = IO_OBJECT_NULL;
    io_service_t pmRootDomain = IOServiceGetMatchingService(kIOMasterPortDefault, IOServiceMatching("IOPMrootDomain"));
    
    IOServiceOpen (pmRootDomain, current_task(), 0, &connection);

    uint32_t num_outputs = 0;
    uint32_t input_count = 1;
    uint64_t input[input_count];
    input[0] = (uint64_t) { disable ? 1 : 0 };

    IOConnectCallScalarMethod(connection, kPMSetClamshellSleepState, input, input_count, NULL, &num_outputs);
    IOServiceClose(connection);
}

@end
