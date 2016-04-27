//
//  StructOptions.h
//  SinTraficoRouteAPIDemo
//
//  Created by Daniel Garcia on 4/27/16.
//  Copyright © 2016 SinTrafico. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface StructOptions : NSObject

@property (assign) CLLocationCoordinate2D start;
@property (assign) CLLocationCoordinate2D end;
@property (retain, nonatomic) NSNumber* transportType;
@property (retain, nonatomic) NSNumber* vehicleType;
@property (assign) bool showParking;
@property (assign) bool showTolls;
@property (assign) bool showGas;

- (NSDictionary*) parameters;

@end
