//
//  ViewController.m
//  Dresseria
//
//  Created by David Beilis on 6/15/2013.
//  Copyright (c) 2013 Adriel Service. All rights reserved.
//

#import "MainViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self initLocationManager];
}

- (void) initLocationManager
{
    locationManager = [[CLLocationManager alloc] init];
    locationManager.distanceFilter = kCLDistanceFilterNone; // whenever we move
    locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters; // 100 m
    locationManager.delegate = self;
    [locationManager startUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
    [locationManager stopUpdatingLocation];
    
    CLGeocoder * geoCoder = [[CLGeocoder alloc] init];
    [geoCoder reverseGeocodeLocation:newLocation completionHandler:^(NSArray *placemarks, NSError *error) {
        for (CLPlacemark * placemark in placemarks) {
            NSString* test = [placemark locality];
            NSLog(@"%@", test);
        }
    }];
}


- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"locationManager:%@ didFailWithError:%@", manager, error);
}

- (void)reverseGeocoder:(CLGeocoder *)geocoder didFailWithError:(NSError *)error
{
    NSLog(@"reverseGeocoder:%@ didFailWithError:%@", geocoder, error);
}

- (IBAction) updateWeather:(id)sender
{
    CLGeocoder* reverseGeocoder = [[CLGeocoder alloc] init];
    [reverseGeocoder reverseGeocodeLocation:locationManager.location completionHandler:^(NSArray *placemarks, NSError *error) {
        CLPlacemark* placemark = [placemarks firstObject];
        if (placemark) {
            //Using blocks, get zip code
            //NSString zipCode = [placemark.addressDictionary objectForKey:(NSString*)kABPersonAddressZIPKey];
        }
    }];

}

- (IBAction) newItem:(id)sender {
    NSString *actionSheetTitle = @"New Item..."; //Action Sheet Title
    NSString *destructiveTitle = @"Cancel"; //Action Sheet Button Titles
    NSString *other1 = @"Take a Picture...";
    NSString *other2 = @"Scan Code";
    NSString *other3 = @"?";
    NSString *cancelTitle = @"Cancel Button";
    UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                  initWithTitle:actionSheetTitle
                                  delegate:self
                                  cancelButtonTitle:cancelTitle
                                  destructiveButtonTitle:destructiveTitle
                                  otherButtonTitles:other1, other2, other3, nil];
    [actionSheet showInView:self.view];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
