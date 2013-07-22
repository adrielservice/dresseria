//
//  ViewController.m
//  Dresseria
//
//  Created by David Beilis on 6/15/2013.
//  Copyright (c) 2013 Adriel Service. All rights reserved.
//

#import "MainViewController.h"
#import <CoreLocation/CoreLocation.h>

#import "ReceiveViewController.h"
#import "Store/MasterViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self initLocationManager];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

#define BTN_TITLE_PICTURE  @"Take a Picture..."
#define BTN_TITLE_SCAN @"Scan Code"
#define BTN_TITLE_HELP @"?"
#define BTN_TITLE_CANCEL @"Cancel Button"

- (IBAction) newItem:(id)sender {
    NSString *actionSheetTitle = @"New Item..."; //Action Sheet Title
    NSString *other1 = BTN_TITLE_PICTURE;
    NSString *other2 = BTN_TITLE_SCAN;
    NSString *other3 = BTN_TITLE_HELP;
    NSString *cancelTitle = BTN_TITLE_CANCEL;
    UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                  initWithTitle:actionSheetTitle
                                  delegate:self
                                  cancelButtonTitle:cancelTitle
                                  destructiveButtonTitle:nil
                                  otherButtonTitles:other1, other2, other3, nil];
    [actionSheet showInView:self.view];
}

- (IBAction) shop:(id)sender {
    // #warning You must sign up for a Partner ID at http://shopsense.shopstyle.com/
	/// alternativly you can add a string valued key with the appropriate id named ShopSensePartnerID to the bundle *.plist
	[[PSSClient sharedClient] setPartnerID:@"uid25-23312005-3"];
	
	MasterViewController *masterViewController = [[MasterViewController alloc] initWithStyle:UITableViewStylePlain];
 	masterViewController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal; 
    [self.navigationController pushViewController:masterViewController animated:YES];
}

- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex {
    
    //Get the name of the current pressed button
    NSString *buttonTitle = [actionSheet buttonTitleAtIndex:buttonIndex];

    if ([buttonTitle isEqualToString:BTN_TITLE_PICTURE]) {
        NSLog(@"Other %@ pressed", BTN_TITLE_PICTURE);
    }
    if ([buttonTitle isEqualToString:BTN_TITLE_SCAN]) {
        NSLog(@"Other %@ pressed", BTN_TITLE_SCAN);
        
        ReceiveViewController *controller = [[ReceiveViewController alloc] initWithNibName:@"ReceiveViewController" bundle:nil];
        // controller.delegate = self;
        controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
        [self presentViewController:controller animated:YES completion:nil];
        
    }
    if ([buttonTitle isEqualToString:BTN_TITLE_HELP]) {
        NSLog(@"Other %@ pressed", BTN_TITLE_HELP);
    }
    if ([buttonTitle isEqualToString:BTN_TITLE_CANCEL]) {
        NSLog(@"Cancel pressed --> Cancel ActionSheet");
    }
}



@end
