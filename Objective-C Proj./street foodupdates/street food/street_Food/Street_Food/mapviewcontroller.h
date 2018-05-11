//
//  mapviewcontroller.h
//  Street_Food
//
//  Created by Tops on 10/2/16.
//  Copyright © 2016 pinu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>


@interface mapviewcontroller : UIViewController<CLLocationManagerDelegate,UITextFieldDelegate,MKMapViewDelegate>
{
    CLLocationManager *manager;
}

@property (strong, nonatomic) IBOutlet UIButton *btn_back;
@property (strong, nonatomic) IBOutlet MKMapView *map_kit_view;
@property (strong, nonatomic) IBOutlet UIVisualEffectView *blur_view;
@property (strong, nonatomic) IBOutlet UITextField *txt_search;
- (IBAction)btn_search:(id)sender;
- (IBAction)btn_back:(id)sender;

@end
