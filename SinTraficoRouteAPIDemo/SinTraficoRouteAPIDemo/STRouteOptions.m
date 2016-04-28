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
    return @{@"key": @"testKeyHash",
             @"start": [NSString stringWithFormat:@"%f,%f", self.start.latitude, self.start.longitude],
             @"end": [NSString stringWithFormat:@"%f,%f", self.end.latitude, self.end.longitude]};
}

@end
