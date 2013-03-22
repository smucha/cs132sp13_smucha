///**
// @file TestMutableFraction.m
// @brief Part of Fraction Development
// @author Bryant Adams
// @date 3/19/13
// @copyright GNU Public License v3 or later, 2013
// @version 0.1
//*/
//
//    // Class under test
//#import "WCSMutableFraction.h"
//
//    // Collaborators
//
//    // Test support
//#import <SenTestingKit/SenTestingKit.h>
//
//// Comment the next two lines to disable OCHamcrest (for test assertions)
//#define HC_SHORTHAND
//#import <OCHamcrest/OCHamcrest.h>
//
//// Comment the next two lines to disable OCMockito (for mock objects)
//#define MOCKITO_SHORTHAND
//#import <OCMockito/OCMockito.h>
//
///**
// @brief For testing Mutable Fractions
// */
//@interface TestMutableFraction : SenTestCase
//@end
//
//@implementation TestMutableFraction
//{
//    WCSMutableFraction* sut;
//    WCSFraction* frac_one;
//    WCSFraction* frac_zero;
//    WCSFraction* frac_two;
//}
//
//- (void)setUp
//{
//    [super setUp];
//    sut = [[WCSMutableFraction alloc] init];
//    frac_two = [[WCSFraction alloc] initWithInteger:2];
//    frac_one = [[WCSFraction alloc] initWithInteger:1];
//    frac_zero = [[WCSFraction alloc] initWithInteger:0];
//
//}
//
//- (void)tearDown
//{
//    sut=nil;
//    frac_zero = nil;
//    frac_one = nil;
//    frac_two = nil;
//    [super tearDown];
//}
//
//- (void)testSettingValuesSetsValues
//{
//    // given
//    WCSFraction* result = [[WCSFraction alloc] initWithNumerator:2 andDenominator:3];
//    
//    // when
//    [sut setNumerator:2 andDenominator:3];
//    
//    // then
//    assertThat(sut, is(equalTo(result)));
//}
//
//- (void)testSettingValuesSetsReducedValues
//{
//    // given
//    WCSFraction* result = [[WCSFraction alloc] initWithNumerator:2 andDenominator:3];
//    
//    // when
//    [sut setNumerator:4 andDenominator:6];
//    
//    // then
//    assertThat(sut, is(equalTo(result)));
//}
//
//- (void)testSettingValuesSetsNegOnTop
//{
//    // given
//    WCSFraction* result = [[WCSFraction alloc] initWithNumerator:-2 andDenominator:3];
//    
//    // when
//    [sut setNumerator:2 andDenominator:-3];
//    
//    // then
//    assertThat(sut, is(equalTo(result)));
//}
//
//- (void)testSettingDoubleNegValuesSetsPosValues
//{
//    // given
//    WCSFraction* result = [[WCSFraction alloc] initWithNumerator:2 andDenominator:3];
//    
//    // when
//    [sut setNumerator:-2 andDenominator:-3];
//    
//    // then
//    assertThat(sut, is(equalTo(result)));
//}
//
//-(void)testThatAddingIncreasesValue
//{
//    //given
//    [sut setNumerator:1 andDenominator:1];
//    assertThat(sut, is(equalTo(frac_one)));
//    //when
//    [sut modifyByAdding:frac_one];
//    //then
//    assertThat(sut, is(equalTo(frac_two)));
//}
//
//-(void)testThatMultiplyingAltersValue
//{
//    //given
//    [sut setNumerator:2 andDenominator:1];
//    assertThat(sut, is(equalTo(frac_two)));
//    //when
//    [sut modifyByMultiplying:frac_two];
//    //then
//    assertThat(sut, is(equalTo([frac_two multiplyBy:frac_two])));
//}
//
//-(void)testThatInvertingAltersValue
//{
//    //given
//    [sut setNumerator:1 andDenominator:2];
//    assertThat(sut, isNot(equalTo(frac_two)));
//    //when
//    [sut modifyByInverting];
//    //then
//    assertThat(sut, is(equalTo(frac_two)));
//}
//
//-(void)testThatNegatingAltersValue
//{
//    //given
//    [sut setNumerator:-2 andDenominator:1];
//    assertThat(sut, isNot(equalTo(frac_two)));
//    //when
//    [sut modifyByNegating];
//    //then
//    assertThat(sut, is(equalTo(frac_two)));
//}
//@end
