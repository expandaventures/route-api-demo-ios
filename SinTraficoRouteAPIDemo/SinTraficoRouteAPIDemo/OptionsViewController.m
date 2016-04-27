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
    self.poiIn.delegate = self;
    self.poiIn.dataSource = self;
    
    self.vehicleTypeOptions = @[@"Moto", @"Carro", @"Eje Ligero", @"Camión 2 Ejes", @"Camión 3 Ejes", @"Camión 4 Ejes",
                                @"Tráiler 2 Ejes", @"Tráiler 3 Ejes", @"Tráiler 4 Ejes", @"Tráiler 5 Ejes",
                                @"Tráiler 6 Ejes", @"Tráiler 7 Ejes", @"Tráiler 8 Ejes", @"Tráiler 9 Ejes",
                                @"Eje Pesado"];
    self.transportTypeOptions = @[@"Carro", @"Bicicleta", @"Peatón"];
    self.poiInOptions = @[@"Estacionamientos", @"Casetas", @"Gasolineras"];
}

- (IBAction)btnOK:(id)sender {
    if (self.delegate != nil) {
        self.routeOptions.transportType = [self.transportType selectedRowInComponent:0];
        self.routeOptions.vehicleType = [self.vehicleType selectedRowInComponent:0];
        self.routeOptions.poiIn = [self.poiIn selectedRowInComponent:0];
        [self.delegate receiveRouteOptions:self.routeOptions];
    }
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
    else if (pickerView == self.poiIn) {
        return self.poiInOptions.count;
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
    else if (pickerView == self.poiIn) {
        return self.poiInOptions[row];
    }
    return nil;
}

@end
