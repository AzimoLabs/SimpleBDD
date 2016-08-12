//
//  SimpleBDDTests.m
//  SimpleBDDTests
//
//  Created by Przemysław Wośko on 08/10/2016.
//  Copyright (c) 2016 Przemysław Wośko. All rights reserved.
//

#import "KIFBDDTestCase.h"
#import "KIFTestActor+BDDTestScope.h"
#import "KIFBDDTestScope.h"

@interface Tests : KIFBDDTestCase

@end

@implementation Tests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample
{
    scenario(@"some scenario", self)
    
    
}

@end

