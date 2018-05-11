//
//  categoriesviewcontroller.m
//  Street_Food
//
//  Created by Tops on 9/23/16.
//  Copyright © 2016 pinu. All rights reserved.
//

#import "categoriesviewcontroller.h"
#import "collectionviewcontrollercell.h"
#import "home_pageviewcontroller.h"
#import "aboutusviewcontroller.h"
#import "searchviewcontroller.h"
#import "accountviewcontroller.h"
#import "addplaceviewcontroller.h"
#import "ViewController.h"
#import "detailhomepageviewcontroller.h"
#import "AppDelegate.h"
#import "Registrationviewcontroller.h"




@interface categoriesviewcontroller ()
{
 NSArray *arrImages;
    BOOL isSideViewOpen;
     AppDelegate *appDel;
}
@end

@implementation categoriesviewcontroller
@synthesize collectionview,arrdata,arrname,view_catgory,blur_view;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//   UIImage * imgw = [UIImage imageNamed:@"woodenpizza.jpg"];
//  [self.view setBackgroundColor:[UIColor colorWithPatternImage:imgw]];

    
    view_catgory.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.10];
    view_catgory.clipsToBounds = YES;
    view_catgory.layer.borderColor = [[UIColor whiteColor] colorWithAlphaComponent:0.3f].CGColor;
    view_catgory.layer.borderWidth = 1.0;
    view_catgory.layer.cornerRadius = 6.0;

    
    arrdata = [[NSArray alloc]initWithObjects:@"aloopauva.jpg",@"chiness.jpg",@"4.jpg",@"f6.jpg",@"panipuri2.jpg",@"mocktail.jpg",@"cf1.jpg",@"icecream.jpg", nil];
   arrname = [[NSArray alloc]initWithObjects:@"Breakfast",@"Chiness",@"Punjabi",@"South Indian ",@"Snacks",@"Mocktails", @"Coffee/Tea Zone",@"Ice-Cream",nil];
    

    

}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
        if (indexPath.row == 0)
        {
            detailhomepageviewcontroller *deatailhomepage =[self.storyboard instantiateViewControllerWithIdentifier:@"detailhomepage"];
            deatailhomepage.strCat = [arrname objectAtIndex:indexPath.row];
            [self.navigationController pushViewController:deatailhomepage animated:YES];
           
        }
        else if (indexPath.row ==1)
        {
            detailhomepageviewcontroller *deatailhomepage =[self.storyboard instantiateViewControllerWithIdentifier:@"detailhomepage"];
             deatailhomepage.strCat = [arrname objectAtIndex:indexPath.row];
            [self.navigationController pushViewController:deatailhomepage animated:YES];
        }
        else if (indexPath.row ==2)
        {
            detailhomepageviewcontroller *deatailhomepage =[self.storyboard instantiateViewControllerWithIdentifier:@"detailhomepage"];
             deatailhomepage.strCat = [arrname objectAtIndex:indexPath.row];
            [self.navigationController pushViewController:deatailhomepage animated:YES];
        }
        else if (indexPath.row ==3)
        {
            detailhomepageviewcontroller *deatailhomepage =[self.storyboard instantiateViewControllerWithIdentifier:@"detailhomepage"];
            deatailhomepage.strCat = [arrname objectAtIndex:indexPath.row];
            [self.navigationController pushViewController:deatailhomepage animated:YES];
        }
        else if (indexPath.row ==4)
        {
            detailhomepageviewcontroller *deatailhomepage =[self.storyboard instantiateViewControllerWithIdentifier:@"detailhomepage"];
            deatailhomepage.strCat = [arrname objectAtIndex:indexPath.row];
            [self.navigationController pushViewController:deatailhomepage animated:YES];
        }
        else if (indexPath.row ==5)
        {
            detailhomepageviewcontroller *deatailhomepage =[self.storyboard instantiateViewControllerWithIdentifier:@"detailhomepage"];
            deatailhomepage.strCat = [arrname objectAtIndex:indexPath.row];
            [self.navigationController pushViewController:deatailhomepage animated:YES];
        }
        else if (indexPath.row ==6)
        {
            detailhomepageviewcontroller *deatailhomepage =[self.storyboard instantiateViewControllerWithIdentifier:@"detailhomepage"];
            deatailhomepage.strCat = [arrname objectAtIndex:indexPath.row];
            [self.navigationController pushViewController:deatailhomepage animated:YES];
        }
        else if (indexPath.row ==7)
        {
            detailhomepageviewcontroller *deatailhomepage =[self.storyboard instantiateViewControllerWithIdentifier:@"detailhomepage"];
            deatailhomepage.strCat = [arrname objectAtIndex:indexPath.row];
            [self.navigationController pushViewController:deatailhomepage animated:YES];
        }
    
    

}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return arrdata.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    collectionviewcontrollercell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];

    [cell.cellImageView setImage:[UIImage imageNamed:[arrdata objectAtIndex:indexPath.row]]];
    [cell.celllbl setText:[arrname objectAtIndex:indexPath.row]];
    

    return cell;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//set del and data for collection view



- (IBAction)btn_backaction:(id)sender
{
    home_pageviewcontroller *home =[self.storyboard instantiateViewControllerWithIdentifier:@"home"];
    [self.navigationController pushViewController:home animated:YES];
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
    blur_view.hidden=NO;
    
    [self.view bringSubviewToFront:blur_view];
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
        
        
        blur_view.hidden = YES;
        
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
- (IBAction)btn_addplace:(id)sender
{
    
    addplaceviewcontroller *addplacepage =[self.storyboard instantiateViewControllerWithIdentifier:@"addplacepage"];
    [self.navigationController pushViewController:addplacepage animated:YES];

   
}

- (IBAction)btn_login:(id)sender
{
    ViewController *loginpage =[self.storyboard instantiateViewControllerWithIdentifier:@"loginpage"];
    [self.navigationController pushViewController:loginpage animated:YES];
    

}
@end
