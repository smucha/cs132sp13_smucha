#import "Calculator.h"

@implementation Calculator

@synthesize numberOnScreen;

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
    if('0' <= theKey <= '9')
    {
        int old;
        old = [self numberOnScreen];
        int newDigit;
        newDigit = theKey - '0';
        [self setNumberOnScreen: 10 * old + newDigit];
    } else {
        if( theKey == 'C')
        {
            numberOnScreen = '0';
        } else {
            NSLog(@"Uncovered argument '%c' in %@ message received by object at %p (%@)", theKey, NSStringFromSelector(_cmd), self, self);
        }
    
    }
}

-(NSString*) description
{
    return [NSString stringWithFormat:@"Calculator with %d on screen.", [self numberOnScreen]];
}
@end
