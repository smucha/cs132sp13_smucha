//
//  main.m
//  Fraction Development
//
//  Created by Bryant Adams on 3/19/13.
//  Copyright (c) 2013 Wells CS132: Object Oriented Programming. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "WCSFraction.h"
#import "WCSMutableFraction.h"

int main(int argc, char *argv[])
{
    WCSFraction* oneThird = [WCSFraction alloc];
    WCSFraction* oneHalf = [WCSFraction alloc];
    WCSFraction* theAnswer = [WCSFraction alloc];
    WCSFraction* ans = [WCSFraction alloc];
    
    oneThird = [oneThird initWithNumerator:1 andDenominator:3];
    oneHalf = [oneHalf initWithNumerator:1 andDenominator:2];
    theAnswer = [oneThird minus:oneHalf];
    ans = [ans initWithNumerator:-1 andDenominator:6];
    
    
    NSLog(@"%@ - %@ = %@", oneThird, oneHalf, theAnswer);
    
    
    
    WCSMutableFraction* theMutant = [WCSMutableFraction alloc];
    WCSFraction* oneEigth = [WCSFraction alloc];
    WCSMutableFraction* two = [WCSMutableFraction alloc];
    WCSMutableFraction* theResult = [WCSMutableFraction alloc];
    
    [theMutant setNumerator:5 andDenominator:8];
    oneEigth = [oneEigth initWithNumerator:1 andDenominator:8];
    [two setNumerator:4 andDenominator:2];
    [theMutant modifyByAdding:[oneEigth negative]];
    [theMutant modifyByAdding:two];
    
    NSLog(@"5/8 - %@ + %@ = %@", oneEigth, two, theResult);
    
    return NSApplicationMain(argc, (const char **)argv);
}
