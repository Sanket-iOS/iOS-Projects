//
//  MyPetitionInnerViewController.m
//  Care4Earth
//
//  Created by tops on 2/13/15.
//  Copyright (c) 2015 disha. All rights reserved.
//

#import "MyPetitionInnerViewController.h"
#import "PetitionHomeViewController.h"
@interface MyPetitionInnerViewController ()

@end

@implementation MyPetitionInnerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
     //self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"simple-green-powerpoint-template.jpg"]];
    [self.navigationItem setHidesBackButton:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(alertView.tag == 100)
    {
        if(buttonIndex == 0)
        {
            PetitionHomeViewController *pet=[[PetitionHomeViewController alloc]initWithNibName:@"PetitionHomeViewController" bundle:nil];
            [self.navigationController pushViewController:pet animated:YES];
        }
        
    }
}

- (IBAction)btnClose:(id)sender {
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Closed" message:@"Petition Closed" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    alert.tag  =100;
    [alert show];
}

- (IBAction)btnBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
