//
//  collectionViewController.m
//  Myproject
//
//  Created by tops on 2/14/15.
//  Copyright (c) 2015 disha. All rights reserved.
//

#import "collectionViewController.h"
#import "customcell.h"
#import "ItemdescriptionViewController.h"
#import "tttttttViewController.h"
#import "ordViewController.h"

@interface collectionViewController ()
{
    NSArray *itemarr;
}
@end

@implementation collectionViewController
@synthesize str,data1,str3;
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"background.jpg"]]];
    /*womanarr =[[NSArray alloc]initWithObjects: @"image1.jpg",@"image2.jpg",@"image3.jpg",@"image4.jpg",@"image5.jpg"@"image6.jpg", nil];
    laptoparr=[[NSArray alloc]initWithObjects:@"laptop1.jpg",@"laptop2.jpg",@"laptop3.jpg", nil];
    desktoparr=[[NSArray alloc]initWithObjects:@"desktop.jpg",@"desktop2.jpg",@"desktop3.jpg", nil];
    tabletarr=[[NSArray alloc]initWithObjects:@"ipad.jpg",@"ipad1.jpg",@"tablet.jpg",@"tablet1.jpg",@"teblet3.jpg", nil];
    childarr=[[NSArray alloc]initWithObjects:@"babyclothes.jpg",@"gaoclothes.jpg",@"partyDresses.jpg", nil];
    gitararr=[[NSArray alloc]initWithObjects:@"guitar.jpg",@"guitar1.jpg",@"guitar2.jpg", nil];
    harmoniumarr=[[NSArray alloc]initWithObjects:@"harmonium.jpg",@"harmonium1.jpg",@"harmonium3.jpg", nil];
    recodingarr=[[NSArray alloc]initWithObjects:@"recording.jpg",@"recording1.jpg",@"recording3.jpg",@"Remainder.jpg", nil];
    manwatcharr=[[NSArray alloc]initWithObjects:@"FastrackWatch.jpg",@"Men_watch.jpg",@"MenWatch.jpg", nil];
    womanwatcharr=[[NSArray alloc]initWithObjects:@"WomenWatch.jpg",@"DiamonadWatch.jpg",@"BrownWatch.jpg", nil];
    pairwatcharr=[[NSArray alloc]initWithObjects:@"DiamonadPairWatch.jpg",@"PairWatch.jpg",@"Pair_Watch.jpg", nil];
    manchoesarr=[[NSArray alloc]initWithObjects:@"MenShoes.jpg",@"Shoes.jpg",@"SoprtMenShoes.jpg", nil];    [super viewDidLoad];
    womanchoesarr=[[NSArray alloc]initWithObjects:@"WomenShoes.jpg",@"Flat.jpg",@"Heel.jpg", nil];
    diamondarr=[[NSArray alloc]initWithObjects:@"Diamonad_Earing.jpg",@"Diamonad_Neckles.jpg",@"Diamonad_Ring.jpg",@"DiamonadEaring.jpg",@"DiamonadNeckles.jpg",@"DiamonadRing.jpg", nil];
    glodarr=[[NSArray alloc]initWithObjects:@"Gold_Earing.jpg",@"Gold_Neckles.jpg",@"Gold_Ring.jpg",@"goldEaring.jpg",@"GoldNeckles.jpg",@"GoldRing.jpg", nil];*/
    [super viewDidLoad];    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated
 {
NSNumber *A=(NSNumber *)str3;
     
     int i=[A intValue];
     i++;
     NSString *strurl=[[NSString alloc]initWithFormat:@"http://shopapi.somee.com/api/values/GetItemsBySubCat/?id=%d",i];
     NSLog(@"%@",strurl);
     NSURL *url=[[NSURL alloc]initWithString:strurl];
     
 //NSURL *url=[NSURL URLWithString:@"http://shopapi.somee.com/api/values/GetItemsBySubCat/?id=%d",i];
 NSData *data=[NSData dataWithContentsOfURL:url];
 itemarr=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
 NSLog(@"%@",itemarr);
 //sercharray=[NSMutableArray arrayWithCapacity:[categoryarr count]];
 // NSLog(@"%@",url);
 
 // NSMutableURLRequest *Request = [NSMutableURLRequest requestWithURL:url];
 // NSURLConnection *con = [[NSURLConnection alloc]initWithRequest:Request delegate:self];
 
 //NSLog(@"%@",con.description);
 }
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return  itemarr.count;
    /*if(data==0)
    {
        
        if (data1==0)
            
            return laptoparr.count;
        
        else if (data1==1)
            
            return desktoparr.count;
        
        else
            
        return tabletarr.count;
    }
   else if (data==1)
   {
       if (data1==1)
           
           return womanarr.count;
    
       else
           
           return childarr.count;
   }
    else if(data==2)
    {
        
        if (data1==0)
            
            return manwatcharr.count;
        
        else if (data1==1)
            
            return womanwatcharr.count;
        
        else
            
            return pairwatcharr.count;
    }
    else if(data==3)
    {
        
        if (data1==0)
            
            return diamondarr.count;
        
        
        else
            
            return glodarr.count;
    }
    else if(data==4)
    {
        
        if (data1==0)
            
            return gitararr.count;
        
        else if (data1==1)
            
            return harmoniumarr.count;
        
        else
            
            return recodingarr.count;
    }
    else if(data==6)
    {
        
        if (data1==0)
            
            return manchoesarr.count;
        
                else
            
            return womanchoesarr.count;
    }
    
    
    return 0;*/
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    customcell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"mycell" forIndexPath:indexPath];
    cell.collectimg.image=[UIImage imageNamed:[[itemarr objectAtIndex:indexPath.row]objectForKey:@"ImgName"]];

   cell.imgname.text=[[itemarr objectAtIndex:indexPath.row]objectForKey:@"ItemName"];
    
    NSLog(@"%@",cell.imgname.text);
    NSNumber *number=[[itemarr objectAtIndex:indexPath.row]objectForKey:@"Price"];
    NSString *string=[number stringValue];
    cell.imgprice.text=string;
    NSLog(@"%@",cell.imgprice.text);
    //if (cell==nil) {
      //cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell1"];
       // je.textLabel.text=[[subcategoryarr objectAtIndex:indexPath.row]objectForKey:@"SubcategoryName"];
       /* if(data==0)
    {
        
        if (data1==0)
        {
            //NSString *cellValue = [laptoparr objectAtIndex:indexPath.row];
            cell.collectimg.image=[UIImage imageNamed:[laptoparr objectAtIndex:indexPath.row]];
            cell.imgname.text=[laptoparr objectAtIndex:indexPath.row];
        }
        else if (data1==1)
        {
            cell.collectimg.image=[UIImage imageNamed:[desktoparr objectAtIndex:indexPath.row]];
            cell.imgname.text=[desktoparr objectAtIndex:indexPath.row];
        }
        else if (data1==2)
        {
            cell.collectimg.image=[UIImage imageNamed:[tabletarr objectAtIndex:indexPath.row]];
            cell.imgname.text=[tabletarr objectAtIndex:indexPath.row];
        }

    }
    else if(data==1)
    {
        
        if (data1==1)
        {
            //NSString *cellValue = [laptoparr objectAtIndex:indexPath.row];
            cell.collectimg.image=[UIImage imageNamed:[womanarr objectAtIndex:indexPath.row]];
            cell.imgname.text=[womanarr objectAtIndex:indexPath.row];
        }
                else if (data1==2)
        {
            cell.collectimg.image=[UIImage imageNamed:[childarr objectAtIndex:indexPath.row]];
            cell.imgname.text=[childarr objectAtIndex:indexPath.row];
        }
        
    }
    else if(data==2)
    {
        
        if (data1==0)
        {
            //NSString *cellValue = [laptoparr objectAtIndex:indexPath.row];
            cell.collectimg.image=[UIImage imageNamed:[manwatcharr objectAtIndex:indexPath.row]];
            cell.imgname.text=[manwatcharr objectAtIndex:indexPath.row];
        }
        else if (data1==1)
        {
            cell.collectimg.image=[UIImage imageNamed:[womanwatcharr objectAtIndex:indexPath.row]];
            cell.imgname.text=[womanwatcharr objectAtIndex:indexPath.row];
        }
        else if (data1==2)
        {
            cell.collectimg.image=[UIImage imageNamed:[pairwatcharr objectAtIndex:indexPath.row]];
            cell.imgname.text=[pairwatcharr objectAtIndex:indexPath.row];
        }
        
    }
    else if(data==3)
    {
        
        if (data1==0)
        {
            //NSString *cellValue = [laptoparr objectAtIndex:indexPath.row];
            cell.collectimg.image=[UIImage imageNamed:[diamondarr objectAtIndex:indexPath.row]];
            cell.imgname.text=[diamondarr objectAtIndex:indexPath.row];
        }
        else if (data1==1)
        {
            cell.collectimg.image=[UIImage imageNamed:[glodarr objectAtIndex:indexPath.row]];
            cell.imgname.text=[glodarr objectAtIndex:indexPath.row];
        }
        
    }
    else if(data==4)
    {
        
        if (data1==0)
        {
            //NSString *cellValue = [laptoparr objectAtIndex:indexPath.row];
            cell.collectimg.image=[UIImage imageNamed:[gitararr objectAtIndex:indexPath.row]];
            cell.imgname.text=[gitararr objectAtIndex:indexPath.row];
        }
        else if (data1==1)
        {
            cell.collectimg.image=[UIImage imageNamed:[harmoniumarr objectAtIndex:indexPath.row]];
            cell.imgname.text=[harmoniumarr objectAtIndex:indexPath.row];
        }
        else if (data1==2)
        {
            cell.collectimg.image=[UIImage imageNamed:[recodingarr objectAtIndex:indexPath.row]];
            cell.imgname.text=[recodingarr objectAtIndex:indexPath.row];
        }
        
    }
    else if(data==6)
    {
        
        if (data1==0)
        {
            //NSString *cellValue = [laptoparr objectAtIndex:indexPath.row];
            cell.collectimg.image=[UIImage imageNamed:[manchoesarr objectAtIndex:indexPath.row]];
            cell.imgname.text=[manchoesarr objectAtIndex:indexPath.row];
        }
        else if (data1==1)
        {
            cell.collectimg.image=[UIImage imageNamed:[womanchoesarr objectAtIndex:indexPath.row]];
            cell.imgname.text=[womanchoesarr objectAtIndex:indexPath.row];
        }
        
    }*/
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    tttttttViewController *pr=[self.storyboard instantiateViewControllerWithIdentifier:@"kk"];
    pr.strpn=[[itemarr objectAtIndex:indexPath.row]objectForKey:@"ImgName"];
    pr.strpn1=[[itemarr objectAtIndex:indexPath.row]objectForKey:@"ItemName"];
    pr.strpn2=[[itemarr objectAtIndex:indexPath.row]objectForKey:@"Status"];
    pr.strpn3=[[itemarr objectAtIndex:indexPath.row]objectForKey:@"Description"];
    pr.strpn4=[[itemarr objectAtIndex:indexPath.row]objectForKey:@"Feature"];
    NSNumber *number=[[itemarr objectAtIndex:indexPath.row]objectForKey:@"Price"];
    NSString *string=[number stringValue];
    pr.strpn5=string;
   NSNumber *number1=[[itemarr objectAtIndex:indexPath.row]objectForKey:@"Discount"];
    NSString *string1=[number1 stringValue];
    pr.strpn6=string1;
    [self.navigationController pushViewController:pr animated:YES ];
    /*if(data==0)
    {
    if(data1==0) {
        
        tttttttViewController *pr=[self.storyboard instantiateViewControllerWithIdentifier:@"kk"];
        pr.strpn=[laptoparr objectAtIndex:indexPath.row];
        [self.navigationController pushViewController:pr animated:YES ];
        
    }
    
    else if (data1==1) {
         tttttttViewController *pr=[self.storyboard instantiateViewControllerWithIdentifier:@"kk"];
        pr.strpn=[desktoparr objectAtIndex:indexPath.row];
        [self presentViewController:pr animated:YES completion:nil];
    }
    else if (data1==2) {
         tttttttViewController *pr=[self.storyboard instantiateViewControllerWithIdentifier:@"kk"];
        pr.strpn=[tabletarr objectAtIndex:indexPath.row];
        [self presentViewController:pr animated:YES completion:nil];
    }
    }
    else if(data==1)
    {
        
        if (data1==1)
        {
             tttttttViewController *pr=[self.storyboard instantiateViewControllerWithIdentifier:@"kk"];
            pr.strpn=[womanarr objectAtIndex:indexPath.row];
            [self presentViewController:pr animated:YES completion:nil];
        }
        else if (data1==2)
        {
             tttttttViewController *pr=[self.storyboard instantiateViewControllerWithIdentifier:@"kk"];
            pr.strpn=[childarr objectAtIndex:indexPath.row];
            [self presentViewController:pr animated:YES completion:nil];        }
        
    }
    else if(data==2)
    {
        
        if (data1==0)
        {
             tttttttViewController *pr=[self.storyboard instantiateViewControllerWithIdentifier:@"kk"];
            pr.strpn=[manwatcharr objectAtIndex:indexPath.row];
            [self presentViewController:pr animated:YES completion:nil];        }
        else if (data1==1)
        {
             tttttttViewController *pr=[self.storyboard instantiateViewControllerWithIdentifier:@"kk"];
            pr.strpn=[womanwatcharr objectAtIndex:indexPath.row];
            [self presentViewController:pr animated:YES completion:nil];
        }
        else if (data1==2)
        {
             tttttttViewController *pr=[self.storyboard instantiateViewControllerWithIdentifier:@"kk"];
            pr.strpn=[pairwatcharr objectAtIndex:indexPath.row];
            [self presentViewController:pr animated:YES completion:nil];
        }
        
    }
    else if(data==3)
    {
        
        if (data1==0)
        {
             tttttttViewController *pr=[self.storyboard instantiateViewControllerWithIdentifier:@"kk"];
            pr.strpn=[diamondarr objectAtIndex:indexPath.row];
            [self presentViewController:pr animated:YES completion:nil];
        }
        else if (data1==1)
        {
             tttttttViewController *pr=[self.storyboard instantiateViewControllerWithIdentifier:@"kk"];
            pr.strpn=[glodarr objectAtIndex:indexPath.row];
            [self presentViewController:pr animated:YES completion:nil];        }
        
    }
    else if(data==4)
    {
        
        if (data1==0)
        {
             tttttttViewController *pr=[self.storyboard instantiateViewControllerWithIdentifier:@"kk"];
            pr.strpn=[gitararr objectAtIndex:indexPath.row];
            [self presentViewController:pr animated:YES completion:nil];
        }
        else if (data1==1)
        {
             tttttttViewController *pr=[self.storyboard instantiateViewControllerWithIdentifier:@"kk"];
            pr.strpn=[harmoniumarr objectAtIndex:indexPath.row];
            [self presentViewController:pr animated:YES completion:nil];
        }
        else if (data1==2)
        {
             tttttttViewController *pr=[self.storyboard instantiateViewControllerWithIdentifier:@"kk"];
            pr.strpn=[recodingarr objectAtIndex:indexPath.row];
            [self presentViewController:pr animated:YES completion:nil];
        }
        
    }
    else if(data==6)
    {
        
        if (data1==0)
        {
             tttttttViewController *pr=[self.storyboard instantiateViewControllerWithIdentifier:@"kk"];
            pr.strpn=[manchoesarr objectAtIndex:indexPath.row];
            [self presentViewController:pr animated:YES completion:nil];
        }
        else if (data1==1)
        {
             tttttttViewController *pr=[self.storyboard instantiateViewControllerWithIdentifier:@"kk"];
            pr.strpn=[womanchoesarr objectAtIndex:indexPath.row];
            [self presentViewController:pr animated:YES completion:nil];
        }
        
    }*/
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

@end
