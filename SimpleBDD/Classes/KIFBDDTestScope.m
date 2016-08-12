//
//  KIFBDDTestScope.m
//  SimpleBDD
//
//  Created by Przemysław Wośko on 28/07/16.
//  Copyright © 2016 Azimo Ltd. All rights reserved.
//

#import "KIFBDDTestScope.h"
#import "KIFBDDScenarioCoordinator.h"

@interface KIFBDDTestScope()

@property (nonatomic, strong) NSString *stepTypeName;
@property (copy) KIFBDDTestStep block;

@end

@implementation KIFBDDTestScope

- (instancetype)initWithScenario:(KIFBDDScenario *)scenario {
    self = [super init];
    if (self) {
        _scenario = scenario;
    }
    return self;
}

+ (instancetype)stepWithDelegate:(id<KIFTestActorDelegate>)delegate scenario:(KIFBDDScenario *)scenario {
    return [[self alloc] initWithScenario:scenario];
}

- (void)BDDGiven:(NSString *)name step:(KIFBDDTestStep)testStep {
    self.stepTypeName = @"Given";
    [self executeStepWithName:name step:testStep type:self.stepTypeName];
}

- (void)BDDWhen:(NSString *)name step:(KIFBDDTestStep)testStep {
    self.stepTypeName = @"When";
    [self executeStepWithName:name step:testStep type:self.stepTypeName];
}

- (void)BDDAnd:(NSString *)name step:(KIFBDDTestStep)testStep {
    self.stepTypeName = @"And";
    [self executeStepWithName:name step:testStep type:self.stepTypeName];
}

- (void)BDDThen:(NSString *)name step:(KIFBDDTestStep)testStep {
    self.stepTypeName = @"Then";
    [self executeStepWithName:name step:testStep type:self.stepTypeName];
}

#pragma mark - private

- (void)executeStepWithName:(NSString *)name step:(KIFBDDTestStep)testStep type:(NSString *)type {
    if ([[KIFBDDScenarioCoordinator sharedCoordintator] shouldExecuteTestStep]) {
        self.block = testStep;
        self.block();
    }
    [[KIFBDDScenarioCoordinator sharedCoordintator] recordStep:[[KIFBDDTestStepDescription alloc] initWithName:name type:type failed:![[KIFBDDScenarioCoordinator sharedCoordintator] shouldExecuteTestStep]]];
}

@end
