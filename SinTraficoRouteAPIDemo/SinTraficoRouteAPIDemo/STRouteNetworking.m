//
//  STRouteNetworking.m
//  SinTraficoRouteAPIDemo
//
//  Created by SinTrafico on 4/27/16.
//  Copyright © 2016 SinTrafico. All rights reserved.
//

#import "STRouteNetworking.h"
#import "AFNetworking.h"

@implementation STRouteNetworking

- (id) initWithDelegate: (id<RouteNetworkDelegate>) newDelegate {
    if ( self = [super init] ) {
        self.delegate = newDelegate;
    }
    return self;
}

- (void)getRouteForOptions: (STRouteOptions*) options {
    NSString* routeURL = @"http://api.sintrafico.com/route";
    NSDictionary* params = [options parameters];
    
    NSURLRequest* request = [[AFHTTPRequestSerializer serializer]
                          requestWithMethod:@"GET" URLString:routeURL parameters:params error:nil];
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request
                                                completionHandler:^(NSURLResponse *response,
                                                                    id responseObject,
                                                                    NSError *error) {
        if (error) {
            NSLog(@"Error: %@", error);
        } else {
            NSDictionary* geom = responseObject[@"routes"][0][@"geometry"];
            CLLocationCoordinate2D coordinates[[[geom objectForKey:@"coordinates"] count]];
            int i = 0;
            for (NSArray* coordsArray in [geom objectForKey:@"coordinates"]) {
                // Each coordsArray is an array with two elements: lon and lat.
                CLLocationCoordinate2D newCoordinates;
                newCoordinates.longitude= [[coordsArray objectAtIndex:0] floatValue];
                newCoordinates.latitude = [[coordsArray objectAtIndex:1] floatValue];
                coordinates[i] = newCoordinates;
                i++;
            }
            MKPolyline* routeLine = [MKPolyline polylineWithCoordinates:coordinates
                                                                  count:[[geom objectForKey:@"coordinates"] count]];
            [self.delegate receiveRoutePolyline:routeLine];
        }
    }];
    [dataTask resume];
}

@end
