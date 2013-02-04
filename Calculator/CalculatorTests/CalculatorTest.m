/**
 @file CalculatorTest.m
 @brief Part of Calculator
 @author Bryant Adams
 @date 2/1/13
 @copyright GNU Public License v3 or later, 2013
 @version <#VERSION-NUMBER#>
*/

    // Class under test
#import "Calculator.h"

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
 @brief For testing Calculator class
 */
@interface CalculatorTest : SenTestCase
@end

@implementation CalculatorTest
{
    Calculator* sut;
}

- (void)setUp
{
    [super setUp];
    sut = [[Calculator alloc] init];
}

- (void)tearDown
{
    sut = nil;
    [super tearDown];
}

- (void)testCreateCalculator
{
    assertThat(sut, isNot(nil));
}

- (void)testHasDisplayInitializedToZero
{
    assertThat(sut, hasProperty(@"numberOnScreen", equalToInt(0)));
}

- (void)testPressingFiveDisplaysFive
{
    [self pressKeys:@"5"];
    int valueShown = [sut numberOnScreen];
    assertThatInt(valueShown, is(equalToInt(5)));
}

- (void)testPressingOneFourDisplaysFourteen
{
    [self pressKeys:@"14"];
    assertThatInt([sut numberOnScreen], is(equalToInt(14)));
}

- (void)testHasAccumulatorInitializedToZero
{
    assertThat(sut, hasProperty(@"numberAccumulated", equalToInt(0)));
}

- (void)testPressingPlusClearsScreen
{
    [self pressKeys:@"9+"];
    assertThatInt([sut numberOnScreen], is(equalToInt(0)));

}
- (void)testPendingOperatorStartsAsPlus
{
    assertThat(sut, hasProperty(@"operationPending", equalToChar('+')));
}

- (void)testPressingMinusSetsOperationPendingToMinus
{
    [self pressKeys:@"8-"];
    assertThatChar([sut operationPending], equalToChar('-'));
}

- (void)testPressingPlusSetsAccumulator
{
    [self pressKeys:@"23+"];
    assertThatInt([sut numberAccumulated], is(equalToInt(23)));
}

- (void)testPressingPlusSetsOperationPendingToPlus
{
    [self pressKeys:@"6+"];
    assertThatChar([sut operationPending], is(equalToChar('+')));
}

-(void)testThirtyfourPlusSixEqualsForty
{
    [self pressKeys:@"34+6="];
    assertThatInt([sut numberOnScreen], is(equalToInt(40)));
}
-(void)testEqualsClearsAccumulator
{
    [self pressKeys:@"19+19="];
    assertThat(sut, hasProperty(@"numberAccumulated", equalToInt(0)));
}
- (void)testSubtractionWorks
{
    [self pressKeys:@"5-3="];
    assertThatInt([sut numberOnScreen], is(equalToInt(2)));
}
- (void)testMultiplicationWorks
{
    [self pressKeys:@"3*3="];
    assertThatInt([sut numberOnScreen], is(equalToInt(9)));
}
- (void)testDivisionWorks
{
    [self pressKeys:@"16/4="];
    assertThatInt([sut numberOnScreen], is(equalToInt(4)));
}
- (void)testRemainderWorks
{
    [self pressKeys:@"10%7="];
    assertThatInt([sut numberOnScreen], is(equalToInt(3)));
}

- (void)testChainedAdditionIncreasesAccumulator
{
    [self pressKeys:@"1+1+"];
    assertThatInt([sut numberAccumulated], is(equalToInt(2)));
}
- (void)testChainedAddition
{
    [self pressKeys:@"1+1+1="];
    assertThatInt([sut numberOnScreen], is(equalToInt(3)));
}
- (void)testWeirdOperatorPrecedence
{
    [self pressKeys:@"1+1*2="];
    assertThatInt([sut numberOnScreen], is(equalToInt(4)));
}
-(void)pressKeys:(NSString*) keystring
{
    for(NSUInteger i=0; i<[keystring length]; i+=1)
    {
        [sut pressKey:[keystring characterAtIndex:i]];
    }
}

@end
