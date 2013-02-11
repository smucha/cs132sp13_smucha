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
    NSLog(@"STUB response to '%@' message received by object at %p (%@)",
    NSStringFromSelector(_cmd), self, self);
     return;
}

-(NSString*) description
{
    return [NSString stringWithFormat:@"Calculator with %d on screen.", [self numberOnScreen]];
}
@end
