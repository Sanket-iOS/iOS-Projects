//
//  MP_DetailView.h
//  iWitness
//
//  Created by MACOS on 6/22/16.
//  Copyright © 2016 MAC OS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "AppDelegate.h"

@interface MP_DetailView : UIViewController<CLLocationManagerDelegate>{
    
    CLPlacemark *placemark;
    CLGeocoder *geoCoder;
    
    NSArray *getMPDetails;
    
    NSMutableArray *getNearestPS;
    NSMutableArray *distancedt;
    NSString *strGetPSID;
    NSString *strGetUID;
    NSString *getMPLocation;
    BOOL checkPS;
}

@property (strong, nonatomic) CLLocation *currentLocation;

@property (weak, nonatomic) IBOutlet UIImageView *dimgMP;
@property (weak, nonatomic) IBOutlet UILabel *lblMPName;
@property (weak, nonatomic) IBOutlet UILabel *lblMPAge;
@property (weak, nonatomic) IBOutlet UILabel *lblMPDetails;
@property (weak, nonatomic) IBOutlet UILabel *lblMissingDate;
@property (weak, nonatomic) IBOutlet UILabel *lblMPContact;
@property (weak, nonatomic) IBOutlet UIView *viewMain;

@property (weak, nonatomic) IBOutlet UIVisualEffectView *blurViewLoading;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityindicatorloading;

@property (weak, nonatomic) IBOutlet UILabel *lblactivityIndicator;
@property (weak, nonatomic) IBOutlet UILabel *lblnearPolicestation;
@property (weak, nonatomic) IBOutlet UILabel *lblDistancefromYou;


@property (weak, nonatomic) IBOutlet UIButton *btnSendLocation;
- (IBAction)btnSendLocation:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *btnFinalSendLocation;
- (IBAction)btnFinalSendLocation:(id)sender;



@end
