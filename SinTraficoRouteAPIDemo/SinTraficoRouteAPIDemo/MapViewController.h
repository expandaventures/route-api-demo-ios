//
//  MapViewController.h
//  SinTraficoRouteAPIDemo
//
//  Created by Daniel Garcia on 4/26/16.
//  Copyright © 2016 SinTrafico. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>

@interface MapViewController : ViewController

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
- (IBAction)btnRoute:(id)sender;

@end
