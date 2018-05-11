//
//  ComplaintStatusDetail.h
//  iWitness
//
//  Created by MACOS on 8/30/16.
//  Copyright © 2016 MAC OS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "PagedImageScrollView.h"

@interface ComplaintStatusDetail : UIViewController<UIGestureRecognizerDelegate>{
    
    NSString *getLattitude;
    double latdouble;
    NSString *getLongitude;
    double londouble;
    
    NSArray *getCSDetails, *getPSName, *getPOName, *getCIMGs;
    NSMutableArray *setIMGs;
    NSArray *setImg;
    
    NSMutableArray *setPOInfo;
}

@property (weak, nonatomic) IBOutlet UIScrollView *csDetailScroll;

@property (weak, nonatomic) IBOutlet UILabel *lblComplaintNo;
@property (weak, nonatomic) IBOutlet UILabel *lblDate;
@property (weak, nonatomic) IBOutlet UILabel *lblPoliceStation;
@property (weak, nonatomic) IBOutlet UILabel *lblAssigned;

@property (weak, nonatomic) IBOutlet UILabel *lblComplaintDate;
@property (weak, nonatomic) IBOutlet UILabel *lblComplaintTime;
@property (weak, nonatomic) IBOutlet UILabel *lblSentLocation;
@property (weak, nonatomic) IBOutlet UILabel *lblCrimeType;
@property (weak, nonatomic) IBOutlet UILabel *lblComplaintDetails;

@property (weak, nonatomic) IBOutlet UIScrollView *imgScrollView;
@property (weak, nonatomic) IBOutlet UIImageView *cmplntImg1;
@property (weak, nonatomic) IBOutlet UIImageView *cmplntImg2;
@property (weak, nonatomic) IBOutlet UIImageView *cmplntImg3;
@property (weak, nonatomic) IBOutlet UIImageView *cmplntImg4;

@property (weak, nonatomic) IBOutlet UIImageView *imgPO;
@property (weak, nonatomic) IBOutlet UIButton *btnPOInfo;

- (IBAction)btnPOInfo:(id)sender;


@end
