//
//  detailhomepageviewcontroller.m
//  Street_Food
//
//  Created by Tops on 9/29/16.
//  Copyright © 2016 pinu. All rights reserved.
//

#import "detailhomepageviewcontroller.h"
#import "detailhometableviewcell.h"
#import "section.h"
#import "home_pageviewcontroller.h"
#import "accountviewcontroller.h"
#import "categoriesviewcontroller.h"
#import "searchviewcontroller.h"
#import "ViewController.h"
#import "addplaceviewcontroller.h"
#import "maindetailviewcontroller.h"
#import "AppDelegate.h"
#import "Registrationviewcontroller.h"



@interface detailhomepageviewcontroller ()
{
    NSMutableArray *arrl;
    NSArray *titles;
    NSMutableArray *arrAllData, *arrCatData, *arrC, *arrCat;
    BOOL isSideViewOpen;
     AppDelegate *appDel;
    
}
@end

@implementation detailhomepageviewcontroller
@synthesize arr1,blurview1,arr2,tbl_view;
@synthesize strCat;
@synthesize description,defaultConfigObject,defaultSession,urlRequest,params,urlstring,dataTask;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //Start Code
    defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    defaultSession = [NSURLSession sessionWithConfiguration: defaultConfigObject delegate: nil delegateQueue: [NSOperationQueue mainQueue]];
    
    //*url = [NSURL URLWithString:@"http://studentzone.16mb.com/selectCat.php"];
    
    urlRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://studentzone.16mb.com/select.php"]];
    //
     params =[NSString stringWithFormat:@"Query=select * from tblplace where CatName='%@'",self.strCat];
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
                                        
                                        arrAllData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                                        NSLog(@"arrData is : \n\n\n\t%@\n\n\n",arrAllData);
                                        
                                        [tbl_view reloadData];
                                        //[arrAllData addObject:dictArr];
                                        NSLog(@"%ld",arrAllData.count);
                                    }
                                }];
    
    [dataTask resume];
         NSLog(@"\n\n%@\n\n",arrAllData);
    //end code
    //imagecode//need to change
    arr1 =[[NSArray alloc]initWithObjects:@"bhelpuri1.jpg",@"rasranjan.jpg",@"chaat.jpg",@"pizza.jpg",@"southindain3.jpg",@"lbl1",@"lbl2", nil];
    arr2 =[[NSArray alloc]initWithObjects:@"bhelpuri1.jpg",@"rasranjan.jpg",@"chaat.jpg",@"pizza.jpg",@"southindain3.jpg",@"lbl1",@"lbl2", nil];

    
    arrl  = [[NSMutableArray alloc]init];
    [arrl addObject:arr1];
    [arrl addObject:arr2];
    
    titles = [[NSArray alloc]initWithObjects:@"Top Places ",nil];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
            maindetailviewcontroller *maindetailpage =[self.storyboard instantiateViewControllerWithIdentifier:@"maindetailpage"];
    maindetailpage.arrPlaceDetails = [arrAllData objectAtIndex:indexPath.section];
            [self.navigationController pushViewController:maindetailpage animated:YES];
           
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
      NSLog(@"%ld",arrAllData.count);
    return  [arrAllData count] ;//arrl.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;//[[arrl objectAtIndex:section] count];
}
- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    //if(section>-1){
    return [[arrAllData objectAtIndex:section] objectForKey:@"PlaceName"];
    //}
    //return @"";
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    detailhometableviewcell *cell =(detailhometableviewcell *) [tableView dequeueReusableCellWithIdentifier:@"cell"];
//    NSArray *sec = [arrl objectAtIndex:indexPath.section];
//    [cell.img_box1 setImage: [UIImage imageNamed:[sec objectAtIndex:indexPath.row]]];
//        [cell.lbl_1 setText:[sec objectAtIndex:indexPath.row+1]];
//        [cell.lbl_2 setText:[sec objectAtIndex:indexPath.row+1]];
    //    //[cell.lblText setFont:<#(UIFont * _Nullable)#>]
    NSMutableDictionary *dictA=[arrAllData objectAtIndex:indexPath.section];
    NSLog(@"\n\n%@\n\n",dictA);
    NSLog(@"\n\n%ld\n\n",indexPath.section);
    [cell.lbl_1 setText:[[arrAllData objectAtIndex:indexPath.section] objectForKey:@"Area"]];
    
    [cell.lbl_2 setText:[[arrAllData objectAtIndex:indexPath.section] objectForKey:@"ShopName"]];
    int r = [[[arrAllData objectAtIndex:indexPath.section] objectForKey:@"sRate"]intValue];
    UIImage *imgh;
    switch (r) {
        case 1:
            imgh = [UIImage imageNamed:@"heartblank.png"];//heartfill.png
            
            cell.img_2.image=cell.img_3.image=cell.img_4.image=cell.img_5.image=imgh;
            [cell.img_1 setImage:[UIImage imageNamed:@"heartfill.png"]];
            break;
        case 2:
            imgh = [UIImage imageNamed:@"heartblank.png"];//heartfill.png
            
            cell.img_1.image=cell.img_2.image=cell.img_3.image=cell.img_4.image=cell.img_5.image=imgh;
            
            [cell.img_1 setImage:[UIImage imageNamed:@"heartfill.png"]];
            
            [cell.img_2 setImage:[UIImage imageNamed:@"heartfill.png"]];

            break;
        case 3:
            imgh = [UIImage imageNamed:@"heartblank.png"];//heartfill.png
            
            cell.img_1.image=cell.img_2.image=cell.img_3.image=cell.img_4.image=cell.img_5.image=imgh;
            
            [cell.img_1 setImage:[UIImage imageNamed:@"heartfill.png"]];
            
            [cell.img_2 setImage:[UIImage imageNamed:@"heartfill.png"]];
        
            [cell.img_3 setImage:[UIImage imageNamed:@"heartfill.png"]];
            break;
        case 4:
            imgh = [UIImage imageNamed:@"heartblank.png"];//heartfill.png
            
            cell.img_1.image=cell.img_2.image=cell.img_3.image=cell.img_4.image=cell.img_5.image=imgh;
            
            [cell.img_1 setImage:[UIImage imageNamed:@"heartfill.png"]];
            [cell.img_2 setImage:[UIImage imageNamed:@"heartfill.png"]];
            [cell.img_3 setImage:[UIImage imageNamed:@"heartfill.png"]];
            [cell.img_4 setImage:[UIImage imageNamed:@"heartfill.png"]];
            break;
        case 5:
            
            [cell.img_1 setImage:[UIImage imageNamed:@"heartfill.png"]];
            [cell.img_2 setImage:[UIImage imageNamed:@"heartfill.png"]];
            [cell.img_3 setImage:[UIImage imageNamed:@"heartfill.png"]];
            [cell.img_4 setImage:[UIImage imageNamed:@"heartfill.png"]];
            [cell.img_5 setImage:[UIImage imageNamed:@"heartfill.png"]];
            break;
            
        default:
            //UIImage *imgH = [];
            imgh = [UIImage imageNamed:@"heartblank.png"];//heartfill.png
            
            cell.img_1.image=cell.img_2.image=cell.img_3.image=cell.img_4.image=cell.img_5.image=imgh;
            break;
    }
    dispatch_async(backgroundQueue1(), ^{
        
        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://studentzone.16mb.com/uploads/%@",[[arrAllData objectAtIndex:indexPath.section] objectForKey:@"imageUrl"]]];
        
        UIImage *img =[self downloadimg:url];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            //[cell.actLoad startAnimating];
            [cell.img_box1 setImage:img];
            //[cell.actLoad stopAnimating];
            
        });
        
        
    });

    
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 50.0;
}



- (IBAction)btn_home:(id)sender
{
    home_pageviewcontroller *home =[self.storyboard instantiateViewControllerWithIdentifier:@"home"];
    [self.navigationController pushViewController:home animated:YES];

}

- (IBAction)btn_category:(id)sender
{
    categoriesviewcontroller *categoriespage =[self.storyboard instantiateViewControllerWithIdentifier:@"categoriespage"];
    [self.navigationController pushViewController:categoriespage animated:YES];

}

- (IBAction)btn_main:(id)sender
{
    blurview1.hidden=NO;
    
    [self.view bringSubviewToFront:blurview1];
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
        
        
        blurview1.hidden = YES;
        
        //[blur_viewaddplace setFrame:CGRectMake(0,515,414,128)];
        
        [UIView beginAnimations:@"dropdownanimation" context:NULL];
        [UIView setAnimationDelegate:self];
        [UIView setAnimationDuration: 0.2];
        //[blur_viewaddplace setFrame:CGRectMake(0,736,414,128)];
        
        [UIView commitAnimations];
    }
    

}

- (IBAction)btn_search:(id)sender
{
    searchviewcontroller *searchpage =[self.storyboard instantiateViewControllerWithIdentifier:@"searchpage"];
    [self.navigationController pushViewController:searchpage animated:YES];
    

}

- (IBAction)btn_account:(id)sender
{
    AppDelegate *app=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    NSLog(@"%@", app.ChkSkip);
    if (app.ChkSkip.length==1)
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



dispatch_queue_t backgroundQueue1() {
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





@end
