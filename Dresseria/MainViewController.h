//
//  ViewController.h
//  Dresseria
//
//  Created by David Beilis on 6/15/2013.
//  Copyright (c) 2013 Adriel Service. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface MainViewController : UIViewController<CLLocationManagerDelegate> {
    IBOutlet CLLocationManager *locationManager;
}

- (IBAction) updateWeather:(id)sender;

@end
