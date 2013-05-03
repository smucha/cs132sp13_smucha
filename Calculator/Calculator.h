#import <Foundation/Foundation.h>
#import "WCSFraction.h"
#import "WCSMutableFraction.h"

typedef enum {
	WCSPartTop,
	WCSPartBottom
} WCSFractionPart;

@interface Calculator : NSObject

@property (strong, readwrite)  WCSMutableFraction* numberOnScreen;

@property (strong, readwrite) WCSFraction* numberAccumulated;

@property (assign) char operationPending;

@property (assign) WCSFractionPart fractional;

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