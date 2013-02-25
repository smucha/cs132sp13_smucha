//
//  ImmutableFraction.h
//
//
//  Created by Stacey Mucha on 2/24/13.
//
//

#import <Cocoa/Cocoa.h>

@interface ImmutableFraction : NSObject

@property (readonly,assign) int numerator;

@property (readonly,assign) int denominator;

-(void)initWithNumerator:(int) andDenominator:(int) d ;

-(void)initWithFraction: (fraction*) f ;

-(float)floatValue;


@end

