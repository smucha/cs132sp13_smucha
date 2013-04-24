//
//  P1AppDelegate.h
//  Calculator
//
//  Created by Bryant Adams on 2/1/13.
//  Copyright (c) 2013 CS132. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface P1AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSTextField *displayArea;

- (IBAction)keyPress:(id)sender;
@end
