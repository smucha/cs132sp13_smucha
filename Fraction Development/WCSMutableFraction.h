//
//  WCSMutableFraction.h
//  Fraction Development
//
//  Created by Stacey Mucha on 3/27/13.
//  Copyright (c) 2013 Wells CS132: Object Oriented Programming. All rights reserved.
//

#import "WCSFraction.h"
#import "NSMutableCopying.h"

@interface WCSMutableFraction : WCSFraction

@property (readwrite,assign) int numerator;

@property (readwrite,assign) int denominator;

-(void)setNumerator:(int) top
     andDenominator:(int) bottom;

-(void)modifyByAdding:(WCSFraction*) additive;

-(void)modifyByMultiplying:(WCSFraction*) multiple;

-(void)modifyByInverting;

-(void)modifyByNegating;

@end
