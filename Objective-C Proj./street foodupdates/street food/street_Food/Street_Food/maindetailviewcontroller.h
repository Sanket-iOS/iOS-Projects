//
//  maindetailviewcontroller.h
//  Street_Food
//
//  Created by Jaina Bhavsar on 08/07/1938 Saka.
//  Copyright © 1938 Saka pinu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface maindetailviewcontroller : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>
@property (strong,nonatomic) NSArray *arrdata;
@property (strong,nonatomic) NSArray *arrname;
@property (weak, nonatomic) IBOutlet UIView *blur_view;
- (IBAction)btn_back:(id)sender;
- (IBAction)btn_heart5:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *btn5;
@property (strong, nonatomic) IBOutlet UIButton *btn4;
@property (strong, nonatomic) IBOutlet UIButton *btn3;
@property (strong, nonatomic) IBOutlet UIButton *btn2;
@property (strong, nonatomic) IBOutlet UIButton *btn1;
@property (strong, nonatomic) IBOutlet UIScrollView *scrl_view;
@property (strong, nonatomic) IBOutlet UITableView *table_view1;
- (IBAction)btn_addcomment:(id)sender;
-(void)Addrate;
@property(strong,nonatomic) NSArray *arr1;
@property (strong, nonatomic) IBOutlet UITextView *txt_comment;
@property (weak, nonatomic) IBOutlet UILabel *lblrt;

- (IBAction)btnrat:(id)sender;

@property(nonatomic,strong) NSMutableDictionary *arrPlaceDetails;

@property (nonatomic,strong) NSString *urlstring;
@property (nonatomic, strong) NSURLSessionConfiguration *defaultConfigObject;
@property (nonatomic, strong) NSURLSession *defaultSession;
@property (nonatomic, strong) NSMutableURLRequest * urlRequest;
@property (nonatomic, strong) NSString * params;
@property (nonatomic, strong) NSURLSessionDataTask * dataTask;
@property (nonatomic, strong) NSData *responsedata;
@property (nonatomic,strong) NSString * strEmailid;
@property (strong, nonatomic) IBOutlet UITableView *tbl_view;




@property (nonatomic, strong) NSURLSessionConfiguration *defaultConfigObject1;
@property (nonatomic, strong) NSURLSession *defaultSession1;
@property (nonatomic, strong) NSMutableURLRequest * urlRequest1;
@property (nonatomic, strong) NSString * params1;
@property (nonatomic, strong) NSURLSessionDataTask * dataTask1;



@end
