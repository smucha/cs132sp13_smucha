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
    int old;
	old = [self numberOnScreen];
	int newDigit;
	newDigit = theKey - '0';
	[self setNumberOnScreen: 10 * old + newDigit];
}

-(NSString*) description
{
    return [NSString stringWithFormat:@"Calculator with %d on screen.", [self numberOnScreen]];
}
@end
