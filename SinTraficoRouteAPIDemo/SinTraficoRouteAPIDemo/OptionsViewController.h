//
//  OptionsViewController.h
//  SinTraficoRouteAPIDemo
//
//  Created by Daniel Garcia on 4/27/16.
//  Copyright © 2016 SinTrafico. All rights reserved.
//

#import "ViewController.h"

@interface OptionsViewController : ViewController <UIPickerViewDelegate, UIPickerViewDataSource>

@property (strong) NSArray *transportTypeOptions;
@property (strong) NSArray *vehicleTypeOptions;

@property (weak, nonatomic) IBOutlet UIPickerView *transportType;
@property (weak, nonatomic) IBOutlet UIPickerView *vehicleType;

@property (weak, nonatomic) IBOutlet UISwitch *switchParking;
@property (weak, nonatomic) IBOutlet UISwitch *switchTolls;
@property (weak, nonatomic) IBOutlet UISwitch *switchGas;

- (IBAction)btnOK:(id)sender;

@end
