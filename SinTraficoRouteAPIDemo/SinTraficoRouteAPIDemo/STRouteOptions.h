//
//  StructOptions.h
//  SinTraficoRouteAPIDemo
//
//  Created by Daniel Garcia on 4/27/16.
//  Copyright © 2016 SinTrafico. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface STRouteOptions : NSObject

@property (assign) CLLocationCoordinate2D start;
@property (assign) CLLocationCoordinate2D end;
@property (assign) NSInteger transportType;
@property (assign) NSInteger vehicleType;
@property (assign) NSInteger poiIn;

- (NSDictionary*) parameters;

@end
