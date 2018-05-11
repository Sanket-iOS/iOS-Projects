//
//  productlistViewController.m
//  Myproject
//
//  Created by tops on 1/4/15.
//  Copyright (c) 2015 disha. All rights reserved.
//

#import "productlistViewController.h"
#import "collectionViewController.h"
#import "customcell.h"


@interface productlistViewController ()
{
    NSArray *subcategoryarr;
}
@end

@implementation productlistViewController
@synthesize data,str1;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*laptoparr=[[NSArray alloc]initWithObjects:@"Laptops",@"Desktop PCs",@"Ipad &Tablets", nil];
    musicalarr=[[NSArray alloc]initWithObjects:@"Guitar",@"Harmonium",@"Recording & Studio Equipment", nil];
    watcharr=[[NSArray alloc]initWithObjects:@"Men's Watches",@"Women's Watches",@"Pair Watches",nil];
    kitchenarr=[[NSArray alloc]initWithObjects:@"Backing Accessories",@"Containers&Jars", nil];
    
    
    jewellerarr=[[NSArray alloc]initWithObjects:@"Diamond Jewellery",@"Gold Jewellery", nil];
    clotharr=[[NSArray alloc]initWithObjects:@"Men's Clothing",@"Women's Clothing",@"Kid's Clothing", nil];
    shoesarr=[[NSArray alloc]initWithObjects:@"Men's Shoes",@"Women's Shoes", nil];*/
    
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated
{
    //NSString *s=str1;
    
    NSNumber *A=(NSNumber *)str1;
    
    int i=[A intValue];
    i++;
    
    NSString *strurl=[[NSString alloc]initWithFormat:@"http://shopapi.somee.com/api/values/GetSubByCat?id=%d",i];
    NSLog(@"%@",strurl);
    NSURL *url=[[NSURL alloc]initWithString:strurl];
    
    
    
    NSData *data=[NSData dataWithContentsOfURL:url];
    subcategoryarr=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
    
    NSLog(@"%@",subcategoryarr);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return subcategoryarr.count;
    /*if (data==0)
    {
        return laptoparr.count;
    }
    else if(data==1)
    {
        return clotharr.count;

    }
    else if (data==2)
    {
        return  watcharr.count;
    }
    else if (data==3)
    {
        return jewellerarr.count;
    }
    else if (data==4)
    {
        return musicalarr.count;
    }
    else if (data==5)
    {
        return kitchenarr.count;
    }
       else
    {
        return shoesarr.count;
    }*/
    //[tableView reloadData];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *je=[tableView dequeueReusableCellWithIdentifier:@"cell1"];
    if (je==nil) {
        je = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell1"];
        je.textLabel.text=[[subcategoryarr objectAtIndex:indexPath.row]objectForKey:@"SubcategoryName"];
        /*if (data==0)
        {
            NSString *cellValue = [laptoparr objectAtIndex:indexPath.row];
            je.textLabel.text = cellValue;
        }
        if (data==1) {
            
            NSString *cellValue = [clotharr objectAtIndex:indexPath.row];
            je.textLabel.text = cellValue;
        }
        if (data==2) {
            NSString *cellValue=[watcharr objectAtIndex:indexPath.row];
            je.textLabel.text=cellValue;
        }
        if (data==3) {
            NSString *cellValue=[jewellerarr objectAtIndex:indexPath.row];
            je.textLabel.text=cellValue;
        }
        if (data==4) {
            NSString *cellValue=[musicalarr objectAtIndex:indexPath.row];
            je.textLabel.text=cellValue;
        }
        if (data==5) {
            NSString *cellValue=[kitchenarr objectAtIndex:indexPath.row];
            je.textLabel.text=cellValue;
        }
                if (data==6) {
            NSString *cellValue=[shoesarr objectAtIndex:indexPath.row];
            je.textLabel.text=cellValue;
        }*/
        
    }
    return je;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    collectionViewController *pr = [self.storyboard instantiateViewControllerWithIdentifier:@"collect"];
   NSMutableString *indexString = [NSMutableString stringWithFormat:@"%lu",indexPath.row];
    NSLog(@"%@",indexString);
   pr.str3=indexString;
    //pr.data1=indexPath.row;
    //pr.data=data;
    [self.navigationController pushViewController:pr animated:YES];
    

  
}
    //je.textLabel.text=[jeweller objectAt/*

// In a storyboard-based application, you will often want to do a little preparation before navigation
/*- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
