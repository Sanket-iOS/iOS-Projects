//
//  aboutusviewcontroller.m
//  Street_Food
//
//  Created by Tops on 9/16/16.
//  Copyright © 2016 pinu. All rights reserved.
//

#import "aboutusviewcontroller.h"
#import "homepageviewcontroller.h"
#import "home_pageviewcontroller.h"

@interface aboutusviewcontroller ()

@end

@implementation aboutusviewcontroller
@synthesize view_about;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImage * imgw = [UIImage imageNamed:@"coffee.jpg"];
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:imgw]];
    
    
    view_about.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.20];
    view_about.clipsToBounds = YES;
    view_about.layer.borderColor = [[UIColor whiteColor] colorWithAlphaComponent:0.3f].CGColor;
    view_about.layer.borderWidth = 1.0;
    view_about.layer.cornerRadius = 6.0;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btn_backaboutus:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];    


}
@end
