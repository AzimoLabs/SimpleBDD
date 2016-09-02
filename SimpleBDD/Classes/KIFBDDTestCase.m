//
//  KIFBDDTestCase.m
//  SimpleBDD
//
//  Created by Przemysław Wośko on 28/07/16.
//  Copyright © 2016 Azimo Ltd. All rights reserved.
//

#import "KIFBDDTestCase.h"
#import "KIFBDDScenarioCoordinator.h"

@implementation KIFBDDTestCase

- (void)beforeEach {
    [[KIFBDDScenarioCoordinator sharedCoordintator] clear];
    [super beforeEach];
}

- (void)afterEach {
    [super afterEach];
    KIFBDDScenarioCoordinator *coordinator = [KIFBDDScenarioCoordinator sharedCoordintator];
    if ([coordinator isBDDTestCase]) {
        NSLog(@"TestCase result: \n %@",[coordinator scenarioDescription]);
        if ([coordinator isScenarioFailed]) {
            coordinator.afterEachInvoked = YES;
            [super failWithExceptions:coordinator.exceptios stopTest:YES];
        }
    }
}

#pragma mark - logging exceptions

- (void)failWithException:(NSException *)exception stopTest:(BOOL)stop {
    KIFBDDScenarioCoordinator *coordinator  = [KIFBDDScenarioCoordinator sharedCoordintator];
    if (!coordinator.isBDDTestCase) {
        [super failWithException:exception stopTest:stop];
    } else {
        if (coordinator.afterEachInvoked) {
            [super failWithException:exception stopTest:stop];
        } else {
            [self failWithExceptions:@[exception] stopTest:stop];
        }
    }
}

- (void)failWithExceptions:(NSArray *)exceptions stopTest:(BOOL)stop {
    KIFBDDScenarioCoordinator *coordinator  = [KIFBDDScenarioCoordinator sharedCoordintator];
    if ([coordinator isBDDTestCase]) {
        [coordinator markAsFailed];
        [coordinator failedWithExceptions:exceptions];
    } else {
        [super failWithExceptions:exceptions stopTest:stop];
    }
}

@end
