#import "Calculator.h"
#import "WCSFraction.h"
#import "WCSMutableFraction.h"

@implementation Calculator

@synthesize numberOnScreen;

@synthesize numberAccumulated;

@synthesize operationPending;

- (id)init
{
    self = [super init];
    if (self)
    {
        //Set up initial calculator conditions here
        [self setNumberAccumulated:0];
        [self setNumberOnScreen:0];
        [self setOperationPending:'?'];
    }
    return self;
}


-(void)pressKey:(char)theKey
{
    if(isAdigit(theKey))
    {
        [self appendDigit:theKey];
    } else {
        if(isClearScreenKey(theKey))
        {
            [self clearScreen:theKey];
        } else {
            NSLog(@"Uncovered argument '%c' in %@ message received by object at %p (%@)", theKey, NSStringFromSelector(_cmd), self, self);
        }
    
    }
    if(isResultKey(theKey))
    {
        [self computeAndDisplayResult];
    }
    if(isArithmeticAllKey(theKey))
    {
        [self registerArithmetic:theKey];
    }
    if(isClearAllKey(theKey))
    {
        [self computeAndDisplayResult];
        [self clearScreen:theKey];
    }
}

-(NSString*) description
{
    return [NSString stringWithFormat:@"Calculator with %@ on screen.", [self numberOnScreen]];
}

-(void)appendDigit:(char) theKey
{
    WCSMutableFraction* old =[self numberOnScreen] ;
    switch ([self fractional])
    {
        case WCSPartTop:
            [old setNumerator:[old numerator]*10+theKey];
            break;
            
        case WCSPartBottom:
            [old setNumerator:[old denominator]*10+theKey];
            break;
            
        default:
            NSLog(@"ERROR!");
            break;
    }
}

-(void)clearScreen:(char) theKey
{
    [self setNumberOnScreen:0];
}

-(void) registerArithmetic:(char)theOperator
{
    [self computeAndDisplayResult];
    [self setNumberAccumulated:[self numberOnScreen]];
    [self clearScreen:0];
    [self setOperationPending:theOperator];
}

-(void) computeAndDisplayResult
{
    char operator = [self operationPending];
	WCSMutableFraction* result = [self numberOnScreen];
    WCSFraction* accumlated = [self numberAccumulated];
    switch(operator)
	{
		case '+':
		    [result modifyByAdding:accumlated];
		    break;
		case '-':
            [result modifyByAdding:[accumlated negative]];
            break;
		case '*':
            [result modifyByMultiplying:accumlated];
            break;
        case '/':
            [result modifyByMultiplying:[accumlated reciprocal]];
            break;
        case '%':
            if([self fractional]== WCSPartTop)
            {
                [self setFractional: WCSPartBottom];
            }
            else
                if([self fractional]== WCSPartBottom)
                {
                    [self setFractional: WCSPartTop];
                }
                else
                {
                    NSLog(@"ERROR!");
                }
            break;
        case '<':
            result = [self numberOnScreen];
            if([self fractional]== WCSPartTop)
            {
                [result setNumerator:[result numerator]/10];
            }
            else
                if([self fractional]== WCSPartBottom)
                {
                    [result setDenominator:[result denominator]/10];
                }
                else
                {
                                NSLog(@"ERROR!");
                }
        default:
        break;
        }
    [self setNumberOnScreen:result];
    [self clearAccumulator];
    [self clearOperation];
    
}



-(void) clearAccumulator
{
    numberAccumulated = 0;
}

-(void) clearOperation
{
    operationPending = '?';
}

@end

BOOL isAdigit(char pressKey)
{
    if(pressKey > '9') return NO;
    if(pressKey < '0') return NO;
    return YES;
}

BOOL isClearScreenKey(char pressKey)
{
    if(pressKey == 'C') return YES;
    if(pressKey == 'c') return YES;
    return NO;
}

BOOL isClearAllKey(char pressKey)
{
    if(pressKey == 'A') return YES;
    if(pressKey == 'a') return YES;
    return NO;
}

BOOL isResultKey(char pressKey)
{
    if(pressKey == '=') return YES;
    return NO;
}

BOOL isArithmeticAllKey(char pressKey)
{
    if(pressKey == '+') return YES;
    if(pressKey == '-') return YES;
    if(pressKey == '*') return YES;
    if(pressKey == '/') return YES;
    if(pressKey == '%') return YES;
    return NO;
}
