//
//  WCSMutableFraction.h
//  Fraction Development
//
//  Created by Stacey Mucha on 3/27/13.
//  Copyright (c) 2013 Wells CS132: Object Oriented Programming. All rights reserved.
//

#import "WCSFraction.h"

@interface WCSMutableFraction : WCSFraction

@property (readwrite,assign) int numerator;

@property (readwrite,assign) int denominator;

-(void)setNumerator:(int) top
     andDenominator:(int) bottom;

-(void)modifyByAdding:(int) additive;

-(void)modifyByMultiplying:(int) multiple;

-(void)modifyByInverting;

-(void)modifyByNegating;

@end
