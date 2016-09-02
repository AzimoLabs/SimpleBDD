//
//  KIFBDDTestScope.h
//  SimpleBDD
//
//  Created by Przemysław Wośko on 28/07/16.
//  Copyright © 2016 Azimo Ltd. All rights reserved.
//


@import Foundation;

typedef void (^KIFBDDTestStep)();

@interface KIFBDDTestScope : NSObject

@property (nonatomic, strong) NSString *stepName;
@property (nonatomic, strong) NSString *stepTypeName;
@property (nonatomic, copy) KIFBDDTestStep testStep;

- (instancetype)initBDDGiven:(NSString *)name step:(KIFBDDTestStep)testStep;

- (instancetype)initBDDWhen:(NSString *)name step:(KIFBDDTestStep)testStep;

- (instancetype)initBDDAnd:(NSString *)name step:(KIFBDDTestStep)testStep;

- (instancetype)initBDDThen:(NSString *)name step:(KIFBDDTestStep)testStep;

@end
