//
//  WCSFraction.m
//  Fraction Development
//
//  Created by Stacey Mucha on 3/22/13.
//  Copyright (c) 2013 Wells CS132: Object Oriented Programming. All rights reserved.
//

#import "WCSFraction.h"

@implementation WCSFraction

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

-(NSComparisonResult) compareToFraction:(WCSFraction*) otherFraction
{
    //Common math trick:
    //   Do not compare two things directly :   a  vs b
    //   Do ompare their difference to zero :  a-b vs 0
    //   It is often easiest to determine whether
    //    a value is postive, negative, or zero
    
    int difference = [[self minus: otherFraction] numerator];
    
    if(difference > 0) return NSOrderedDescending; // self > other
    if(difference < 0) return NSOrderedAscending; // self < other
    if(difference == 0) return NSOrderedSame; //self == other
    
    return NSOrderedSame; //This line should never execute
    
}

- (BOOL)isEqual:(id)other
{
    if (other == self)
        return YES; //That's ME!
    if (!other)
        return NO; //There's no "that" to compare to
    if(![other isKindOfClass:[WCSFraction class]])
        return NO; //Meh, it's not a fraction. Apples'n'oranges.
    
    return [self compareToFraction:other]==NSOrderedSame; //Comparing Fractions
}

-(NSUInteger) hash
{ //This has to do with how these could be stored in sets and dictionaries
    return MAX([self numerator], [self denominator]);
} //Wait until CS222 (Data Structures) to ask about this one



@end

int gcd(int a, int b)
{
    //Euclidean algorithm. It works!
    if(b==0) return a;
    else return gcd(b, a%b);
}




