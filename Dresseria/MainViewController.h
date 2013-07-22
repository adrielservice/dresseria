//
//  ViewController.h
//  Dresseria
//
//  Created by David Beilis on 6/15/2013.
//  Copyright (c) 2013 Adriel Service. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface MainViewController : UIViewController<CLLocationManagerDelegate, UIActionSheetDelegate> {
    IBOutlet CLLocationManager *locationManager;
}

- (IBAction) updateWeather:(id)sender;

- (IBAction) newItem:(id)sender;
- (IBAction) shop:(id)sender;

@end
