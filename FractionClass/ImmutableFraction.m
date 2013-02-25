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
}

- (id)description
{
    printf("description method ran");
}

- (Fraction*)negative
{
    printf("negative method ran");
}

- (Fraction*)reciprocal
{
    printf("reciprocal method ran");
}

- (Fraction*)sumWith:(Fraction*) sum
{
    printf("sum with method ran");
}

- (Fraction*)subtractFrom:(Fraction*) subtract
{
    printf("subtract from method ran");
}

- (Fraction*)minus:(Fraction*) m
{
    printf("minus method ran");
}

- (Fraction*)multiplyBy:(Fraction*) multiply
{
    printf("multiply by method ran");
}

- (Fraction*)divideBy:(Fraction*) divide
{
    printf("divide by method ran");
}

- (Fraction*)divideInto:(Fraction*) into
{
    printf("divide into method ran");
}

@end
