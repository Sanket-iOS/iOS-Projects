//
//  RSSDetailViewController.h
//  Care4Earth
//
//  Created by MAC on 3/23/15.
//  Copyright (c) 2015 disha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RSSDetailViewController : UIViewController
@property(copy,nonatomic)NSString *url;
@property (weak, nonatomic) IBOutlet UIWebView *webview;
- (IBAction)btnback:(id)sender;
@property(retain,nonatomic)NSURL *url1;
@end
