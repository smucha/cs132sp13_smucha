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
    return [self minus:[subtract negative]];
}

- (Fraction*)minus:(Fraction*) thingToSubtract
{
    return [self add:[thingToSubtract negative]];
}

- (Fraction*)multiplyBy:(Fraction*) multiply
{
    printf("multiply by method ran");
    return nil;
}

- (Fraction*)divideBy:(Fraction*) divisor
{
    return [self multiply:[divisor reciprocal]];
}

- (Fraction*)divideInto:(Fraction*) thingOnTop
{
    return [thingOnTop multiply:[self reciprocal]];
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

(Fraction*)add:(Fraction*) thingToAdd
{
    Fraction* theAnswer = nil;
	int a = [self numerator]; //this is "a"
	int b = [self denominator]; //this is "b
	int c = [RHS numerator]; //this is "c"
	int d = [RHS denominator]; //this is "d'
	int newNumerator = a*d+b*c; //or whatever formula
	int newDenominator = d*b; //or whatever formula
	theAnswer = [[Fraction alloc] initWithNumerator:newNumerator
                                     andDenominator:newDenominator];
	return theAnswer;
}

- (Fraction*)multiply:(Fraction*) thingtoMultiply
{
    Fraction* theAnswer = nil;
	int a = [self numerator]; //this is "a"
	int b = [self denominator]; //this is "b
	int c = [RHS numerator]; //this is "c"
	int d = [RHS denominator]; //this is "d'
	int newNumerator = a*c; //or whatever formula
	int newDenominator = d*b; //or whatever formula
	theAnswer = [[Fraction alloc] initWithNumerator:newNumerator
                                     andDenominator:newDenominator];
	return theAnswer;
}

@end

int GCD(int x, int y)
{
    printf("GCD activated");
    return 0;
}
