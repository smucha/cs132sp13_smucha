//
//  Fraction Calculator - Fraction Calculator Test.m
//  Copyright 2013 Stacey Mucha. All rights reserved.
//
//  Created by: Stacey Mucha
//

    // Class under test
#import "Fraction Calculator.h"
#import "WCSFraction.h"
#import "WCSMutableFraction.h"

    // Collaborators

    // Test support
#import <SenTestingKit/SenTestingKit.h>

// Uncomment the next two lines to use OCHamcrest for test assertions:
#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>

// Uncomment the next two lines to use OCMockito for mock objects:
#define MOCKITO_SHORTHAND
#import <OCMockito/OCMockito.h>


@interface Fraction_Calculator_Test : SenTestCase
@end

@implementation Fraction_Calculator_Test
{
    Fraction_Calculator* sut;
}

- (void)setUp
{
    [super setUp];
    sut = [[Fraction_Calculator alloc] init];
    
}



- (void)testCreateCalculator
{
    assertThat(sut, isNot(nil));
}

-(void)pressKeys:(NSString*) keystring
{
    for(NSUInteger i=0; i<[keystring length]; i=i+1)
    {
        [sut pressKey:[keystring characterAtIndex:i]];
    }
}

//Test input to numerator
//Input: 9
//Testable result: Check that NOS is 9/1 (9)
-(void)testInputIsInNumerator
{
    [self pressKeys:@"9"];
 	WCSFraction* inputNumerator =[[WCSFraction alloc]initWithNumerator:9 andDenominator:1];
    assertThat([sut numberOnScreen], is(equalTo(inputNumerator)));
}

//Test multidigit input to numerator
//Input: 123
//Testable result: Check that NOS is 123
-(void)testMultiDigitInputToNumerator
{
	[self pressKeys:@"123"];
	WCSFraction* inputMultiDigitNumerator =[[WCSFraction alloc]initWithNumerator:123 andDenominator:1];
    assertThat([sut numberOnScreen], is(equalTo(inputMultiDigitNumerator)));
}

//Test ???
//Input: %5
//Testable result: NOS is 0
-(void)testThatZeroOverSomeNumberIsZero
{
	[self pressKeys:@"%5"];
    WCSFraction* zeroDividedByFive =[[WCSFraction alloc]initWithNumerator:0 andDenominator:5];
    assertThat([sut numberOnScreen], is(equalTo(zeroDividedByFive)));
}

//Test input to denominator
//Test input after swap goes to denominator
//Input: 1%5
//Testable result: NOS is 1/15
-(void)testThatInputChangesToDenominator
{
    [self pressKeys:@"1%5"];
    WCSFraction* inputChangesToDenominator =[[WCSFraction alloc]initWithNumerator:1 andDenominator:15];
    assertThat([sut numberOnScreen], is(equalTo(inputChangesToDenominator)));
}
//Test initial input goes to numerator
//Input: 15
//Testable result: NOS is 15
-(void)testThatInitalInputIsInNumerator
{
    [self pressKeys:@"15"];
    WCSFraction* initialInputNumerator =[[WCSFraction alloc]initWithNumerator:15 andDenominator:1];
    assertThat([sut numberOnScreen], is(equalTo(initialInputNumerator)));
}


//Test input after second swap returns to numerator
//Input: 1%5%2
//Testable result: NOS is 4/5
-(void)testThatInputAfterSecondSwapReturnsToNumerator
{
    [self pressKeys:@"1%5%2"];
    WCSFraction* inputAfterSecondSwapReturnsToNumerator =[[WCSFraction alloc]initWithNumerator:4 andDenominator:5];
    assertThat([sut numberOnScreen], is(equalTo(inputAfterSecondSwapReturnsToNumerator)));
}

//Test input after doubleswap stays on numerator
//Input: 1%%2
//Testable result: NOS is 12
-(void)testThatDoubleSwapInARowStaysOnNumerator
{
    [self pressKeys:@"1%%2"];
    WCSFraction* doubleSwapInARowStaysNumerator =[[WCSFraction alloc]initWithNumerator:12 andDenominator:1];
    assertThat([sut numberOnScreen], is(equalTo(doubleSwapInARowStaysNumerator)));
}

//Test pushing BS deletes in numerator mode
//Input: 12<
//Testable result: NOS is 1
-(void)testThatPushingBackspaceDeletesNumerator
{
    [self pressKeys:@"12<"];
    WCSFraction* pushingBackspaceDeletesNumerator =[[WCSFraction alloc]initWithNumerator:1 andDenominator:1];
    assertThat([sut numberOnScreen], is(equalTo(pushingBackspaceDeletesNumerator)));
}

//Test pushing BS deletes in denominator mode
//Input: %<
//Testable result: NOS is in error state (aka 1/0)
-(void)testPushingBackspaceDeletesInDenominatorForError
{
    [self pressKeys:@"%<"];
    WCSFraction* pushingBackspaceIndenominatorResultsInError =[[WCSFraction alloc]initWithNumerator:12 andDenominator:1];
    assertThat([sut numberOnScreen], is(equalTo(pushingBackspaceIndenominatorResultsInError)));
}

//Test pushing BS deletes in denominator mode
//Input: 3%104<
//Testable result: NOS is in error state (aka 1/36)
-(void)testPushingBackSpaceDeletesInDenominator
{
    [self pressKeys:@"3%104<"];
    WCSFraction* pushingBackspaceDeletesDenominator =[[WCSFraction alloc]initWithNumerator:3 andDenominator:110];
    assertThat([sut numberOnScreen], is(equalTo(pushingBackspaceDeletesDenominator)));
}

//Test BS with no value doesn't add value
//Input: 1234<<
//Testable result: NOS is 12
-(void)testBackspaceWithNoValueDoesNotAddValue
{
    [self pressKeys:@"1234<<"];
    WCSFraction* backspaceWithNoValueDoesNotAddValue = [[WCSFraction alloc]initWithNumerator:12 andDenominator:1];
    assertThat([sut numberOnScreen], is(equalTo(backspaceWithNoValueDoesNotAddValue)));
}
//Test BS with no value doesn't add value
//Input: 1<<
//Testable result: NOS is zero
-(void)testBackspaceWithNoValueDoesNotDoAnything
{
    [self pressKeys:@"1<<"];
    WCSFraction* backspaceWithNoValueDoesNotDoAnything = [[WCSFraction alloc]initWithNumerator:0 andDenominator:1];
    assertThat([sut numberOnScreen], is(equalTo(backspaceWithNoValueDoesNotDoAnything)));
}
//Test effect of deleting entire denominator
//Input: 5%<
//Result: NOS is in error mode (1/0)
-(void)testEffectOfDeletingEntireDenominator
{
    [self pressKeys:@"5%<"];
    WCSFraction* effectOfDeletingEntireDenominator = [[WCSFraction alloc]initWithNumerator:1 andDenominator:0];
    assertThat([sut numberOnScreen], is(equalTo(effectOfDeletingEntireDenominator)));
}

//Test sequence of operations without digit input
//Input: 15+-+
//Testable result: Test Number ACCUMULATED is 15
-(void)testSequenceOfOperationsWithoutDigitInput
{
    [self pressKeys:@"15+-+"];
    WCSFraction* sequenceOfOperationsWithoutDigitInput = [[WCSFraction alloc]init];
    assertThat([sut numberAccumulated], is(equalTo(sequenceOfOperationsWithoutDigitInput)));
}

- (void)tearDown
{
    sut= nil;
    [super tearDown];
}


@end
