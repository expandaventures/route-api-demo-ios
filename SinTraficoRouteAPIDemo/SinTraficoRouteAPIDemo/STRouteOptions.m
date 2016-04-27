//
//  StructOptions.m
//  SinTraficoRouteAPIDemo
//
//  Created by Daniel Garcia on 4/27/16.
//  Copyright © 2016 SinTrafico. All rights reserved.
//

#import "STRouteOptions.h"

@implementation STRouteOptions

- (NSDictionary*) parameters {
    return @{@"start": [NSString stringWithFormat:@"%f,%f", self.start.latitude, self.start.longitude],
             @"end": [NSString stringWithFormat:@"%f,%f", self.end.latitude, self.end.longitude],
             @"transport": [self transportTypeString],
             @"poi_in": self.poiIn >= 0 ? [NSNumber numberWithInt:self.poiIn] : [NSNull null],
             @"vehicle_type": [NSNumber numberWithInt:self.vehicleType]};
}

- (NSString*) transportTypeString {
    return [STRouteOptions transportTypeStringFromInteger:self.transportType];
}

+ (NSString*) transportTypeStringFromInteger: (NSInteger) transportType {
    if (transportType == 0) {
        return @"car";
    }
    else if (transportType == 1) {
        return @"bicycle";
    }
    else if (transportType == 2) {
        return @"pedestrian";
    }
    return nil;
}

@end
