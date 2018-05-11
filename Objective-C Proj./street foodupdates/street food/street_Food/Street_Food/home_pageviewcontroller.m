//
//  home_pageviewcontroller.m
//  Street_Food
//
//  Created by Tops on 9/21/16.
//  Copyright © 2016 pinu. All rights reserved.
//

#import "home_pageviewcontroller.h"
#import "imageHomeCellTableViewCell.h"
#import "aboutusviewcontroller.h"
#import "usersettingviewcontroller.h"
#import "searchviewcontroller.h"
#import "categoriesviewcontroller.h"
#import "accountviewcontroller.h"
#import "ViewController.h"
#import "addplaceviewcontroller.h"
#import "ChangePasswordviewcontroller.h"
#import "detailhomepageviewcontroller.h"
#import "maindetailviewcontroller.h"
#import "mapviewcontroller.h"
#import "TopPlaceTableViewCell.h"
#import "googlemap.h"
#import "AppDelegate.h"
#import "Registrationviewcontroller.h"

@interface home_pageviewcontroller ()
{
    NSMutableArray *arrl;
    NSArray *titles;
    TopPlaceTableViewCell *topCell;
    
    NSMutableArray *arrAllData, *arrCatData, *arrC, *arrCat;
    
    BOOL isSideViewOpen;
    BOOL isLoaded;
    
    NSMutableArray *arrTopPlaces;
    
    __weak IBOutlet UILabel *lblToppl;
    AppDelegate *appDel;

}
@property (weak, nonatomic) IBOutlet UITableView *tblTopPlaces;
@property (weak, nonatomic) IBOutlet UITableView *tblDataIs;
@property (weak, nonatomic) IBOutlet UIVisualEffectView *actView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *act;
@end

@implementation home_pageviewcontroller
@synthesize view_home,view_homepage;
@synthesize blur_viewaddplace;

@synthesize description,defaultConfigObject,defaultSession,urlRequest,params,urlstring,dataTask;

- (void)viewDidLoad
{
    [super viewDidLoad];
    isLoaded = YES;
    [_actView setHidden:NO];
    [_act startAnimating];
    arrAllData = [[NSMutableArray alloc]init];
    view_homepage.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.20];
    view_homepage.clipsToBounds = YES;
    view_homepage.layer.borderColor = [[UIColor whiteColor] colorWithAlphaComponent:0.3f].CGColor;
    view_homepage.layer.borderWidth = 1.0;
    view_homepage.layer.cornerRadius = 6.0;
    //Start Code
    defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    defaultSession = [NSURLSession sessionWithConfiguration: defaultConfigObject delegate: nil delegateQueue: [NSOperationQueue mainQueue]];
    
//*url = [NSURL URLWithString:@"http://studentzone.16mb.com/selectCat.php"];

    urlRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://studentzone.16mb.com/selectPlaces.php"]];
//    
 //   params =[NSString stringWithFormat:@"login=1",[[arrCat objectAtIndex:cati] objectForKey:@"categoryName"]];
//    
    [urlRequest setHTTPMethod:@"POST"];
//    
// //   [_urlRequest1 setHTTPBody:[params dataUsingEncoding:NSUTF8StringEncoding]];
dataTask =[defaultSession dataTaskWithRequest:urlRequest
                                    completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                        _responsedata = data;
                                        NSLog(@"Response:%@ %@\n", response, error);
                                        if(error == nil)
                                        {
                                            NSString * text = [[NSString alloc] initWithData: data encoding: NSUTF8StringEncoding];
                                            NSLog(@"Data = %@",text);
                                            
                                            arrAllData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                                            
                                            NSMutableArray *arr1,*arr2,*arr3,*arr4,*arr5,*arr6,*arr7,*arr8;
                                            
                                            
                                            arr8 = [[NSMutableArray alloc]init];
                                            arr1 = [[NSMutableArray alloc]init];
                                            arr2 = [[NSMutableArray alloc]init];
                                            arr3 = [[NSMutableArray alloc]init];
                                            arr4 = [[NSMutableArray alloc]init];
                                            arr5 = [[NSMutableArray alloc]init];
                                            arr6 = [[NSMutableArray alloc]init];
                                            arr7 = [[NSMutableArray alloc]init];
                                            
                                       
                                                for (int j=0; j<arrAllData.count; j++) {
                                                    
                                                    NSDictionary *dtemp = [arrAllData objectAtIndex:j];
                                                    
                                                    NSString *strMatch = [[arrAllData objectAtIndex:j] objectForKey:@"CatName"];
                                                    if([strMatch isEqualToString:@"Breakfast"])
                                                    {
                                                        [arr1 addObject:dtemp];
                                                        continue;
                                                    }
                                                    else if ([strMatch isEqualToString:@"Chiness"])
                                                    {
                                                        
                                                        [arr2 addObject:dtemp];continue;
                                                    }
                                                    
                                                    else if ([strMatch isEqualToString:@"Punjabi"])
                                                    {
                                                        [arr3 addObject:dtemp];continue;
                                                        
                                                    }
                                                    
                                                    else if ([strMatch isEqualToString:@"South Indian"])
                                                    {
                                                        
                                                        [arr4 addObject:dtemp];continue;                                                    }
                                                    
                                                    
                                                    else if ([strMatch isEqualToString:@"Snacks"])
                                                    {
                                                        
                                                        [arr5 addObject:dtemp];continue;                                                    }
                                                    
                                                    else if ([strMatch isEqualToString:@"Mocktails"])
                                                    {
                                                        
                                                        [arr6 addObject:dtemp];continue;                                                    }
                                                    
                                                    
                                                    else if ([strMatch isEqualToString:@"Coffee-Tea Zone"])
                                                    {
                                                        
                                                        [arr7 addObject:dtemp];continue;
                                                    }
                                                    
                                                    
                                                    else if ([strMatch isEqualToString:@"Ice Cream"])
                                                    {
                                                        
                                                        [arr8 addObject:dtemp];continue;
                                                    }
                                                    
                                                    
                                                
                                                
                                            }
                                            //arrAllData = [[NSMutableArray alloc]initWithObjects:arr1,arr2,arr3,arr4,arr5,arr6,arr7,arr8, nil];
                                            [_act setHidden:YES];
                                            [_actView setHidden:YES];

                                            [_tblDataIs reloadData];
                                            //[arrAllData addObject:dictArr];
                                            
                                        }
                                    }];
   
    [dataTask resume];
    
    
    
    //Start Code
    defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    defaultSession = [NSURLSession sessionWithConfiguration: defaultConfigObject delegate: nil delegateQueue: [NSOperationQueue mainQueue]];
    
    //*url = [NSURL URLWithString:@"http://studentzone.16mb.com/selectCat.php"];
    
    urlRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://studentzone.16mb.com/select.php"]];
    //
    params = @"Query=Select * from tblplace where sRate>3";
    //
    [urlRequest setHTTPMethod:@"POST"];
    //
    [urlRequest setHTTPBody:[params dataUsingEncoding:NSUTF8StringEncoding]];
    //
    
    
    
    dataTask =[defaultSession dataTaskWithRequest:urlRequest
                                completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                    _responsedata = data;
                                    NSLog(@"Response:%@ %@\n", response, error);
                                    if(error == nil)
                                    {
                                        NSString * text = [[NSString alloc] initWithData: data encoding: NSUTF8StringEncoding];
                                        NSLog(@"Data = %@",text);
                                        
                                        arrTopPlaces = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                                        if(arrTopPlaces.count==0)
                                        {
                                            lblToppl.text = @"No Top Places";
                                        }
                                       
                                        [_tblTopPlaces reloadData];
                                        
                                     
                                        
                                    }
                                }];
    
    [dataTask resume];

   

   // NSLog(@"\n\n%@\n\n",arrAllData);
    //end code
    //NSLog(@"\n\n\nreal Data :%@\n\n\n",arrAllData);
//    imagecode//need to change
//    arr1 =[[NSArray alloc]initWithObjects:@"bhelpuri1.jpg",@"rasranjan.jpg",@"",@"", nil];
//    arr2 =[[NSArray alloc]initWithObjects:@"vadapav.jpg.jpg",@"panipuri2.jpg",@"",@"", nil];
//    arr3 =[[NSArray alloc]initWithObjects:@"tea1.jpg",@"coffee1.jpg",@"",@"", nil];
//


    
    
//    arrl  = [[NSMutableArray alloc]init];
//    [arrl addObject:arr1];
//    [arrl addObject:arr2];
//    [arrl addObject:arr3];
    
    
    titles = [[NSArray alloc]initWithObjects:@" New Place ",@"PoPular",@"Tea & Coffee", nil];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{

  //  [_tblDataIs setHidden:YES];
   // [_actView setHidden:NO];
    
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    [_tblDataIs setHidden:NO];
    [_actView setHidden:YES];
    
}
//-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
//    [_tblDataIs setHidden:NO];
//    [_actView setHidden:YES];
//
//}
//-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
//    //[dataTask resume];
//    [_tblDataIs setHidden:NO];
//    [_actView setHidden:YES];
//}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if(tableView.tag==7878){
        return arrTopPlaces.count;
    }
    if(arrAllData==nil){
        return 0;
    }
    return arrAllData.count;//arrAllData.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(tableView.tag==7878){
        return 1;
    }
    NSLog(@"%lu",(unsigned long)[[arrAllData objectAtIndex:section]count]);
    return [[arrAllData objectAtIndex:section]count];//[[arrAllData objectAtIndex:section] count];//[[arrl objectAtIndex:section] count];
}
- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    
    if(tableView.tag==7878){
    return [[arrTopPlaces objectAtIndex:section] objectForKey:@"Area"];
    }
    
    
    return [[arrC objectAtIndex:section] objectForKey:@"CatName"];
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//    UITableViewHeaderFooterView *view1=[tableView headerViewForSection:section];// [[[tableView headerViewForSection:0] textLabel]setFont:[UIFont fontWithName:@"" size:50.0f]];
//    [view1.textLabel setFont:[UIFont fontWithName:@"System" size:550.0f]];
    
    
    if(tableView.tag==7878){
        return nil;
    }
  arrC= [[NSMutableArray alloc]initWithObjects:@"Breakfast",@"Chiness",@"Punjabi",@"South Indian",@"Snacks",@"Mocktails",@"Coffee-Tea Zone",@"Ice Cream", nil];
    UILabel *myLabel = [[UILabel alloc] init];
    myLabel.frame = CGRectMake(20, 8, 320, 20);
    myLabel.font = [UIFont boldSystemFontOfSize:20];
    myLabel.text =[arrC objectAtIndex:section] ;//[self tableView:tableView titleForHeaderInSection:section];
    UIView *headerView = [[UIView alloc] init];
    NSLog(@"aaa %@",myLabel.text);
    [headerView addSubview:myLabel];
    
    return headerView;
    //return view1;
}

//navigation code

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if(tableView.tag==7878){
        detailhomepageviewcontroller *deatailhomepage =[self.storyboard instantiateViewControllerWithIdentifier:@"detailhomepage"];
        deatailhomepage.strCat = [[arrAllData objectAtIndex:indexPath.row] objectForKey:@"CatName"]; //[arrC objectAtIndex:indexPath.row];
        [self.navigationController pushViewController:deatailhomepage animated:YES];
    }
    
   /* if(tableView.tag==7878){
        //return 0;
    }
    else{
    if(indexPath.section == 0)
    {
        if (indexPath.row == 0)
        {
            detailhomepageviewcontroller *deatailhomepage =[self.storyboard instantiateViewControllerWithIdentifier:@"detailhomepage"];
            [self.navigationController pushViewController:deatailhomepage animated:YES];
        }
        else if (indexPath.row ==1)
        {
            detailhomepageviewcontroller *deatailhomepage =[self.storyboard instantiateViewControllerWithIdentifier:@"detailhomepage"];
            [self.navigationController pushViewController:deatailhomepage animated:YES];

        }
    }
    else if (indexPath.section == 1)
    {
        if (indexPath.row == 0)
        {
            detailhomepageviewcontroller *deatailhomepage =[self.storyboard instantiateViewControllerWithIdentifier:@"detailhomepage"];
            [self.navigationController pushViewController:deatailhomepage animated:YES];
        }
        else if (indexPath.row ==1)
        {
            detailhomepageviewcontroller *deatailhomepage =[self.storyboard instantiateViewControllerWithIdentifier:@"detailhomepage"];
            [self.navigationController pushViewController:deatailhomepage animated:YES];
        }

    }
    else if (indexPath.section == 2)
    {
        if (indexPath.row == 0)
        {
            detailhomepageviewcontroller *deatailhomepage =[self.storyboard instantiateViewControllerWithIdentifier:@"detailhomepage"];
            [self.navigationController pushViewController:deatailhomepage animated:YES];
                    }
        else if (indexPath.row ==1)
        {
            detailhomepageviewcontroller *deatailhomepage =[self.storyboard instantiateViewControllerWithIdentifier:@"detailhomepage"];
            [self.navigationController pushViewController:deatailhomepage animated:YES];
        }
        
    }
    else if (indexPath.section == 3)
    {
        if (indexPath.row == 0)
        {
            aboutusviewcontroller *aboutuspage =[self.storyboard instantiateViewControllerWithIdentifier:@"aboutuspage"];
            [self.navigationController pushViewController:aboutuspage animated:YES];
        }
        else if (indexPath.row ==1)
        {
            searchviewcontroller *searchpage =[self.storyboard instantiateViewControllerWithIdentifier:@"searchpage"];
            [self.navigationController pushViewController:searchpage animated:YES];
        }
        
    }

    }*/
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   // if(tableView.tag==7878){
        
        topCell= [tableView dequeueReusableCellWithIdentifier:@"topcell"];
        [topCell.lblRate setText:[NSString stringWithFormat:@"Rate is :%@",[[arrTopPlaces objectAtIndex:indexPath.section] objectForKey:@"sRate"]]];
    NSLog(@"%@",arrAllData.description);
 //[topCell.lblCate setText:[NSString stringWithFormat:@"Rate is :%@",[[arrAllData objectAtIndex:indexPath.section] objectForKey:@"CatName"]]];
    topCell.lblCate.text=[[arrAllData objectAtIndex:indexPath.row] objectForKey:@"CatName"];

    
    dispatch_async(backgroundQueue(), ^{
            
            NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://studentzone.16mb.com/uploads/%@",[[arrTopPlaces objectAtIndex:indexPath.section] objectForKey:@"imageUrl"]]];
            
            UIImage *img =[self downloadimg:url];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [topCell.imgBoxnew setImage:img];
                
            });
            
            
        });

        return topCell;
   // }
    imageHomeCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    //NSArray *sec = [arrl objectAtIndex:indexPath.section];
   // if(indexPath.row%2 == 0){
    [cell.actLoad setHidden:NO];
    //[cell.imgBox setHidden:YES];
    [cell.imgBox setImage:[UIImage imageNamed:@"wait.png"]];
      [cell.actLoad startAnimating];
    NSLog(@"%@",[[[arrAllData objectAtIndex:indexPath.section] objectAtIndex:indexPath.row] objectForKey:@"PlaceName"]);
    [cell.lblText setText:[[[arrAllData objectAtIndex:indexPath.section] objectAtIndex:indexPath.row] objectForKey:@"PlaceName"]];
    // [cell.lblCate setText:[[[arrAllData objectAtIndex:indexPath.section] objectAtIndex:indexPath.row] objectForKey:@"CatName"]];
    dispatch_async(backgroundQueue(), ^{
        
        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://studentzone.16mb.com/uploads/%@",[[[arrAllData objectAtIndex:indexPath.section] objectAtIndex:indexPath.row]objectForKey:@"imageUrl"]]];
        
        UIImage *img =[self downloadimg:url];
        
        dispatch_async(dispatch_get_main_queue(), ^{
          
            [cell.imgBox setImage:img];
            [cell.actLoad stopAnimating];
            
            [cell.actLoad setHidden:YES];
            [cell.imgBox setHidden:NO];
            
        });
        
        
    });

   // if(indexPath.section==arrAllData.count-1)
    //{
        //[tableView setScrollEnabled:NO];
    //}
//
//    
//    
//    NSLog(@"%ld",(long)indexPath.section);
//    NSLog(@"%@",[arrAllData objectAtIndex:indexPath.section]);
   // NSData *imgdata = [NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://studentzone.16mb.com/uploads/%@",[[[arrAllData objectAtIndex:indexPath.section] objectAtIndex:indexPath.row]objectForKey:@"imageUrl"]]]];
//[cell.imgBox setImage: [UIImage imageWithData:imgdata]];
////}
//    //else{
//    NSLog(@"%@",arrAllData);
//        [cell.lblText setText:[[arrAllData objectAtIndex:indexPath.section] objectForKey:@"CatName"]];
//        //[cell.lblText setFont:<#(UIFont * _Nullable)#>]
////}
//    
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if(tableView.tag==7878){
        return 50.0;
    }
    return 50.0;
}
dispatch_queue_t backgroundQueue() {
    static dispatch_once_t queueCreationGuard;
    static dispatch_queue_t queue;
    dispatch_once(&queueCreationGuard, ^{
        queue = dispatch_queue_create("com.something.myapp.backgroundQueue", DISPATCH_QUEUE_SERIAL);
    });
    return queue;
}

-(UIImage *)downloadimg:(NSURL *)url
{
    NSData *dt =[NSData dataWithContentsOfURL:url
                 ];
    UIImage *img =[UIImage imageWithData:dt
                   ];
    return img;
    
    
}

- (void)scrollToRowAtIndexPath:(NSIndexPath *)indexPath atScrollPosition:(UITableViewScrollPosition)scrollPosition animated:(BOOL)animated{
    [_tblDataIs endUpdates];
}

//menu code


- (IBAction)btn_homeaction:(id)sender
{
    home_pageviewcontroller *home =[self.storyboard instantiateViewControllerWithIdentifier:@"home"];
    [self.navigationController pushViewController:home animated:YES];

}

- (IBAction)btn_collectionaction:(id)sender
{
    categoriesviewcontroller *categoriespage =[self.storyboard instantiateViewControllerWithIdentifier:@"categoriespage"];
    [self.navigationController pushViewController:categoriespage animated:YES];
}
- (IBAction)btn_aboutusaction:(id)sender
{
    
    searchviewcontroller *searchpage =[self.storyboard instantiateViewControllerWithIdentifier:@"searchpage"];
    [self.navigationController pushViewController:searchpage animated:YES];
    
   }

- (IBAction)btn_useraccountaction:(id)sender
{
    AppDelegate *app=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    NSLog(@"%@", app.ChkSkip);
    if (app.ChkSkip.length==0)
    {
        
        accountviewcontroller *accountpage =[self.storyboard instantiateViewControllerWithIdentifier:@"accountpage"];
        [self.navigationController pushViewController:accountpage animated:YES];

        
    }
    else
  {
      
      Registrationviewcontroller *registrationpage=[self.storyboard instantiateViewControllerWithIdentifier:@"registrationpage"];
      [self.navigationController pushViewController:registrationpage animated:YES];
//        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Message" message:@"Plz Login" preferredStyle:UIAlertControllerStyleAlert];
//        
//        UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
//        [alertController addAction:ok];
//        
//        [self presentViewController:alertController animated:YES completion:nil];
//        
    }

    
    
    
    
    
    
   }

- (IBAction)btn_plusaction:(id)sender

    {
        blur_viewaddplace.hidden=NO;
        
        [self.view bringSubviewToFront:blur_viewaddplace];
        if (!isSideViewOpen)
        {
            isSideViewOpen = TRUE;
            //[blur_viewaddplace setFrame:CGRectMake(0,736,414,128)];
            
            
            
            [UIView beginAnimations:@"dropdownanimation" context:NULL];
            [UIView setAnimationDelegate:self];
            [UIView setAnimationDuration: 0.2];
            //[blur_viewaddplace setFrame:CGRectMake(0,515,414,128)];
            
            [UIView commitAnimations];
        }
        else
        {
            isSideViewOpen = FALSE;
            
            
            blur_viewaddplace.hidden = YES;
            
            //[blur_viewaddplace setFrame:CGRectMake(0,515,414,128)];
            
            [UIView beginAnimations:@"dropdownanimation" context:NULL];
            [UIView setAnimationDelegate:self];
            [UIView setAnimationDuration: 0.2];
            //[blur_viewaddplace setFrame:CGRectMake(0,736,414,128)];
            
            [UIView commitAnimations];
        }
        
        
    }



- (IBAction)btn_searchaction:(id)sender
{
    
    aboutusviewcontroller *aboutuspage =[self.storyboard instantiateViewControllerWithIdentifier:@"aboutuspage"];
    [self.navigationController pushViewController:aboutuspage animated:YES];

}

- (IBAction)btn_nearbyaction:(id)sender
{
    googlemap *mapviewpage =[self.storyboard instantiateViewControllerWithIdentifier:@"mapviewpage"];
    [self.navigationController pushViewController:mapviewpage animated:YES];

}
//popup menu
- (IBAction)btn_login:(id)sender
{
    
    ViewController *loginpage =[self.storyboard instantiateViewControllerWithIdentifier:@"loginpage"];
    [self.navigationController pushViewController:loginpage animated:YES];

}

- (IBAction)btn_addplace:(id)sender
{
    addplaceviewcontroller *addplacepage =[self.storyboard instantiateViewControllerWithIdentifier:@"addplacepage"];
    [self.navigationController pushViewController:addplacepage animated:YES];

}


@end
