//
//  CollectionViewCell.h
//  Street_Food
//
//  Created by Jaina Bhavsar on 08/07/1938 Saka.
//  Copyright © 1938 Saka pinu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionViewCell : UICollectionViewCell
@property (strong, nonatomic) IBOutlet UIImageView *image_view;
@property (strong, nonatomic) IBOutlet UILabel *lbl_catname;

@end
