//
//  googlemap.h
//  Street_Food
//
//  Created by MACOS on 20/10/16.
//  Copyright © 2016 pinu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GoogleMaps/GoogleMaps.h>

@interface googlemap : UIViewController<CLLocationManagerDelegate>
{
    CLLocationManager *locationManager;
    CLGeocoder *geocoder;
    NSArray *nm;
}
@end
