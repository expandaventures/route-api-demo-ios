//
//  MapViewController.h
//  SinTraficoRouteAPIDemo
//
//  Created by Daniel Garcia on 4/26/16.
//  Copyright © 2016 SinTrafico. All rights reserved.
//

#import <MapKit/MapKit.h>
#import "OptionsViewController.h"
#import "STRouteOptions.h"
#import "STRouteNetworking.h"

@interface MapViewController : UIViewController <MKMapViewDelegate, OptionsDelegate, RouteNetworkDelegate>

@property (retain, nonatomic) STRouteOptions* routeOptions;
@property (retain, nonatomic) MKPolyline* routeLine;

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

- (IBAction)btnRoute:(id)sender;

@end
