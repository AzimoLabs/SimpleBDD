//
//  KIFBDDKeywords.m
//  SimpleBDD
//
//  Created by Przemysław Wośko on 28/07/16.
//  Copyright © 2016 Azimo Ltd. All rights reserved.
//

#import "KIFBDDKeywords.h"

void Given(NSString *desc, KIFBDDTestStep step) {
    [[[KIFBDDTestScope alloc] initWithScenario:[KIFBDDScenarioCoordinator sharedCoordintator].currentExecutedScenario] BDDGiven:desc step:step];
}

void And(NSString *desc, KIFBDDTestStep step) {
    [[[KIFBDDTestScope alloc] initWithScenario:[KIFBDDScenarioCoordinator sharedCoordintator].currentExecutedScenario] BDDAnd:desc step:step];
}

void Then(NSString *desc, KIFBDDTestStep step) {
    [[[KIFBDDTestScope alloc] initWithScenario:[KIFBDDScenarioCoordinator sharedCoordintator].currentExecutedScenario] BDDThen:desc step:step];
}

void When(NSString *desc, KIFBDDTestStep step) {
    [[[KIFBDDTestScope alloc] initWithScenario:[KIFBDDScenarioCoordinator sharedCoordintator].currentExecutedScenario] BDDWhen:desc step:step];
}


@implementation KIFBDDKeywords

@end
