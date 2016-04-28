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

+ (void)getRouteForOptions: (STRouteOptions*) options {
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
            for (NSArray* test in [geom objectForKey:@"coordinates"]) {
                CLLocationCoordinate2D newCoordinates;
                newCoordinates.latitude = [[test objectAtIndex:0] floatValue];
                newCoordinates.longitude= [[test objectAtIndex:1] floatValue];
                coordinates[i] = newCoordinates;
                i++;
            }
            MKPolyline* routeLine = [MKPolyline polylineWithCoordinates:coordinates
                                                                  count:[[geom objectForKey:@"coordinates"] count]];
            NSLog(@"%@", routeLine);
        }
    }];
    [dataTask resume];
}

@end
