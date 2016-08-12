//
//  KIFBDDScenario.m
//  SimpleBDD
//
//  Created by Przemysław Wośko on 28/07/16.
//  Copyright © 2016 Azimo Ltd. All rights reserved.
//

#import "KIFBDDScenario.h"

@implementation KIFBDDScenario

- (nonnull instancetype)initWithScenarioName:(NSString *_Nonnull)scenarioName
                        errorHandler:(nonnull id<KIFTestActorDelegate>)errorHandler {
    self = [super init];
    if (self) {
        _scenarioName = scenarioName;
        _errorHandler = errorHandler;
    }
    return self;
}

@end
