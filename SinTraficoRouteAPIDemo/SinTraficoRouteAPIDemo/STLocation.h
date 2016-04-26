//
//  STLocation.h
//  SinTraficoRouteAPIDemo
//
//  Created by SinTrafico on 4/26/16.
//  Copyright © 2016 SinTrafico. All rights reserved.
//

#ifndef STLocation_h
#define STLocation_h

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface STLocation : NSObject <MKAnnotation>

- (id)initWithTitle:(NSString*)name andCoordinate:(CLLocationCoordinate2D)coordinate;

@end


#endif /* STLocation_h */
