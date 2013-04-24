//
//  WCSFraction.m
//  Fraction Development
//
//  Created by Stacey Mucha on 3/22/13.
//  Copyright (c) 2013 Wells CS132: Object Oriented Programming. All rights reserved.
//

#import "WCSFraction.h"

@implementation WCSFraction

@synthesize numerator = DNUOutsideInit_numerator;

@synthesize denominator = DNUOutsideInit_denominator;


- (id)copyWithZone:(NSZone *)zone
{
    WCSFraction* someFraction = nil;
    someFraction = [[WCSFraction allocWithZone:zone] initWithFraction:self];
    return 0;
}

- (id)init
{
    return [self initWithNumerator:1 andDenominator:1];
}

- (id)description
{
    if([self denominator] == 1)
    {
        return [NSString stringWithFormat: @"%d" , [self numerator]];
    }
    else
    
        if([self denominator] == 0)
        {
            return [NSString stringWithFormat: @"ERROR" ];
        }
        else
        {
            return [NSString stringWithFormat:@"%d/%d", [self numerator], [self denominator]];
        }
}

- (id)initWithNumerator:(int) RHS
         andDenominator:(int) LHS
{
    int a = RHS;
    int b = LHS;
    int newRHS = a / gcd(a , b);
    int newLHS = b / gcd(a , b);
    
    if (newLHS<0)
    {
        newLHS = newLHS*-1;
        newRHS = newRHS*-1;
    }
    
    
    
    self = [super init];
    if (self) {
        DNUOutsideInit_numerator = newRHS;
        DNUOutsideInit_denominator = newLHS;
    }
    return self;
}


- (id)initWithFraction:(WCSFraction*) theFraction
{
    return [self initWithNumerator:[theFraction numerator]
                    andDenominator:[theFraction denominator]];
}

-(id)initWithInteger:(int) theInteger
{
    return [self initWithNumerator:theInteger andDenominator:1];
}

- (float)floatValue
{
    printf("floatValue ran");
    return 0;
}

- (WCSFraction*)negative
{
    WCSFraction* theAnswer = nil;
	int a = [self numerator]; //this is "a"
	int b = [self denominator]; //this is "b"
	int newNumerator = -a; //or whatever formula
	int newDenominator = b; //or whatever formula
	theAnswer = [[WCSFraction alloc] initWithNumerator:newNumerator
                                        andDenominator:newDenominator];
    return theAnswer;
}

- (WCSFraction*)reciprocal
{
   WCSFraction* theAnswer = nil;
	int a = [self numerator]; //this is "a"
	int b = [self denominator]; //this is "b"
	int newNumerator = b; //or whatever formula
	int newDenominator = a; //or whatever formula
	theAnswer = [[WCSFraction alloc] initWithNumerator:newNumerator
                                        andDenominator:newDenominator];
    return theAnswer;
}

- (WCSFraction*)sumWith:(WCSFraction*) ThingToSumWith
{
    return [ThingToSumWith add:self];
}

- (WCSFraction*)subtractFrom:(WCSFraction*) thingToSubtractFrom
{
    return [thingToSubtractFrom minus:self];
}

- (WCSFraction*)minus:(WCSFraction*) thingToMinus
{
    return [self add:[thingToMinus negative]];
}

- (WCSFraction*)multiplyBy:(WCSFraction*) thingToMultiply
{
    return [thingToMultiply multiply:self];
}

- (WCSFraction*)divideBy:(WCSFraction*) divisor
{
    return [self multiply:[divisor reciprocal]];
}

- (WCSFraction*)divideInto:(WCSFraction*) thingOnTop
{
    return [thingOnTop multiply:[self reciprocal]];
}

- (WCSFraction*)reduced:(WCSFraction*) commonDenominator
{
    int x = [self numerator];
	int y = [self denominator];
	int d = gcd(x,y);
	int newNumerator = x/d;
	int newDenominator = y/d;
	WCSFraction* theAnswer = [[WCSFraction alloc] initWithNumerator:newNumerator
           andDenominator:newDenominator];
	return theAnswer;
}

- (WCSFraction*)add:(WCSFraction *)thingToAdd
{
    WCSFraction* theAnswer = nil;
	int a = [self numerator]; //this is "a"
	int b = [self denominator]; //this is "b
	int c = [thingToAdd numerator]; //this is "c"
	int d = [thingToAdd denominator]; //this is "d'
	int newNumerator = a*d+b*c; //or whatever formula
	int newDenominator = d*b; //or whatever formula
	theAnswer = [[WCSFraction alloc] initWithNumerator:newNumerator
                                        andDenominator:newDenominator];
	return theAnswer;
}

- (WCSFraction*)multiply:(WCSFraction*) thingtoMultiply
{
    WCSFraction* theAnswer = nil;
	int a = [self numerator]; //this is "a"
	int b = [self denominator]; //this is "b
	int c = [thingtoMultiply numerator]; //this is "c"
	int d = [thingtoMultiply denominator]; //this is "d'
	int newNumerator = a*c; //or whatever formula
	int newDenominator = d*b; //or whatever formula
	theAnswer = [[WCSFraction alloc] initWithNumerator:newNumerator
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




