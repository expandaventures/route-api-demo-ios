//
//  STLocation.m
//  SinTraficoRouteAPIDemo
//
//  Created by Daniel Garcia on 4/26/16.
//  Copyright © 2016 SinTrafico. All rights reserved.
//
#import "STLocation.h"

@interface STLocation ()
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@end

@implementation STLocation

- (id)initWithTitle:(NSString*)name andCoordinate:(CLLocationCoordinate2D)coordinate {
    if ((self = [super init])) {
        self.name = name;
        self.coordinate = coordinate;
    }
    return self;
}

@end
