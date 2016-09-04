//
//  Test.m
//  SimpleBDD
//
//  Created by Przemysław Wośko on 25/08/16.
//  Copyright © 2016 Przemysław Wośko. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <SimpleBDD/SimpleBDD-umbrella.h>

#import <OCHamcrest/OCHamcrest.h>
#import <OCMockito/OCMockito.h>

@interface Test : KIFBDDTestCase

@end

@implementation Test

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testWhenEpmtyScenario {
    
    scenario(@"test execute empty scenario", self)
    
    Given(@"Empty scenario", ^{
        
    });
    
    When(@"no implemented steps", ^{
        
    });
    
    Then(@"should pass", ^{
        
    });
}

- (void)testWhenFirstStepFails {
    
    scenario(@"test case fails from KIF error in first step", self)
    
    Given(@"Step should fail in this step", ^{
        [tester failWithMessage:@"expected to fail"];
    });
    
    When(@"", ^{
        
    });
    
    Then(@"story should be collected", ^{
        
    });
    
    assertThatInteger([KIFBDDScenarioCoordinator sharedCoordintator].steps.count, is(@3));
}

- (void)testWhenViewTesterWillFail {
    scenario(@"test example empty scenario", self)
    
    Given(@"Step should fail in this step", ^{
        [viewTester failWithMessage:@"expected to fail"];
    });
    
    When(@"test case will not fail", ^{
        
    });
    
    Then(@"Kill app to get an error", ^{
        exit(0);
    });
    
}

- (void)testShouldFailForXCAssert {
    scenario(@"test should fail if XCAssert was used", self);
    
    When(@"empty block first", ^{
        
    });
    
    Given(@"this step fail", ^{
        XCTAssertNotNil(nil, @"fail");
    });
    
    Then(@"one more step should be printed as failed but not executed", ^{
        
    });
}

- (void)testTestSuiteShouldReactToMockioAssertions {
    scenario(@"mockito usage tests", self)
    
    When(@"empty block first", ^{
        
    });
    
    Given(@"assertThat usage tests", ^{
        assertThatBool(NO, isTrue());
    });
    
    When(@"step that shouldn't be executed", ^{
        exit(0);
    });
    
}


@end
