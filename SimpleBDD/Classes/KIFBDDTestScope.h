//
//  KIFBDDTestScope.h
//  SimpleBDD
//
//  Created by Przemysław Wośko on 28/07/16.
//  Copyright © 2016 Azimo Ltd. All rights reserved.
//


#import "KIFBDDScenario.h"
@import Foundation;
@class KIFBDDTestScope;

typedef void (^KIFBDDTestStep)();

@interface KIFBDDTestScope : NSObject

@property (weak) KIFBDDScenario *scenario;

+ (instancetype)stepWithDelegate:(id<KIFTestActorDelegate>)delegate
                        scenario:(KIFBDDScenario *)scenario;

- (instancetype)initWithScenario:(KIFBDDScenario *)scenario;

- (void)BDDGiven:(NSString *)name step:(KIFBDDTestStep)testStep;

- (void)BDDWhen:(NSString *)name step:(KIFBDDTestStep)testStep;

- (void)BDDAnd:(NSString *)name step:(KIFBDDTestStep)testStep;

- (void)BDDThen:(NSString *)name step:(KIFBDDTestStep)testStep;

@end
