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
    NSString* routeURL = @"http://api.sintrafico.com/osrm";
    NSDictionary* params = [options parameters];
    for (id key in params) {
        NSLog(@"key: %@, value: %@ \n", key, [params objectForKey:key]);
    }
    NSURLRequest* test = [[AFHTTPRequestSerializer serializer]
                          requestWithMethod:@"GET" URLString:routeURL parameters:params error:nil];
    NSLog(@"%@", test);
}

@end
