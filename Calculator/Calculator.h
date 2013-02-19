#import <Foundation/Foundation.h>

@interface Calculator : NSObject

@property (assign) int numberOnScreen;

@property (assign) int numberAccumulated;

@property (assign) char operationPending;

-(void) pressKey:(char) theKey;

-(void)appendDigit:(char) theKey;

@end

BOOL isAdigit(char pressKey);

BOOL isClearScreenKey(char pressKey);