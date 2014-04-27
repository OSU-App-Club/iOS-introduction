//
//  Arrival.m
//  BusArrivals
//
//  Created by Chris Vanderschuere on 4/27/14.
//  Copyright (c) 2014 OSU App Club. All rights reserved.
//

#import "Arrival.h"

@implementation Arrival

+ (instancetype) arrivalWithJSON:(NSDictionary*)jsonDict{
    Arrival *newArrival = [[Arrival alloc] init];
    
    newArrival.route = jsonDict[@"Route"];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"d MMM yy HH:mm ZZZ"];
    
    newArrival.scheduled = [dateFormatter dateFromString:jsonDict[@"Scheduled"]];
    newArrival.expected = [dateFormatter dateFromString:jsonDict[@"Expected"]];
    
    return newArrival;
}

@end
