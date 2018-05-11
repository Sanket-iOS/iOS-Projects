//
//  searchviewcontroller.h
//  Street_Food
//
//  Created by Tops on 9/9/16.
//  Copyright © 2016 pinu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface searchviewcontroller : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate,UISearchBarDelegate>
{
    AppDelegate *appdel;
}

@property (weak, nonatomic) IBOutlet UIButton *btn_search;
@property (weak, nonatomic) IBOutlet UITextField *txt_search;
@property (weak, nonatomic) IBOutlet UIImageView *view_search;
- (IBAction)btn_searchaction:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *btn_backsearch;
- (IBAction)btn_backsearchh:(id)sender;
@property (strong,nonatomic) NSArray *arrdata;
@property (strong,nonatomic) NSArray *arrname;


@property (nonatomic,strong) NSString *urlstring;
@property (nonatomic, strong) NSURLSessionConfiguration *defaultConfigObject;
@property (nonatomic, strong) NSURLSession *defaultSession;
@property (nonatomic, strong) NSMutableURLRequest * urlRequest;
@property (nonatomic, strong) NSString * params;
@property (nonatomic, strong) NSURLSessionDataTask * dataTask;
@property (nonatomic, strong) NSData *responsedata;

@end
