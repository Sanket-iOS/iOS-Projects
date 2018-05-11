//
//  complaintStatusCell.m
//  iWitness
//
//  Created by Tops on 8/27/16.
//  Copyright © 2016 MAC OS. All rights reserved.
//

#import "complaintStatusCell.h"

@implementation complaintStatusCell

- (void)awakeFromNib {
    // Initialization code
    
//    _lblComplaintDateTime.layer.cornerRadius=8;
//    _lblComplaintDateTime.layer.borderColor=[[UIColor clearColor]CGColor];
    
    _lblComplaintLetter.clipsToBounds=YES;
    _lblComplaintLetter.layer.cornerRadius=25;
    _lblComplaintLetter.backgroundColor=[self randomColor];
}

- (UIColor*) randomColor{
    //first method..
    //    int r = arc4random() % 255;
    //    int g = arc4random() % 255;
    //    int b = arc4random() % 255;
    
    int lowerBound = 45;
    int upperBound = 170;
    r = lowerBound + arc4random() % (upperBound - lowerBound);
    g = lowerBound + arc4random() % (upperBound - lowerBound);
    b = lowerBound + arc4random() % (upperBound - lowerBound);
    
    return [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:0.8];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    if (selected) {
        _lblComplaintLetter.backgroundColor=[UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:0.8];
        _linelbl.backgroundColor=[UIColor blackColor];
    }
    // Configure the view for the selected state
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated{
    [super setHighlighted:highlighted animated:animated];
    
    if (highlighted) {
        _lblComplaintLetter.backgroundColor=[UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:0.8];
        _lblComplaintLetter.highlightedTextColor=[UIColor whiteColor];
        _linelbl.backgroundColor=[UIColor blackColor];
    }
    
    
}

@end
