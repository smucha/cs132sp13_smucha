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
    Fraction* theAnswer = nil;
	int a = [self numerator]; //this is "a"
	int b = [self denominator]; //this is "b"
	int newNumerator = -a; //or whatever formula
	int newDenominator = b; //or whatever formula
	theAnswer = [[Fraction alloc] initWithNumerator:newNumerator
                                     andDenominator:newDenominator];
    return theAnswer;
}

- (Fraction*)reciprocal
{
    Fraction* theAnswer = nil;
	int a = [self numerator]; //this is "a"
	int b = [self denominator]; //this is "b"
	int newNumerator = b; //or whatever formula
	int newDenominator = a; //or whatever formula
	theAnswer = [[Fraction alloc] initWithNumerator:newNumerator
                                     andDenominator:newDenominator];
    return theAnswer;
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
    return [self add:[thingToSubtract negative]];
}

- (Fraction*)multiplyBy:(Fraction*) multiply
{
    printf("multiply by method ran");
    return nil;
}

- (Fraction*)divideBy:(Fraction*) divide
{
    return [self multiply:[divisor reciprocal]];
}

- (Fraction*)divideInto:(Fraction*) into
{
    printf("divide into method ran");
    return nil;
}

- (Fraction*)reduced:(Fraction*) commonDenominator
{
    int x = [self numerator];
	int y = [self denominator];
	int d = GCD(x,y)
	int newNumerator = x/d
	int newDenominator = y/d
	Fraction* theAnswer = [[Fraction alloc] initWithNumerator:newNumerator
                                               andDenominator:newDenominator];
	return theAnswer;
}

@end

int GCD(int x, int y)
{
    printf("GCD activated");
    return 0;
}
