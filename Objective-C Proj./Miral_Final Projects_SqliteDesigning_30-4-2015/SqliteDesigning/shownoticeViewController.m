//
//  shownoticeViewController.m
//  SqliteDesigning
//
//  Created by mac on 3/23/15.
//  Copyright (c) 2015 tops. All rights reserved.
//

#import "shownoticeViewController.h"

@interface shownoticeViewController ()

@end

@implementation shownoticeViewController

@synthesize notice_textview,notice_title,note,title_name;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    self.navigationItem.title=@"engineering college,gandhinagar";
    
    
    self.view.backgroundColor=[UIColor clearColor];
    
    
    notice_title.text=title_name;
    
    
    //NSURL *targetURL = [NSURL URLWithString:@"/Users/mac/Downloads/Current-Affairs-January-PDF-Capsule-2015-By-AffairsCloud1-2.pdf"];
    
    if([[note substringToIndex:1] isEqualToString:@"/"])
    {
    
    NSURL *targetURL = [NSURL URLWithString:note];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:targetURL];
    
    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0,150,self.view.frame.size.width,self.view.frame.size.height)];
    
    
    
    [webView loadRequest:request];
    
    [self.view addSubview:webView];
    
    }
    else
    {
        notice_textview.text=note;
        
        notice_textview.backgroundColor=[UIColor clearColor];
        
    }
    
    
    
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
