//
//  MapViewController.m
//  SinTraficoRouteAPIDemo
//
//  Created by Daniel Garcia on 4/26/16.
//  Copyright © 2016 SinTrafico. All rights reserved.
//

#import "MapViewController.h"
#import "STLocation.h"

@interface MapViewController ()

@end

@implementation MapViewController

- (void)viewWillAppear:(BOOL)animated {
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
    STLocation *endLocation = [[STLocation alloc] initWithTitle:@"End" andCoordinate:endCoordinate];
    [self.mapView addAnnotation:endLocation];
    // Center map
    CLLocationCoordinate2D zoomLocation;
    zoomLocation.latitude = (startCoordinate.latitude + endCoordinate.latitude) / 2;
    zoomLocation.longitude = (startCoordinate.longitude + endCoordinate.longitude) / 2;
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 16000, 16000);
    [self.mapView setRegion:viewRegion animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btnRoute:(id)sender {
    NSLog(@"clicked route");
}

@end