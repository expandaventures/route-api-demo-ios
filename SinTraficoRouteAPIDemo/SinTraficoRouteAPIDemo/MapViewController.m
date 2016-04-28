//
//  MapViewController.m
//  SinTraficoRouteAPIDemo
//
//  Created by Daniel Garcia on 4/26/16.
//  Copyright © 2016 SinTrafico. All rights reserved.
//

#import "MapViewController.h"
#import "OptionsViewController.h"
#import "STRouteNetworking.h"
#import "STLocation.h"

@interface MapViewController ()

@end

@implementation MapViewController

- (void)viewWillAppear:(BOOL)animated {
    self.mapView.delegate = self;
    // Start point
    CLLocationCoordinate2D startCoordinate;
    startCoordinate.latitude = 19.43436;
    startCoordinate.longitude= -99.1863;
    STLocation *startLocation = [[STLocation alloc] initWithTitle:@"Inicio" andCoordinate:startCoordinate];
    [self.mapView addAnnotation:startLocation];
    // End point
    CLLocationCoordinate2D endCoordinate;
    endCoordinate.latitude = 19.4136;
    endCoordinate.longitude= -99.1466;
    STLocation *endLocation = [[STLocation alloc] initWithTitle:@"Fin" andCoordinate:endCoordinate];
    [self.mapView addAnnotation:endLocation];
    // Center map
    CLLocationCoordinate2D zoomLocation;
    zoomLocation.latitude = (startCoordinate.latitude + endCoordinate.latitude) / 2;
    zoomLocation.longitude = (startCoordinate.longitude + endCoordinate.longitude) / 2;
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 16000, 16000);
    [self.mapView setRegion:viewRegion animated:YES];
    // Configure options
    self.routeOptions = [[STRouteOptions alloc] init];
    self.routeOptions.start = startCoordinate;
    self.routeOptions.end = endCoordinate;
    self.routeOptions.transportType = 0; // car
    self.routeOptions.vehicleType = 0; // motorcycle
    self.routeOptions.poiIn = -1; // none
}

- (IBAction)btnRoute:(id)sender {
    STRouteNetworking* router = [[STRouteNetworking alloc] initWithDelegate:self];
    [router getRouteForOptions:self.routeOptions];
}

- (MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay {
    NSLog(@"hi");
    if ([overlay isKindOfClass:[MKPolyline class]]) {
        MKPolyline *route = overlay;
        MKPolylineRenderer *routeRenderer = [[MKPolylineRenderer alloc] initWithPolyline:route];
        routeRenderer.strokeColor = [UIColor blueColor];
        routeRenderer.lineWidth = 10;
        return routeRenderer;
    }
    else {
        return nil;
    }
}

-(void) receiveRouteOptions:(STRouteOptions *)options {
    self.routeOptions = options;
}

-(void) receiveRoutePolyline:(MKPolyline *)routeLine {
    NSLog(@"Received line");
    NSLog(@"%@", self.mapView.delegate);
    NSLog(@"%@", self);
    self.routeLine = routeLine;
    NSLog(@"%@", [self.routeLine description]);
    if (self.routeLine == nil) {
        NSLog(@"Nil duh!");
    }
    NSLog(@"%lu", (unsigned long)[self.routeLine pointCount]);
    [self.mapView addOverlay:self.routeLine level:MKOverlayLevelAboveLabels];
    NSLog(@"Set line on map");
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    OptionsViewController* dest = segue.destinationViewController;
    dest.routeOptions = self.routeOptions;
    dest.delegate = self;
}

@end
