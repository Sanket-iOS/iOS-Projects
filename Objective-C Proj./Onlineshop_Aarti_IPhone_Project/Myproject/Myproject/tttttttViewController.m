//
//  tttttttViewController.m
//  Myproject
//
//  Created by mac on 3/17/15.
//  Copyright (c) 2015 disha. All rights reserved.
//

#import "tttttttViewController.h"
#import "ordViewController.h"
#import "collectionViewController.h"
#import "AppDelegate.h"
#import "loginViewController.h"


@interface tttttttViewController ()

{
    NSString *sprice;
    NSString *sname;
}
@end

@implementation tttttttViewController
@synthesize lblname,lblprice,txtdescription,txtfeature,txtstatus,image,lbldiscount;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"background.jpg"]]];
    image.image=[UIImage imageNamed:self.strpn];
    lblname.text=self.strpn1;
    sname=lblname.text;
    txtstatus.text=self.strpn2;
    txtdescription.text=self.strpn3;
    txtfeature.text=self.strpn4;
    lblprice.text=self.strpn5;
    sprice=lblprice.text;
    lbldiscount.text=self.strpn6;
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

- (IBAction)btnnext:(id)sender {
    
    ordViewController *ord=[self.storyboard instantiateViewControllerWithIdentifier:@"ord"];
    ord.st1=sname;
    ord.st2=sprice;
    [self.navigationController pushViewController:ord animated:YES];
    /*AppDelegate *ap=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    NSLog(@"%@",ap.strCuser);
    if ([ap.strCuser isEqualToString:@"CUser"]) {
        
        ordViewController *ord=[self.storyboard instantiateViewControllerWithIdentifier:@"ord"];
        ord.st1=sname;
        ord.st2=sprice;
        [self.navigationController pushViewController:ord animated:YES];

       
    }
    else{
        loginViewController *category1=[self.storyboard instantiateViewControllerWithIdentifier:@"signin"];
        [self.navigationController pushViewController:category1 animated:YES];
        
    }*/
}
@end
