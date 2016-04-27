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

@interface MapViewController : UIViewController <OptionsDelegate>

@property (retain, nonatomic) STRouteOptions* routeOptions;

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

- (IBAction)btnRoute:(id)sender;

@end
