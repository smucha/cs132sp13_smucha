//
//  P1AppDelegate.m
//  Calculator
//
//  Created by Bryant Adams on 2/1/13.
//  Copyright (c) 2013 CS132. All rights reserved.
//

#import "P1AppDelegate.h"
#import "Calculator.h"

@implementation P1AppDelegate
{
    Calculator* _casio;
}

-(void)updateDisplay
{
    [[self displayArea] setStringValue:[NSString stringWithFormat:@"%d", [_casio numberOnScreen]]];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    _casio = [[Calculator alloc] init];
    [self updateDisplay];
}

- (IBAction)keyPress:(id)sender {
    char theKey;
    theKey = [[sender title] characterAtIndex:0];
    [_casio pressKey:theKey];
    [self updateDisplay];
    
}
@end
