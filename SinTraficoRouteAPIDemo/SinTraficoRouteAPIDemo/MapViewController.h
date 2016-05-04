//
//  MapViewController.h
//  SinTraficoRouteAPIDemo
//
//  Created by Daniel Garcia on 4/26/16.
//  Copyright © 2016 SinTrafico. All rights reserved.
//

#import <MapKit/MapKit.h>
#import "STRouteOptions.h"
#import "STRouteNetworking.h"
#import "STLocation.h"

@interface MapViewController : UIViewController <MKMapViewDelegate, RouteNetworkDelegate>

@property (retain, nonatomic) STRouteOptions* routeOptions;
@property (retain, nonatomic) MKPolyline* routeLine;
@property (retain, nonatomic) STLocation* endLocation;

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

- (IBAction)btnRoute:(id)sender;

@end
