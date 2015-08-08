//
//  ViewController.m
//  WeatherAlert
//
//  Created by Anurag Mishra on 8/8/15.
//  Copyright (c) 2015 mojers. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    OWMWeatherAPI *weatherAPI = [[OWMWeatherAPI alloc] initWithAPIKey:@"bde3f77ceaac8c5d415df4c4d50cacae"];
    [weatherAPI setTemperatureFormat:kOWMTempFahrenheit];
    
    [weatherAPI currentWeatherByCityName:@"SanFrancisco" withCallback:^(NSError *error, NSDictionary *result) {
        if (error) {
            // handle the error
            return;
        }
        
        // The data is ready
        
        NSString *cityName = result[@"name"];
        NSNumber *currentTemp = result[@"main"][@"temp"];
        NSLog(@"city name is %@", cityName);
        NSLog(@"current temp is %@", currentTemp);
        if ([result[@"main"][@"temp"] intValue] > 75) {
            NSLog(@"The temp is greater that 70 F! Hot day");
        }
        NSLog(@"result is %@", result);
        
    }];
    
    [weatherAPI forecastWeatherByCityName:@"NewYork" withCallback:^(NSError *error, NSDictionary *result) {
        if (error) {
            //handle error
            NSLog(@"ERROR processing request!");
        }
        //NSLog(@"result is %@", result);
    }];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
