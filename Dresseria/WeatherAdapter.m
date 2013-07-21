//
//  WeatherAdapter.m
//  Dresseria
//
//  Created by David Beilis on 6/18/2013.
//  Copyright (c) 2013 Adriel Service. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
#import "WeatherAdapter.h"

@implementation WeatherAdapter

- (NSString*) getLocation {
    return nil;
}

- (void)reverseGeocodeLocation:(CLLocation *)location {
    CLGeocoder* reverseGeocoder = [[CLGeocoder alloc] init];
    [reverseGeocoder reverseGeocodeLocation:location completionHandler:^(NSArray *placemarks, NSError *error) {
        CLPlacemark* placemark = [placemarks firstObject];
        if (placemark) {
            //Using blocks, get zip code
            //NSString zipCode = [placemark.addressDictionary objectForKey:(NSString*)kABPersonAddressZIPKey];
        }
    }];
}

@end
