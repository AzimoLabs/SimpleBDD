//
//  KIFBDDKeywords.h
//  SimpleBDD
//
//  Created by Przemysław Wośko on 28/07/16.
//  Copyright © 2016 Azimo Ltd. All rights reserved.
//

@import Foundation;

#import "KIFBDDTestScope.h"
#import "KIFBDDScenarioCoordinator.h"

FOUNDATION_EXPORT void Given(NSString *desc, KIFBDDTestStep step);
FOUNDATION_EXPORT void When(NSString *desc, KIFBDDTestStep step);
FOUNDATION_EXPORT void Then(NSString *desc, KIFBDDTestStep step);
FOUNDATION_EXPORT void And(NSString *desc, KIFBDDTestStep step);


@interface KIFBDDKeywords : NSObject

@end
