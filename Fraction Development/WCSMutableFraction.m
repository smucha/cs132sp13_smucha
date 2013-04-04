//
//  WCSMutableFraction.m
//  Fraction Development
//
//  Created by Stacey Mucha on 3/27/13.
//  Copyright (c) 2013 Wells CS132: Object Oriented Programming. All rights reserved.
//

#import "WCSMutableFraction.h"

#import "WCSFraction.h"

@implementation WCSMutableFraction

@synthesize numerator = _AOII_numerator;

@synthesize denominator = _AOII_denominator;

-(id)mutableCopyWithZone:(NSZone *)zone
{
    //stub
    return 0;
}

-(void)setNumerator:(int) top
     andDenominator:(int) bottom
{
    int GCD = gcd(top, bottom);
    [self setNumerator:top/GCD];
    [self setDenominator:bottom/GCD];
    
}

-(void)modifyByAdding:(WCSFraction*) additive
{
    WCSFraction* theAnswer = [self add:additive];
    [self setNumerator:[theAnswer numerator] andDenominator:[theAnswer denominator]];
}

-(void)modifyByMultiplying:(WCSFraction*) multiple
{
    WCSFraction* theAnswer = [self multiply:multiple];
    [self setNumerator:[theAnswer numerator] andDenominator:[theAnswer denominator]];
}
-(void)modifyByInverting
{
    WCSFraction* theAnswer = [self reciprocal];
    [self setNumerator:[theAnswer numerator] andDenominator:[theAnswer denominator]];
}
-(void)modifyByNegating
{
    WCSFraction* theAnswer = [self negative];
    [self setNumerator:[theAnswer numerator] andDenominator:[theAnswer denominator]];
}

@end
