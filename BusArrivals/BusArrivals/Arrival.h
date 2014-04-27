//
//  Arrival.h
//  BusArrivals
//
//  Created by Chris Vanderschuere on 4/27/14.
//  Copyright (c) 2014 OSU App Club. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Arrival : NSObject

@property (nonatomic, strong) NSDate *scheduled;
@property (nonatomic, strong) NSDate *expected;
@property (nonatomic, strong) NSString *route;

+ (instancetype) arrivalWithJSON:(NSDictionary*)jsonDict;

@end
