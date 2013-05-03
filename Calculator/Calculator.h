#import <Foundation/Foundation.h>
#import "WCSFraction.h"
#import "WCSMutableFraction.h"

@interface Calculator : NSObject

@property (strong)  WCSMutableFraction* numberOnScreen;

@property (strong) WCSMutableFraction* numberAccumulated;

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