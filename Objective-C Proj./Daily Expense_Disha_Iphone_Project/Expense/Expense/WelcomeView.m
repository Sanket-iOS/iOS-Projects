//
//  WelcomeView.m
//  Expense
//
//  Created by mac on 4/10/15.
//  Copyright (c) 2015 tops. All rights reserved.
//

#import "WelcomeView.h"
#import "DrawPatternLockViewController.h"
@interface WelcomeView ()

@end

@implementation WelcomeView

- (void)viewDidLoad {
    
    [super viewDidLoad];
    DrawPatternLockViewController *lockVC = [[DrawPatternLockViewController alloc] init];
    [lockVC setTarget:self withAction:@selector(lockEntered:)];
    [self presentModalViewController:lockVC animated:YES];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)lockEntered:(NSString*)key {
    //  NSLog(@"key: %@", key);
    
    if (![key isEqualToString:@"010206080704"]) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                            message:@"Wrong pattern!"
                                                           delegate:nil
                                                  cancelButtonTitle:nil
                                                  otherButtonTitles:@"OK", nil];
        [alertView show];
    }
    else
        [self dismissModalViewControllerAnimated:YES];
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

@end
