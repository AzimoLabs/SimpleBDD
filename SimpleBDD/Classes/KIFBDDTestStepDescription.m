//
//  KIFBDDTestStepDescription.m
//  SimpleBDD
//
//  Created by Przemysław Wośko on 28/07/16.
//  Copyright © 2016 Azimo Ltd. All rights reserved.
//

#import "KIFBDDTestStepDescription.h"

@implementation KIFBDDTestStepDescription

- (instancetype)initWithName:(NSString *)name type:(NSString *)type failed:(BOOL)failed {
    self = [super init];
    if (self) {
        _name = name;
        _type = type;
        _failed = failed;
    }
    return self;
}

- (NSString *)description {
    NSString *status = self.failed?@"✗":@"✓";
    return [NSString stringWithFormat:@"    %@ %@ %@ \n", status, self.type, self.name];
}


@end
