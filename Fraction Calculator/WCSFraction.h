//
//  WCSFraction.h
//  Fraction Development
//
//  Created by Stacey Mucha on 3/22/13.
//  Copyright (c) 2013 Wells CS132: Object Oriented Programming. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WCSFraction : NSObject <NSCopying>

@property (readonly,assign) int numerator;

@property (readonly,assign) int denominator;

- (id)initWithNumerator:(int) RHS
         andDenominator:(int) LHS ;

- (id)initWithFraction:(WCSFraction*) fraction;

-(id)initWithInteger:(int) integer;

- (float)floatValue;

- (WCSFraction*)negative;

- (WCSFraction*)reciprocal;

- (WCSFraction*)sumWith:(WCSFraction*) ThingToSumWith;

- (WCSFraction*)subtractFrom:(WCSFraction*) thingToSubtractFrom;

- (WCSFraction*)minus:(WCSFraction*) thingToMinus;

- (WCSFraction*)multiplyBy:(WCSFraction*) thingToMultiply;

- (WCSFraction*)divideBy:(WCSFraction*) divisor;

- (WCSFraction*)divideInto:(WCSFraction*) thingOnTop;

- (WCSFraction*)reduced:(WCSFraction*) commonDenominator;

- (WCSFraction*)add:(WCSFraction*) thingToAdd;

- (WCSFraction*)multiply:(WCSFraction*) thingtoMultiply;

-(NSComparisonResult) compareToFraction:(WCSFraction*) otherFraction;

- (BOOL)isEqual:(id)other;

-(NSUInteger) hash;

@end

int gcd(int a, int b);




