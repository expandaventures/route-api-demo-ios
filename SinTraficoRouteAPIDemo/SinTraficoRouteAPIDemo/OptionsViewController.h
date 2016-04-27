//
//  OptionsViewController.h
//  SinTraficoRouteAPIDemo
//
//  Created by Daniel Garcia on 4/27/16.
//  Copyright © 2016 SinTrafico. All rights reserved.
//

#import "STRouteOptions.h"

@protocol OptionsDelegate <NSObject>

-(void) receiveRouteOptions:(STRouteOptions *)options;

@end

@interface OptionsViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>

@property (strong) NSArray *transportTypeOptions;
@property (strong) NSArray *vehicleTypeOptions;
@property (strong) NSArray *poiInOptions;

@property (weak, nonatomic) IBOutlet UIPickerView *transportType;
@property (weak, nonatomic) IBOutlet UIPickerView *vehicleType;
@property (weak, nonatomic) IBOutlet UIPickerView *poiIn;

@property (retain, nonatomic) STRouteOptions* routeOptions;
@property (assign, nonatomic) id<OptionsDelegate> delegate;

- (IBAction)btnOK:(id)sender;

@end
