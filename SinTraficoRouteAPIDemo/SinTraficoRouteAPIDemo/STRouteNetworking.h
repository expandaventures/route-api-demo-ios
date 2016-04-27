//
//  STRouteNetworking.h
//  SinTraficoRouteAPIDemo
//
//  Created by SinTrafico on 4/27/16.
//  Copyright © 2016 SinTrafico. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "STRouteOptions.h"

@interface STRouteNetworking : NSObject

+ (void)getRouteForOptions: (STRouteOptions*) options;

@end
