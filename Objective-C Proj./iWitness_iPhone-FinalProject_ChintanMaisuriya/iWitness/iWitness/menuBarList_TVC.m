//
//  menuBarList_TVC.m
//  iWitness
//
//  Created by MACOS on 6/20/16.
//  Copyright © 2016 MAC OS. All rights reserved.
//

#import "menuBarList_TVC.h"
#import "menuBarCustCell.h"
#import "menuBarListCell.h"
#import "HomeTab.h"
#import "userProfile_TVC.h"
#import "Feedbacks.h"
#import "SWRevealViewController.h"

@interface menuBarList_TVC ()

@end

@implementation menuBarList_TVC
{
    NSString *uFName;
    NSString *uLName;
    NSString *setUFName;
    NSString *strGetUID;
    NSArray *userData;
    NSString *uImgCheck;
    UIImage *uPic;
    
}
@synthesize menubarListTVC;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    NSUserDefaults *uDef = [NSUserDefaults standardUserDefaults];
    strGetUID=[uDef valueForKey:@"UID"];
    
    NSString *strUP = [NSString stringWithFormat:@"http://localhost/iWitness_WS/userProfile.php?uID=%@",strGetUID];
    NSURL *urlUP = [NSURL URLWithString:strUP];
    NSURLRequest *urlReqUP = [NSURLRequest requestWithURL:urlUP];
    NSURLSession *upSession = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *upSDTask = [upSession dataTaskWithRequest:urlReqUP completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        getUserData = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
        
        dispatch_async(dispatch_get_main_queue(), ^{[menubarListTVC reloadData];});
        
        if ([getUserData count]>0) {
            uFName=[[getUserData valueForKey:@"UName"]objectAtIndex:0];
            uLName=[[getUserData valueForKey:@"USurname"]objectAtIndex:0];
            setUFName=[NSString stringWithFormat:@"%@ %@",uFName, uLName];
            
            NSString *imgCheck = [[getUserData valueForKey:@"UProfilePic"]objectAtIndex:0];

            if (![imgCheck isEqual:[NSNull null]]&& ![imgCheck isEqual:@""]) {
                uPic = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[[getUserData valueForKey:@"UProfilePic"]objectAtIndex:0]]]];
            }else{
                uPic = [UIImage imageNamed:@"person1.png"];
            }
        }
    }];
    [upSDTask resume];
    
    arrMLNames = [[NSArray alloc]initWithObjects:@"Home",@"Feedback", nil];
    arrMLImgs = [[NSArray alloc]initWithObjects:@"Home1.png",@"feedback.png", nil];
    
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    self.tableView.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Background.jpg"]];
    self.tableView.backgroundView.alpha = 0.95f;
//    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
//    self.tableView.separatorColor = [UIColor whiteColor];

}

-(void)viewDidAppear:(BOOL)animated{
    [self viewDidLoad];
}

-(void)viewWillAppear:(BOOL)animated{
    [self viewDidLoad];
    self.navigationController.navigationBarHidden=NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
     //#warning Incomplete implementation, return the number of sections
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
     //#warning Incomplete implementation, return the number of rows
    
    if (section==0) {
        return 1;
    }
    else{
        return arrMLNames.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    tableView.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    tableView.separatorColor = [UIColor whiteColor];
    
    if (indexPath.section==0) {
       menuBarCustCell *cell = [tableView dequeueReusableCellWithIdentifier:@"c1"];
        cell.backgroundView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"profileback1.jpg"]];
        cell.selectedBackgroundView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"profileback1.jpg"]];
        cell.backgroundView.alpha=0.9f;
        //cell.layer.borderWidth=1.0f;
        //cell.layer.borderColor = [[UIColor whiteColor] CGColor];
        
        cell.imgUser.layer.cornerRadius=30;
        cell.imgUser.layer.masksToBounds=true;
        cell.imgUser.layer.borderWidth=2.0f;
        cell.imgUser.layer.borderColor=[[UIColor whiteColor] CGColor];
        cell.imgUser.image=uPic;
        
        cell.lblUFName.text=setUFName;
        cell.separatorInset=UIEdgeInsetsMake(0.f, 0.f, 0.f, 0.f);
       return cell;
    }
    else{
        menuBarListCell *listCell = [tableView dequeueReusableCellWithIdentifier:@"c2"];
        listCell.Img_menuList.image = [UIImage imageNamed:[arrMLImgs objectAtIndex:indexPath.row]];
        listCell.lbl_menuList.text= [arrMLNames objectAtIndex:indexPath.row];
        
        //self.tableView.separatorStyle=UITableViewCellSeparatorStyleNone; //<-- to remove separator line from whole table
        if (indexPath.row==0) {
            listCell.separatorInset=UIEdgeInsetsMake(0.f, 0.f, 0.f, 0.f);
        }else{
            listCell.separatorInset = UIEdgeInsetsMake(0, listCell.bounds.size.width, 0, 0);
        }
        listCell.selectionStyle=UITableViewCellSelectionStyleDefault;
        listCell.Img_menuList.tintColor = [UIColor colorWithRed:0.3f green:0.8f blue:0.9f alpha:1.0f];
        listCell.lbl_menuList.highlightedTextColor=[UIColor colorWithRed:0.3f green:0.8f blue:0.9f alpha:1.0f];
        
        return listCell;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==1){
         return  40.1;
    }else{
        return 135.1;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //SWRevealViewController *rvc = self.revealViewController;
    
    if (indexPath.section==0) {
        userProfile_TVC *rootViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"up_SB"];
        rootViewController.setFlag = YES;
        UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:rootViewController];
        [navController setViewControllers: @[rootViewController] animated: YES];
        
        [self.revealViewController setFrontViewController:navController];
        [self.revealViewController setFrontViewPosition: FrontViewPositionLeft animated: YES];

    }else if (indexPath.section==1){
        
       if (indexPath.row==0) {
           
        HomeTab *navHomeTab = [self.storyboard instantiateViewControllerWithIdentifier:@"mainTabBar"];
        [self.revealViewController setFrontViewController:navHomeTab animated:YES];
           
       }else if (indexPath.row==1) {
           
           Feedbacks *rootViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"feedbacks_SB"];
           rootViewController.setFlag=YES;
           UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:rootViewController];
           [navController setViewControllers: @[rootViewController] animated: YES];
           
           [self.revealViewController setFrontViewController:navController];
           [self.revealViewController setFrontViewPosition: FrontViewPositionLeft animated: YES];
           
           //Feedbacks *navFB =[self.storyboard instantiateViewControllerWithIdentifier:@"feedbacks_SB"];
           //[self.revealViewController setFrontViewController:navFB animated:YES];
       }
  }
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
