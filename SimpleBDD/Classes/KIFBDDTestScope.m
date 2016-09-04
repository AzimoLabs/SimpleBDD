//
//  KIFBDDTestScope.m
//  SimpleBDD
//
//  Created by Przemysław Wośko on 28/07/16.
//  Copyright © 2016 Azimo Ltd. All rights reserved.
//

#import "KIFBDDTestScope.h"

@interface KIFBDDTestScope()

@end

@implementation KIFBDDTestScope

- (instancetype)initWithName:(NSString *)name step:(KIFBDDTestStep)testStep {
    self = [super init];
    if (self) {
        _stepName = name;
        _testStep = testStep;
    }
    return self;
}

- (instancetype)initBDDGiven:(NSString *)name step:(KIFBDDTestStep)testStep {
    self = [self initWithName:name step:testStep];
    if (self) {
        _stepTypeName = @"Given";
    }
    return self;
}

- (instancetype)initBDDWhen:(NSString *)name step:(KIFBDDTestStep)testStep {
    self = [self initWithName:name step:testStep];
    if (self) {
        _stepTypeName = @"When";
    }
    return self;
}

- (instancetype)initBDDAnd:(NSString *)name step:(KIFBDDTestStep)testStep {
    self = [self initWithName:name step:testStep];
    if (self) {
        _stepTypeName = @"And";
    }
    return self;
}

- (instancetype)initBDDThen:(NSString *)name step:(KIFBDDTestStep)testStep {
    self = [self initWithName:name step:testStep];
    if (self) {
        _stepTypeName = @"Then";
    }
    return self;
}

@end
