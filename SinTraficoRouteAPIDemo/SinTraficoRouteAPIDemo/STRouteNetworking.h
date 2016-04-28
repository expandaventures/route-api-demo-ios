//
//  STRouteNetworking.h
//  SinTraficoRouteAPIDemo
//
//  Created by SinTrafico on 4/27/16.
//  Copyright © 2016 SinTrafico. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "STRouteOptions.h"

@protocol RouteNetworkDelegate <NSObject>

-(void) receiveRoutePolyline:(MKPolyline *)routeLine;

@end

@interface STRouteNetworking : NSObject

- (instancetype) __unavailable init;
- (id) initWithDelegate: (id<RouteNetworkDelegate>) newDelegate;

- (void)getRouteForOptions: (STRouteOptions*) options;

@property (assign, nonatomic) id<RouteNetworkDelegate> delegate;

@end
