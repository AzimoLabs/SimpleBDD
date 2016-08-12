//
//  KIFTestActor+BDDTestScope.h
//  SimpleBDD
//
//  Created by Przemysław Wośko on 28/07/16.
//  Copyright © 2016 Azimo Ltd. All rights reserved.
//

#import <KIF/KIF.h>

#define BDDActorWith(clazz) [clazz actorInFile:[NSString stringWithUTF8String:__FILE__] atLine:__LINE__ delegate:currentScenario.errorHandler]

#define KIFActorWithClass(clazz) [clazz actorInFile:[NSString stringWithUTF8String:__FILE__] atLine:__LINE__ delegate:currentScenario.errorHandler]

#define tester BDDActorWith(KIFUITestActor)
#define viewTester BDDActorWith(KIFUIViewTestActor)

#define KIFBDDErrorHandler currentScenario.errorHandler
#define KIFBDD_CurrentScenario currentScneario


