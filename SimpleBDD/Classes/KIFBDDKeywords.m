//
//  KIFBDDKeywords.m
//  SimpleBDD
//
//  Created by Przemysław Wośko on 28/07/16.
//  Copyright © 2016 Azimo Ltd. All rights reserved.
//

#import "KIFBDDKeywords.h"

void Given(NSString *desc, KIFBDDTestStep step) {
    KIFBDDTestScope *scope = [[KIFBDDTestScope alloc] initBDDGiven:desc step:step];
    [[KIFBDDScenarioCoordinator sharedCoordintator] executreStepScope:scope];
}

void And(NSString *desc, KIFBDDTestStep step) {
    KIFBDDTestScope *scope = [[KIFBDDTestScope alloc] initBDDAnd:desc step:step];
    [[KIFBDDScenarioCoordinator sharedCoordintator] executreStepScope:scope];
}

void Then(NSString *desc, KIFBDDTestStep step) {
    KIFBDDTestScope *scope = [[KIFBDDTestScope alloc] initBDDThen:desc step:step];
    [[KIFBDDScenarioCoordinator sharedCoordintator] executreStepScope:scope];
}

void When(NSString *desc, KIFBDDTestStep step) {
    KIFBDDTestScope *scope = [[KIFBDDTestScope alloc] initBDDWhen:desc step:step];
    [[KIFBDDScenarioCoordinator sharedCoordintator] executreStepScope:scope];
}

@implementation KIFBDDKeywords

@end
