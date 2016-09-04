//
//  KIFBDDScenarioCoordinator.m
//  SimpleBDD
//
//  Created by Przemysław Wośko on 28/07/16.
//  Copyright © 2016 Azimo Ltd. All rights reserved.
//

#import "KIFBDDScenarioCoordinator.h"
#import "KIFBDDTestStepDescription.h"
#import "KIFBDDScenario.h"

@interface KIFBDDScenarioCoordinator()

@property (nonatomic, strong, readwrite) NSMutableArray<KIFBDDTestStepDescription *> *steps;

@end

@implementation KIFBDDScenarioCoordinator

+ (instancetype)sharedCoordintator {
    static dispatch_once_t onceToken;
    static KIFBDDScenarioCoordinator *sharedCoordinator = nil;
    dispatch_once(&onceToken, ^{
        sharedCoordinator = [self new];
    });
    return sharedCoordinator;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _isScenarioFailed = NO;
        _steps = [NSMutableArray array];
        _exceptios = [NSMutableArray array];
    }
    return self;
}

- (BOOL)isBDDTestCase {
    return self.currentExecutedScenario != nil;
}

- (void)recordStep:(KIFBDDTestStepDescription *)stepDescription {
    [self.steps addObject:stepDescription];
}

- (void)markAsFailed {
    self.isScenarioFailed = YES;
}

- (void)failedWithExceptions:(NSArray *)exceptions {
    if (!self.exceptios.count) {
        [self.exceptios addObjectsFromArray:exceptions];
    }
}

// TODO : refactor this
- (NSString *)scenarioDescription {
    NSString *result = @" ";
    NSString *overallScenario =  [NSString stringWithFormat:@"  Executed scenario: %@  %@  \n", self.currentExecutedScenario.scenarioName, self.isScenarioFailed? @" FAILED!": @" PASSED!"];
    result = [result stringByAppendingString:overallScenario];
    for (KIFBDDTestStepDescription *step in self.steps) {
      result = [result stringByAppendingString:[step description]];
    }
    
    return result;
}

- (void)clear {
    [self.steps removeAllObjects];
    self.isScenarioFailed = NO;
    self.currentExecutedScenario = nil;
    [self.exceptios removeAllObjects];
}

- (void)executreStepScope:(KIFBDDTestScope *)testScope {
    if (!self.isScenarioFailed) {
        @try {
            testScope.testStep();
            
        } @catch (NSException *exception) {
            [self markAsFailed];
            [self failedWithExceptions:@[exception]];
        } @finally {
           
        }
    }
    
    KIFBDDTestStepDescription *stepRecord = [[KIFBDDTestStepDescription alloc] initWithName:testScope.stepName type:testScope.stepTypeName failed:self.isScenarioFailed];
    [self recordStep:stepRecord];
}

@end
