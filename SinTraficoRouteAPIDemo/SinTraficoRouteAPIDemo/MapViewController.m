//
//  MapViewController.m
//  SinTraficoRouteAPIDemo
//
//  Created by Daniel Garcia on 4/26/16.
//  Copyright © 2016 SinTrafico. All rights reserved.
//

#import "MapViewController.h"
#import "STRouteNetworking.h"

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
    self.endLocation = [[STLocation alloc] initWithTitle:@"Fin" andCoordinate:endCoordinate];
    [self.mapView addAnnotation:self.endLocation];
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
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // GestureRecognizers to update end point of route
    UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:nil];
    doubleTap.numberOfTapsRequired = 2;
    doubleTap.numberOfTouchesRequired = 1;
    [self.mapView addGestureRecognizer:doubleTap];
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                action:@selector(updateRouteEnd:)];
    singleTap.numberOfTapsRequired = 1;
    singleTap.numberOfTouchesRequired = 1;
    [singleTap requireGestureRecognizerToFail: doubleTap];
    [self.mapView addGestureRecognizer:singleTap];
}

- (void)updateRouteEnd:(UIGestureRecognizer *)gestureRecognizer
{
    if (gestureRecognizer.state != UIGestureRecognizerStateEnded)
        return;
    // Remove previous
    [self.mapView removeAnnotation:self.endLocation];
    [self.mapView removeOverlay:self.routeLine];
    // Get location
    CGPoint touchPoint = [gestureRecognizer locationInView:self.mapView];
    CLLocationCoordinate2D tapLocation = [self.mapView convertPoint:touchPoint toCoordinateFromView:self.mapView];
    // Update
    self.endLocation = [[STLocation alloc] initWithTitle:@"Fin" andCoordinate:tapLocation];
    self.routeOptions.end = self.endLocation.coordinate;
    [self.mapView addAnnotation:self.endLocation];
}

- (IBAction)btnRoute:(id)sender {
    STRouteNetworking* router = [[STRouteNetworking alloc] initWithDelegate:self];
    [router getRouteForOptions:self.routeOptions];
}

- (MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay {
    if ([overlay isKindOfClass:[MKPolyline class]]) {
        MKPolyline *route = overlay;
        MKPolylineRenderer *routeRenderer = [[MKPolylineRenderer alloc] initWithPolyline:route];
        routeRenderer.strokeColor = [UIColor blueColor];
        routeRenderer.lineWidth = 2;
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
    self.routeLine = routeLine;
    [self.mapView addOverlay:self.routeLine level:MKOverlayLevelAboveLabels];
}

@end
