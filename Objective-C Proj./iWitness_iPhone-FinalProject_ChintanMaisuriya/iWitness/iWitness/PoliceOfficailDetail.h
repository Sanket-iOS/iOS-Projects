//
//  PoliceOfficailDetail.h
//  iWitness
//
//  Created by MACOS on 9/1/16.
//  Copyright © 2016 MAC OS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PoliceOfficailDetail : UIViewController{
    NSArray *getPODetails;
}
@property (weak, nonatomic) IBOutlet UIView *viewPOInfo;
@property (weak, nonatomic) IBOutlet UIImageView *imgPO;
@property (weak, nonatomic) IBOutlet UILabel *lblPOName;
@property (weak, nonatomic) IBOutlet UILabel *lblPOPost;
@property (weak, nonatomic) IBOutlet UILabel *lblPOContact;

@end
