//
//  ImmutableFraction.m
//  
//
//  Created by Stacey Mucha on 2/24/13.
//
//

#import "ImmutableFraction.h"

@implementation ImmutableFraction

@synthesize numerator;

@synthesize denominator;

- (id)init
{
    printf("init method ran");
    return 0;
}

- (id)description
{
    printf("description method ran");
    return 0;
}

- (Fraction*)negative
{
    printf("negative method ran");
    return nil;
}

- (Fraction*)reciprocal
{
    printf("reciprocal method ran");
    return nil;
}

- (Fraction*)sumWith:(Fraction*) sum
{
    printf("sum with method ran");
    return nil;
}

- (Fraction*)subtractFrom:(Fraction*) subtract
{
    printf("subtract from method ran");
    return nil;
}

- (Fraction*)minus:(Fraction*) m
{
    printf("minus method ran");
    return nil;
}

- (Fraction*)multiplyBy:(Fraction*) multiply
{
    printf("multiply by method ran");
    return nil;
}

- (Fraction*)divideBy:(Fraction*) divide
{
    printf("divide by method ran");
    return nil;
}

- (Fraction*)divideInto:(Fraction*) into
{
    printf("divide into method ran");
    return nil;
}

@end

int GCD(int x, int y)
{
    printf("GCD activated");
    return 0;
}
