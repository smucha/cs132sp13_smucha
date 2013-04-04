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
    WCSFraction* oneThird;
    WCSFraction* oneHalf;
    WCSFraction* theAnswer;
    WCSFraction* ans;
    
    oneThird = [oneThird initWithNumerator:1 andDenominator:3];
    oneHalf = [oneHalf initWithNumerator:1 andDenominator:2];
    theAnswer = [oneThird minus:oneHalf];
    ans = [ans initWithNumerator:-1 andDenominator:6];
    
    if ((ans = theAnswer))
    {
        NSLog(@"YAY!");
    }
    else
    {
        NSLog(@"DANGIT!");
    }
    
    
    return NSApplicationMain(argc, (const char **)argv);
}
