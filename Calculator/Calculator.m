#import "Calculator.h"

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
    return [NSString stringWithFormat:@"Calculator with %d on screen.", [self numberOnScreen]];
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
    [self setNumberOnScreen : 0 ];
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
    char operator;
	int lhs;
	int rhs;
	int result = 0;
	rhs = [self numberOnScreen];
	lhs = [self numberAccumulated];
	operator = [self operationPending];
    switch(operator)
	{
		case '+':
		    result = lhs+rhs;
		    break;
		case '-':
            result = lhs-rhs;
            break;
		case '*':
            result = lhs*rhs;
            break;
        case '/':
            result = lhs/rhs;
            break;
        case '%':
            result = lhs%rhs;
            break;
		default:
            result = rhs;
            break;
	}
	[self setNumberOnScreen:result];
    [self clearAccumulator:0];
    [self clearOperation:0];
}

-(void) clearAccumulator:(char) theKey
{
    numberAccumulated = 0;
}

-(void) clearOperation:(char) theKey
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
