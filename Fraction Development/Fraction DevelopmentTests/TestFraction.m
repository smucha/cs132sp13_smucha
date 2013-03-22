/**
 @file TestFraction.m
 @brief Part of Fraction Development
 @author Bryant Adams
 @date 3/19/13
 @copyright GNU Public License v3 or later, 2013
 @version 0.1
*/

    // Class under test
#import "WCSFraction.h"

    // Collaborators

    // Test support
#import <SenTestingKit/SenTestingKit.h>

// Comment the next two lines to disable OCHamcrest (for test assertions)
#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>

// Comment the next two lines to disable OCMockito (for mock objects)
#define MOCKITO_SHORTHAND
#import <OCMockito/OCMockito.h>

/**
 @brief For testing Immutable Fractions
 */
@interface TestFraction : SenTestCase
@end

@implementation TestFraction
{
    WCSFraction* frac_one;
    WCSFraction* frac_zero;
    WCSFraction* frac_two;
    WCSFraction* result;
    WCSFraction* target;
    WCSFraction* LHS;
    WCSFraction* RHS;
}

- (void)setUp
{
    [super setUp];
    frac_two = [[WCSFraction alloc] initWithInteger:2];
    frac_one = [[WCSFraction alloc] initWithInteger:1];
    frac_zero = [[WCSFraction alloc] initWithInteger:0];
}

- (void)tearDown
{
    frac_zero = nil;
    frac_one = nil;
    frac_two = nil;
    result = nil;
    target = nil;
    LHS = nil;
    RHS = nil;
    [super tearDown];
}

- (void)testBareFractionShouldExist
{
    // given
    result = [[WCSFraction alloc] init];
    // then
    assertThat(result, isNot(equalTo(nil)));
    
}
- (void)testBareFractionShouldBeOne
{
    // given
    result = [[WCSFraction alloc] init];
    // then
    assertThat(result, is(equalTo(frac_one)));
}
-(void)testIntCreationMatchesComponentCreation
{
    //given
    result = [[WCSFraction alloc] initWithNumerator:2 andDenominator:1];
    target = [[WCSFraction alloc] initWithInteger:2];
    // then
    assertThat(result, is(equalTo(target)));
}

-(void)testIntCreationMatchesUnreducedComponentCreation
{
    //given
    result = [[WCSFraction alloc] initWithNumerator:4 andDenominator:2];
    target = [[WCSFraction alloc] initWithInteger:2];
    // then
    assertThat(result, is(equalTo(target)));
}

-(void)testFractionCreationMatchesComponentCreation
{
    //given
    result = [[WCSFraction alloc] initWithNumerator:2 andDenominator:1];
    target = [[WCSFraction alloc] initWithFraction:frac_two];
    // then
    assertThat(result, is(equalTo(target)));
}



- (void)testOnePlusOneEqualsTwo
{
    // given
    result = [frac_one addTo:frac_one];
    // then
    assertThat(result, is(equalTo(frac_two)));
}

- (void)testOnePlusZeroEqualsOne
{
    // given
    result = [frac_one addTo:frac_zero];
    // then
    assertThat(result, is(equalTo(frac_one)));
}

- (void)testOneTimesZeroEqualsZero
{
    // given
    result = [frac_one multiplyBy:frac_zero];
    // then
    assertThat(result, is(equalTo(frac_zero)));
}

- (void)testAdditionLeavesSummandsUnaltered
{
    // given
    result = [frac_one multiplyBy:frac_zero];
    // then
    assertThat(frac_one, isNot(equalTo(frac_zero)));
}

-(void)testReciprocalOfOneHalfIsTwo
{
    //given
    target = [[WCSFraction alloc] initWithNumerator:1 andDenominator:2];
    target = [target reciprocal];
    // then
    assertThat(target, is(equalTo(frac_two)));
}

-(void)testNegativeOfNegOneIsOne
{
    //given
    target = [[WCSFraction alloc] initWithNumerator:-1 andDenominator:1];
    target = [target negative];
    // then
    assertThat(target, is(equalTo(frac_one)));
}

-(void)testNegativeOfOneOverNegOneIsOne
{
    //given
    target = [[WCSFraction alloc] initWithNumerator:1 andDenominator:-1];
    target = [target negative];
    // then
    assertThat(target, is(equalTo(frac_one)));
}

-(void)testFractionMinusSelfIsZero
{
    //given
    result = [frac_two minus:frac_two];
    // then
    assertThat(result, is(equalTo(frac_zero)));
}

-(void)testSubtractionIsAntiCommutative
{
    //given
    LHS = [[WCSFraction alloc] initWithNumerator:2 andDenominator:7];
    RHS = [[WCSFraction alloc] initWithNumerator:3 andDenominator:5];
    target = [[LHS minus:RHS] negative];
    result = [LHS subtractFrom:RHS];
    // then
    assertThat(result, is(equalTo(target)));
    
}

-(void)testDivisionIsAntiCommutative
{
    //given
    LHS = [[WCSFraction alloc] initWithNumerator:2 andDenominator:7];
    RHS = [[WCSFraction alloc] initWithNumerator:3 andDenominator:5];
    target = [[LHS divideBy:RHS] reciprocal];
    result = [LHS divideInto:RHS];
    // then
    assertThat(result, is(equalTo(target)));
}

-(void)testNegationIsOrderTwo
{
    //given
    result = [[frac_two negative] negative];
    // then
    assertThat(result, is(equalTo(frac_two)));
}

-(void)testInversionIsOrderTwo
{
    //given
    result = [[frac_two reciprocal] reciprocal];
    // then
    assertThat(result, is(equalTo(frac_two)));
}

-(void)testInversionAndNegationCommute
{
    //given
    result = [[frac_two reciprocal] negative];
    target = [[frac_two negative] reciprocal];
    // then
    assertThat(result, is(equalTo(target)));
}

-(void)testDescriptionOfZeroIsZero
{
    assertThat([frac_zero description], is(@"0"));
}

-(void)testDescriptionOfWeirdOneIsStillOne
{
    target = [[WCSFraction alloc] initWithNumerator:42 andDenominator:42];
    assertThat([target description], is(@"1"));
}

-(void)testDescriptionOfFractionIsFractional
{
    target = [frac_two reciprocal];
    assertThat([target description], is(@"1/2"));
}

-(void)testDescriptionOfIntegerIsIntegral
{
    target = [[WCSFraction alloc] initWithNumerator:3 andDenominator:1];
    assertThat([target description], is(@"3"));
}

-(void)testDescriptionOfFractionIsReduced
{
    target = [[WCSFraction alloc] initWithNumerator:14 andDenominator:21];
    assertThat([target description], is(@"2/3"));
    
}
-(void)testDescriptionErrorDoesNotLookFractional
{
    target = [[WCSFraction alloc] initWithNumerator:9 andDenominator:0];
    assertThat([target description], isNot(containsString(@"/")));
}

@end
