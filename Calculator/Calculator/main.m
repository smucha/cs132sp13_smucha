//
//  main.m
//  Calculator
//
//  Created by Bryant Adams on 2/1/13.
//  Copyright (c) 2013 CS132. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Calculator.h"

void CLItest(void);

int main(int argc, char *argv[])
{
    CLItest(); //Comment out this line to see a GUI version ;)
    return NSApplicationMain(argc, (const char **)argv);
}

void CLItest(void)
{
    @autoreleasepool {
        char userInput;
        Calculator* ti84 = nil;
        ti84 = [[Calculator alloc] init];
        while(YES)
        {
            printf("Press a key:");
            scanf(" %c", &userInput);
            [ti84 pressKey:userInput];
            printf("[%c] pushed. Calculator shows:%d\n",
                   userInput, [ti84 numberOnScreen]);
        }
    }
}