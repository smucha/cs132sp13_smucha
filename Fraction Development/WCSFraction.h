//
//  WCSFraction.h
//  Fraction Development
//
//  Created by Stacey Mucha on 3/22/13.
//  Copyright (c) 2013 Wells CS132: Object Oriented Programming. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WCSFraction : NSObject

@property (readonly,assign) int numerator;

@property (readonly,assign) int denominator;

- (void)initWithNumerator:(int)
           andDenominator:(int) d ;

- (void)initWithFraction:(Fraction*) f ;

- (float)floatValue;

- (Fraction*)negative;

- (Fraction*)reciprocal;

- (Fraction*)sumWith:(Fraction*) sum;

- (Fraction*)subtractFrom:(Fraction*) subtract;

- (Fraction*)minus:(Fraction*) m;

- (Fraction*)multiplyBy:(Fraction*) multiply;

- (Fraction*)divideBy:(Fraction*) divide;

- (Fraction*)divideInto:(Fraction*) into;

- (Fraction*)reduced:(Fraction*) commonDenominator;

- (Fraction*)add:(Fraction*) thingToAdd;

- (Fraction*)multiply:(Fraction*) thingtoMultiply;

-(NSComparisonResult) compareToFraction:(WCSFraction*) otherFraction;

- (BOOL)isEqual:(id)other;

-(NSUInteger) hash;

@end

int gcd(int a, int b);




