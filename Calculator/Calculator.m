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
            numberOnScreen = 0;
        } else {
            NSLog(@"Uncovered argument '%c' in %@ message received by object at %p (%@)", theKey, NSStringFromSelector(_cmd), self, self);
        }
    
    }
}

-(NSString*) description
{
    return [NSString stringWithFormat:@"Calculator with %d on screen.", [self numberOnScreen]];
}

-(void)appendDigit:(char) theKey
{
    int old;
    old = [self numberOnScreen];
    int newDigit;
    newDigit = theKey - '0';
    [self setNumberOnScreen: 10 * old + newDigit];
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