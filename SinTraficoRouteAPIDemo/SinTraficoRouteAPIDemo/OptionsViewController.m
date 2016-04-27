//
//  OptionsViewController.m
//  SinTraficoRouteAPIDemo
//
//  Created by Daniel Garcia on 4/27/16.
//  Copyright © 2016 SinTrafico. All rights reserved.
//

#import "OptionsViewController.h"

@implementation OptionsViewController

- (void)viewDidLoad {
    self.vehicleType.delegate = self;
    self.vehicleType.dataSource = self;
    self.transportType.delegate = self;
    self.transportType.dataSource = self;
    
    self.vehicleTypeOptions = @[@"Moto", @"Carro", @"Eje Ligero", @"Camión 2 Ejes", @"Camión 3 Ejes", @"Camión 4 Ejes",
                                @"Tráiler 2 Ejes", @"Tráiler 3 Ejes", @"Tráiler 4 Ejes", @"Tráiler 5 Ejes",
                                @"Tráiler 6 Ejes", @"Tráiler 7 Ejes", @"Tráiler 8 Ejes", @"Tráiler 9 Ejes",
                                @"Eje Pesado"];
    self.transportTypeOptions = @[@"Carro", @"Bicicleta", @"Peatón"];
}

- (IBAction)btnOK:(id)sender {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

// UIPickerView Data Source methods
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if (pickerView == self.vehicleType) {
        return self.vehicleTypeOptions.count;
    }
    else if (pickerView == self.transportType) {
        return self.transportTypeOptions.count;
    }
    return 0;
}

// UIPickerView Delegate methods
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (pickerView == self.vehicleType) {
        return self.vehicleTypeOptions[row];
    }
    else if (pickerView == self.transportType) {
        return self.transportTypeOptions[row];
    }
    return nil;
}

@end
