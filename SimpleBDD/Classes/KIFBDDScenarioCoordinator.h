//
//  KIFBDDScenarioCoordinator.h
//  SimpleBDD
//
//  Created by Przemysław Wośko on 28/07/16.
//  Copyright © 2016 Azimo Ltd. All rights reserved.
//

#import "KIFBDDTestScope.h"
@class KIFBDDScenario;
#import "KIFBDDTestStepDescription.h"


typedef void (^KIFBDDTestStep)();

@interface KIFBDDScenarioCoordinator : NSObject

@property (nonatomic, assign) BOOL isScenarioFailed;
@property (nonatomic, strong) NSMutableArray<NSException *> *exceptios;
@property (nonatomic, assign) BOOL afterEachInvoked;
@property (nonatomic, strong) KIFBDDScenario *currentExecutedScenario;
@property (nonatomic, strong, readonly) NSMutableArray<KIFBDDTestStepDescription *> *steps;

+ (instancetype)sharedCoordintator;

- (BOOL)isBDDTestCase;

- (void)recordStep:(KIFBDDTestStepDescription *)stepDescription;

- (void)markAsFailed;

- (BOOL)shouldExecuteTestStep;

- (void)failedWithExceptions:(NSArray *)exceptions;

- (NSString *)scenarioDescription;

- (void)clear;

- (void)executreStepScope:(KIFBDDTestScope *)testScope;

@end
