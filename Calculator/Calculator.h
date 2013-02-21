#import <Foundation/Foundation.h>

@interface Calculator : NSObject

@property (assign) int numberOnScreen;

@property (assign) int numberAccumulated;

@property (assign) char operationPending;

-(void) pressKey:(char) theKey;

-(void)appendDigit:(char) theKey;

-(void)clearScreen:(char) theKey;

@end

BOOL isAdigit(char pressKey);

BOOL isClearScreenKey(char pressKey);

BOOL isClearAllKey(char pressKey);

BOOL isResultKey(char pressKey);