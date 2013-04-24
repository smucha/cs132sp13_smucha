#import <Foundation/Foundation.h>

@interface Calculator : NSObject

@property (assign) int numberOnScreen;

@property (assign) int numberAccumulated;

@property (assign) char operationPending;

-(void) pressKey:(char) theKey;

-(void)appendDigit:(char) theKey;

-(void)clearScreen:(char) theKey;

-(void) registerArithmetic:(char)theOperator;

-(void) computeAndDisplayResult;

-(void) clearAccumulator:(char) theKey;

-(void) clearOperation:(char) theKey;

@end

BOOL isAdigit(char pressKey);

BOOL isClearScreenKey(char pressKey);

BOOL isClearAllKey(char pressKey);

BOOL isResultKey(char pressKey);

BOOL isArithmeticAllKey(char pressKey);