//
//  KIFBDDTestStepDescription.h
//  SimpleBDD
//
//  Created by Przemysław Wośko on 28/07/16.
//  Copyright © 2016 Azimo Ltd. All rights reserved.
//

@import Foundation.NSObject;

@interface KIFBDDTestStepDescription : NSObject

@property (strong) NSString *name;
@property (strong) NSString *type;
@property (assign) BOOL failed;

- (instancetype)initWithName:(NSString *)name type:(NSString *)type failed:(BOOL)failed;

- (NSString *)description;

@end
