//
//  userProfile_TVC.h
//  iWitness
//
//  Created by MACOS on 7/7/16.
//  Copyright © 2016 MAC OS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface userProfile_TVC : UITableViewController<UITableViewDataSource,UITableViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
{
    NSString *strGetUID;
    //NSString *setUFName;
    NSMutableArray *getUserData;
    
    NSString *uFName;
    NSString *uLName;
    NSString *uName;
    NSString *uAddress;
    NSString *uContact;
    NSString *uEmail;
    
    NSArray *imgIconArr;
    NSArray *dataIndicate;
    NSArray *datainfo;
    NSArray *exampleinfo;
    NSMutableArray *userInfo;
    NSMutableArray *user;
    
    NSString *StrUAdd;
    NSString *StrUCont;
    NSString *StrUEmail;
    UIImageView *getImgUser;
}

@property (strong, nonatomic) IBOutlet UITableView *userProfileTVC;
@property (strong, nonatomic) UIBarButtonItem *button;
@property (assign, nonatomic) BOOL setFlag;

@end
