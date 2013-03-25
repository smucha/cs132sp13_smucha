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

- (void)initWithFraction:(WCSFraction*) f ;

- (float)floatValue;

- (WCSFraction*)negative;

- (WCSFraction*)reciprocal;

- (WCSFraction*)sumWith:(WCSFraction*) sum;

- (WCSFraction*)subtractFrom:(WCSFraction*) subtract;

- (WCSFraction*)minus:(WCSFraction*) m;

- (WCSFraction*)multiplyBy:(WCSFraction*) multiply;

- (WCSFraction*)divideBy:(WCSFraction*) divide;

- (WCSFraction*)divideInto:(WCSFraction*) into;

- (WCSFraction*)reduced:(WCSFraction*) commonDenominator;

- (WCSFraction*)add:(WCSFraction*) RHS;

- (WCSFraction*)multiply:(WCSFraction*) thingtoMultiply;

-(NSComparisonResult) compareToFraction:(WCSFraction*) otherFraction;

- (BOOL)isEqual:(id)other;

-(NSUInteger) hash;

@end

int gcd(int a, int b);




