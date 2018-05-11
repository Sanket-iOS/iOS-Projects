//
//  Complaint.h
//  iWitness
//
//  Created by MACOS on 7/26/16.
//  Copyright © 2016 MAC OS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <QBImagePickerController.h>
#import "PagedImageScrollView.h"

@interface Complaint : UIViewController<NSURLSessionDataDelegate,CLLocationManagerDelegate,UIGestureRecognizerDelegate,UITextFieldDelegate,UITextViewDelegate,QBImagePickerControllerDelegate>{
    QBImagePickerController *pickCImg;
    CLLocationManager *locationManager;
    CLLocation *currentLocation;
    CLPlacemark *placemark;
    CLGeocoder *geoCoder;
    
    NSMutableArray *getData;
    NSMutableArray *getCrimeTypesID;
    NSString *getCTID;
    NSMutableArray *getCrimeTypes;
    
    NSMutableArray *setIMGs;
    NSArray *setImg;
    NSMutableString *strSetIMGs;
    NSMutableString *strFinalPathIMGs;
    
    
    NSString *date, *time;
    BOOL flag,checkPS;
    
    NSMutableArray *getNearestPS;
    NSMutableArray *distancedt;
    NSString *strGetPSID;
    NSString *strGetUID;
    
    NSMutableData *receiveData;
    NSString *myString;

}
@property (weak, nonatomic) IBOutlet UITextField *txtSetCT;
@property (weak, nonatomic) IBOutlet UIButton *imgSelectCT;

@property (weak, nonatomic) IBOutlet UILabel *lblPlaceHolderText;
@property (weak, nonatomic) IBOutlet UITextView *txtViewComplaint;
@property (weak, nonatomic) IBOutlet UIView *viewInitial;

@property (weak, nonatomic) IBOutlet UIButton *btnAddImg;
@property (weak, nonatomic) IBOutlet UIButton *btnAddVideo;
@property (weak, nonatomic) IBOutlet UIButton *btnAddAudio;

@property (weak, nonatomic) IBOutlet UIScrollView *imgScrollView;
@property (weak, nonatomic) IBOutlet UIImageView *cmplntImg1;
@property (weak, nonatomic) IBOutlet UIImageView *cmplntImg2;
@property (weak, nonatomic) IBOutlet UIImageView *cmplntImg3;
@property (weak, nonatomic) IBOutlet UIImageView *cmplntImg4;

@property (weak, nonatomic) IBOutlet UIView *detailView;
@property (weak, nonatomic) IBOutlet UILabel *lblDate;
@property (weak, nonatomic) IBOutlet UILabel *lblTime;
@property (weak, nonatomic) IBOutlet UILabel *lblCurrentLocation;
@property (weak, nonatomic) IBOutlet UILabel *lblNearestPS;
@property (weak, nonatomic) IBOutlet UILabel *lblPSDistanceInfo;


- (IBAction)imgSelectCT:(id)sender;
- (IBAction)btnAddImg:(id)sender;
- (IBAction)btnAddVideo:(id)sender;
- (IBAction)btnAddAudio:(id)sender;
- (IBAction)sendComplaint:(id)sender;

@end
