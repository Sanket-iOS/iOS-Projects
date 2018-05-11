//
//  home_pageviewcontroller.h
//  Street_Food
//
//  Created by Tops on 9/21/16.
//  Copyright © 2016 pinu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "section.h"

@interface home_pageviewcontroller : UIViewController<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>
{
    
    NSOperationQueue *queue;
}
@property(strong,nonatomic) NSArray *arr1;
@property(strong,nonatomic) NSArray *arr2;
@property(strong,nonatomic) NSArray *arr3;
@property(strong,nonatomic) NSArray *arr4;


@property (nonatomic,strong) NSString *urlstring;
@property (nonatomic, strong) NSURLSessionConfiguration *defaultConfigObject;
@property (nonatomic, strong) NSURLSession *defaultSession;
@property (nonatomic, strong) NSMutableURLRequest * urlRequest;
@property (nonatomic, strong) NSString * params;
@property (nonatomic, strong) NSURLSessionDataTask * dataTask;
@property (nonatomic, strong) NSData *responsedata;
@property (nonatomic,strong) NSString * strEmailid;




@property (nonatomic, strong) NSURLSessionConfiguration *defaultConfigObject1;
@property (nonatomic, strong) NSURLSession *defaultSession1;
@property (nonatomic, strong) NSMutableURLRequest * urlRequest1;
@property (nonatomic, strong) NSString * params1;
@property (nonatomic, strong) NSURLSessionDataTask * dataTask1;



//menu
@property (weak, nonatomic) IBOutlet UIView *view_home;
@property (weak, nonatomic) IBOutlet UIView *view_homepage;
@property (weak, nonatomic) IBOutlet UIButton *btn_useraction;
@property (weak, nonatomic) IBOutlet UIVisualEffectView *blur_viewaddplace;
@property (weak, nonatomic) IBOutlet UIButton *btn_plusaction;
- (IBAction)btn_homeaction:(id)sender;
- (IBAction)btn_collectionaction:(id)sender;
- (IBAction)btn_aboutusaction:(id)sender;
- (IBAction)btn_useraccountaction:(id)sender;
- (IBAction)btn_plusaction:(id)sender;

- (IBAction)btn_searchaction:(id)sender;
- (IBAction)btn_nearbyaction:(id)sender;
- (IBAction)btn_login:(id)sender;

- (IBAction)btn_addplace:(id)sender;

@end
