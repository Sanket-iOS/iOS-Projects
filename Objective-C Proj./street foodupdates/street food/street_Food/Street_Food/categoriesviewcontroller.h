//
//  categoriesviewcontroller.h
//  Street_Food
//
//  Created by Tops on 9/23/16.
//  Copyright © 2016 pinu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface categoriesviewcontroller : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate>


@property (weak, nonatomic) IBOutlet UICollectionView *collectionview;
- (IBAction)btn_backaction:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *view_catgory;

@property (strong,nonatomic) NSArray *arrdata;
@property (strong,nonatomic) NSArray *arrname;
- (IBAction)btn_home:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *btn_category;
@property (strong, nonatomic) IBOutlet UIButton *btn_main;
@property (strong, nonatomic) IBOutlet UIButton *btn_search;
@property (strong, nonatomic) IBOutlet UIButton *btn_account;
- (IBAction)btn_category:(id)sender;
- (IBAction)btn_main:(id)sender;
- (IBAction)btn_search:(id)sender;
- (IBAction)btn_account:(id)sender;
@property (strong, nonatomic) IBOutlet UIVisualEffectView *blur_view;
@property (strong, nonatomic) IBOutlet UICollectionView *btn_addplace;
@property (strong, nonatomic) IBOutlet UICollectionView *btn_login;
- (IBAction)btn_addplace:(id)sender;
- (IBAction)btn_login:(id)sender;





@end
