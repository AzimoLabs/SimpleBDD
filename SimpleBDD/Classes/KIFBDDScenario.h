//
//  KIFBDDScenario.h
//  SimpleBDD
//
//  Created by Przemysław Wośko on 28/07/16.
//  Copyright © 2016 Azimo Ltd. All rights reserved.
//

#import <KIF/KIF.h>

#define scenario(description, delegate) \
\
KIFBDDScenario *currentScenario = [[KIFBDDScenario alloc] initWithScenarioName:description errorHandler:delegate]; \
[KIFBDDScenarioCoordinator sharedCoordintator].currentExecutedScenario = currentScenario;
\

@interface KIFBDDScenario : NSObject

@property (nonatomic, strong, nonnull) NSString *scenarioName;
@property (nonatomic, weak, nullable) id<KIFTestActorDelegate> errorHandler;

- (nonnull instancetype)initWithScenarioName:(NSString *_Nonnull)scenarioName
                                errorHandler:(nonnull id<KIFTestActorDelegate>)errorHandler;

@end
