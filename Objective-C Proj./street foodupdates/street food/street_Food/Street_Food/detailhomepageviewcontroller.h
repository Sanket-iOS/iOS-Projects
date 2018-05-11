//
//  detailhomepageviewcontroller.h
//  Street_Food
//
//  Created by Tops on 9/29/16.
//  Copyright © 2016 pinu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface detailhomepageviewcontroller : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property(strong,nonatomic) NSArray *arr1;
@property(strong,nonatomic) NSArray *arr2;
@property(strong,nonatomic) NSArray *arr3;
@property(strong,nonatomic) NSArray *arr4;
@property (strong, nonatomic) IBOutlet UIButton *btn_home;
@property (strong, nonatomic) IBOutlet UIButton *btn_category;
@property (strong, nonatomic) IBOutlet UIButton *btn_main;
@property (strong, nonatomic) IBOutlet UIButton *btn_search;
@property (strong, nonatomic) IBOutlet UIButton *btn_account;
@property (strong,nonatomic) NSString *strCat;
- (IBAction)btn_home:(id)sender;
- (IBAction)btn_category:(id)sender;
- (IBAction)btn_main:(id)sender;
- (IBAction)btn_search:(id)sender;
- (IBAction)btn_account:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *btn_addplace;
@property (strong, nonatomic) IBOutlet UIButton *btn_login;
- (IBAction)btn_login:(id)sender;
- (IBAction)btn_addplace:(id)sender;
@property (strong, nonatomic) IBOutlet UIVisualEffectView *blurview1;



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
