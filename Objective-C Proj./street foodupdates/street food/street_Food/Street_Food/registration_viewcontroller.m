//
//  registration_viewcontroller.m
//  Street_Food
//
//  Created by pinu on 08/09/16.
//  Copyright © 2016 pinu. All rights reserved.
//

#import "registration_viewcontroller.h"

@interface registration_viewcontroller ()

@end

@implementation registration_viewcontroller

//@synthesize lbl_reg,txt_email,txt_mbno,btn_signin,reg_view;

- (void)viewDidLoad {
  /*  [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //background image
    [super viewDidLoad];
    UIImage * imgw = [UIImage imageNamed:@"fff2.png"];
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:imgw]];
    //animation code for roundcurve
    UIView *registrationView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
    txt_email.leftView = registrationView;
    txt_email .leftViewMode = UITextFieldViewModeAlways;
    txt_email.layer.cornerRadius = 2.0;
    txt_email.clipsToBounds = YES;
    
    UIView *regView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
    txt_mbno.leftView = regView;
    txt_mbno.leftViewMode = UITextFieldViewModeAlways;
    txt_mbno.layer.cornerRadius = 2.0;
    txt_mbno.clipsToBounds = YES;
    
    btn_signin.layer.cornerRadius = 5.0;
    btn_signin .clipsToBounds = YES;
    
    regView.layer.cornerRadius = 15.0;
    regView.clipsToBounds = YES;
    
  */

}

- (void)didReceiveMemoryWarning {
    //[super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)mbno_action:(id)sender
{
    /*
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position.x";
    animation.values = @[ @0, @10, @-10, @10, @0 ];
    animation.keyTimes = @[ @0, @(1 / 6.0), @(3 / 6.0), @(5 / 6.0), @1 ];
    animation.duration = 0.4;
    
    animation.additive = YES;
    
    [txt_mbno.layer addAnimation:animation forKey:@"shake"];
    
    */
}

- (IBAction)reg_action:(id)sender
{
    
}


@end
