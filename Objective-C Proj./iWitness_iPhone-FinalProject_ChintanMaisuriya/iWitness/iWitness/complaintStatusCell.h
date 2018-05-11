//
//  complaintStatusCell.h
//  iWitness
//
//  Created by Tops on 8/27/16.
//  Copyright © 2016 MAC OS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface complaintStatusCell : UITableViewCell{
    UIColor *color;
    int r;
    int b;
    int g;
}

@property (weak, nonatomic) IBOutlet UILabel *linelbl;
@property (weak, nonatomic) IBOutlet UILabel *lblComplaintLetter;
@property (weak, nonatomic) IBOutlet UILabel *lblCrimeType;
@property (weak, nonatomic) IBOutlet UILabel *lblComplaintStatus;
@property (weak, nonatomic) IBOutlet UILabel *lblComplaintDateTime;
@end
