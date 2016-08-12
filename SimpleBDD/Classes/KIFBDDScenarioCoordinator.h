//
//  KIFBDDScenarioCoordinator.h
//  SimpleBDD
//
//  Created by Przemysław Wośko on 28/07/16.
//  Copyright © 2016 Azimo Ltd. All rights reserved.
//

@import Foundation.NSObject;
@class KIFBDDScenario;
#import "KIFBDDTestStepDescription.h"

@interface KIFBDDScenarioCoordinator : NSObject

@property (nonatomic, assign) BOOL isScenarioFailed;
@property (strong) NSMutableArray<NSException *> *exceptios;
@property (nonatomic, assign) BOOL afterEachInvoked;

@property (nonatomic, strong) KIFBDDScenario *currentExecutedScenario;


+ (instancetype)sharedCoordintator;

- (BOOL)isBDDTestCase;

- (void)addScenarioName:(NSString *)scenario;

- (void)recordStep:(KIFBDDTestStepDescription *)stepDescription;

- (void)markAsFailed;

- (BOOL)shouldExecuteTestStep;

- (void)failedWithExceptions:(NSArray *)exceptions;

- (NSString *)scenarioDescription;

- (void)clear;

@end
