//
//  WP_DetailView.h
//  iWitness
//
//  Created by MACOS on 6/24/16.
//  Copyright © 2016 MAC OS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "AppDelegate.h"


@interface WP_DetailView : UIViewController<CLLocationManagerDelegate>
{
    CLPlacemark *placemark;
    CLGeocoder *geoCoder;
    
    NSArray *getWPDetails;
    
    NSMutableArray *getNearestPS;
    NSMutableArray *distancedt;
    NSString *strGetPSID;
    NSString *strGetUID;
    NSString *getWPLocation;
    BOOL checkPS;
}

@property (strong, nonatomic) CLLocation *currentLocation;

@property (weak, nonatomic) IBOutlet UIScrollView *wpDetailScroll;

@property (weak, nonatomic) IBOutlet UIImageView *dimgWP;
@property (weak, nonatomic) IBOutlet UILabel *lblWPName;
@property (weak, nonatomic) IBOutlet UILabel *lblWPSex;
@property (weak, nonatomic) IBOutlet UILabel *lblWP_DOB;
@property (weak, nonatomic) IBOutlet UILabel *lblWP_POB;
@property (weak, nonatomic) IBOutlet UILabel *lblWPLanguage;
@property (weak, nonatomic) IBOutlet UILabel *lblWPNationality;
@property (weak, nonatomic) IBOutlet UILabel *lblWPDetails;
@property (weak, nonatomic) IBOutlet UILabel *lblWPCharges;
@property (weak, nonatomic) IBOutlet UILabel *lblReward;


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
