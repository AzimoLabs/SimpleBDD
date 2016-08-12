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

@property (strong) NSString *currentScenario;
@property (strong) NSMutableArray<KIFBDDTestStepDescription *> *steps;

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
    return self.currentScenario.length > 0;
}

- (void)addScenarioName:(NSString *)scenario {
    self.currentScenario = scenario;
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

- (BOOL)shouldExecuteTestStep {
    return !self.isScenarioFailed;
}

- (NSString *)scenarioDescription {
    NSString *result = @" ";
    NSString *overallScenario =  [NSString stringWithFormat:@"  Executed scenario: %@  %@  \n", self.currentScenario, self.isScenarioFailed? @" HAS FAILED!": @" PASSED!"];
    result = [result stringByAppendingString:overallScenario];
    for (KIFBDDTestStepDescription *step in self.steps) {
      result = [result stringByAppendingString:[step description]];
    }
    
    return result;
}

- (void)clear {
    [self.steps removeAllObjects];
    self.isScenarioFailed = NO;
    self.currentScenario = nil;
    [self.exceptios removeAllObjects];
}


@end
