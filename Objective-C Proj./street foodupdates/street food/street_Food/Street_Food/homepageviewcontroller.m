//
//  homepageviewcontroller.m
//  Street_Food
//
//  Created by Tops on 9/9/16.
//  Copyright © 2016 pinu. All rights reserved.
//
#import "ViewController.h"
#import "homepageviewcontroller.h"
#import "searchviewcontroller.h"
#import "ChangePasswordviewcontroller.h"
#import "aboutusviewcontroller.h"
#import "usersettingviewcontroller.h"


@interface homepageviewcontroller ()
{
    BOOL isSideViewOpen;
}
@end

@implementation homepageviewcontroller
@synthesize sidebar,sideview,view1,arrdata;


- (void)viewDidLoad {
    
    [super viewDidLoad];
    UIImage * imgw = [UIImage imageNamed:@"fff2.png"];
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:imgw]];
    // Do any additional setup after loading the view.
    
    arrdata =[[NSArray alloc]initWithObjects:@"Home",@"Search",@"Log In",@"Change Password",@"Log out",@"About Us ",@"User Settings", nil];
    sidebar.backgroundColor=[UIColor colorWithRed:167.0/255.0 green:56.0/255.0  blue:17.0/255.0  alpha:1];
    
    
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:imgw]];
    view1.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.50];
    view1.clipsToBounds = YES;
    view1.layer.borderColor = [[UIColor whiteColor] colorWithAlphaComponent:0.3f].CGColor;
    view1.layer.borderWidth = 1.0;
    view1.layer.cornerRadius = 6.0;
   
    
    isSideViewOpen = FALSE;
    sideview.hidden=YES;
    

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
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arrdata.count;
    
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil)
    {
        cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = [arrdata objectAtIndex:indexPath.row];
    
    return cell;
    
    
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        homepageviewcontroller *homepage =[self.storyboard instantiateViewControllerWithIdentifier:@"homepage"];
        [self.navigationController pushViewController:homepage animated:YES];
    }
    else if (indexPath.row ==1)
    {
        searchviewcontroller *searchpage =[self.storyboard instantiateViewControllerWithIdentifier:@"searchpage"];
        [self.navigationController pushViewController:searchpage animated:YES];
    }
    else if (indexPath.row ==2)
    {
        ViewController *loginpage =[self.storyboard instantiateViewControllerWithIdentifier:@"loginpage"];
        [self.navigationController pushViewController:loginpage animated:YES];

        
    }
    else if (indexPath.row ==3)
    {
        ChangePasswordviewcontroller *changepasspage =[self.storyboard instantiateViewControllerWithIdentifier:@"changepasspage"];
        [self.navigationController pushViewController:changepasspage animated:YES];
    }
    else if (indexPath.row ==4)
    {
        homepageviewcontroller *homepage =[self.storyboard instantiateViewControllerWithIdentifier:@"homepage"];
        [self.navigationController pushViewController:homepage animated:YES];
    }
    else if (indexPath.row ==5)
    {
        aboutusviewcontroller *aboutuspage =[self.storyboard instantiateViewControllerWithIdentifier:@"aboutuspage"];
        [self.navigationController pushViewController:aboutuspage animated:YES];
    }

    else if (indexPath.row ==6)
    {
        usersettingviewcontroller *usersettingpage =[self.storyboard instantiateViewControllerWithIdentifier:@"usersettingpage"];
        [self.navigationController pushViewController:usersettingpage animated:YES];
    }

    else
    {
        
    }
}


- (IBAction)menu_action:(id)sender {
    
    sideview.hidden=NO;
    sidebar.hidden =NO;
    [self.view bringSubviewToFront:sideview];
    if (!isSideViewOpen)
    {
        isSideViewOpen = TRUE;
        [sideview setFrame:CGRectMake(0, 60,0,448)];
        [sidebar setFrame:CGRectMake(0, 0, 0, 448)];
        [UIView beginAnimations:@"TableAnimation" context:NULL];
        [UIView setAnimationDelegate:self];
        [UIView setAnimationDuration: 0.2];
        [sideview setFrame:CGRectMake(0,60, 320,448)];
        [sidebar setFrame:CGRectMake(0, 0, 250,448)];
        [UIView commitAnimations];
    }
    else
    {
        isSideViewOpen = FALSE;
        
        sidebar.hidden= YES;
        sideview.hidden = YES;
        
        [sideview setFrame:CGRectMake(0,60, 320,448)];
        [sidebar setFrame:CGRectMake(0,0, 250,448)];
        [UIView beginAnimations:@"TableAnimation" context:NULL];
        [UIView setAnimationDelegate:self];
        [UIView setAnimationDuration: 0.2];
        [sideview setFrame:CGRectMake(0,60,0,448)];
        [sidebar setFrame:CGRectMake(0, 0, 0,448)];
        [UIView commitAnimations];
    }
    

}
@end
