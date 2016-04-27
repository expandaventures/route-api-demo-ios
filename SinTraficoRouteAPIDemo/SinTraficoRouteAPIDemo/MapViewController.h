//
//  MapViewController.h
//  SinTraficoRouteAPIDemo
//
//  Created by Daniel Garcia on 4/26/16.
//  Copyright © 2016 SinTrafico. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>
#import "STRouteOptions.h"

@interface MapViewController : ViewController

@property (retain, nonatomic) STRouteOptions* RouteOptions;

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

- (IBAction)btnRoute:(id)sender;

@end
