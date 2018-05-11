//
//  JewelleryViewController.m
//  Myproject
//
//  Created by tops on 12/28/14.
//  Copyright (c) 2014 disha. All rights reserved.
//


#import "JewelleryViewController.h"

@interface JewelleryViewController ()

@end

@implementation JewelleryViewController
@synthesize data;

- (void)viewDidLoad {
    [super viewDidLoad];
   
        
    laptoparr=[[NSArray alloc]initWithObjects:@"Laptops",@"Desktop PCs",@"Panel PCs",@"Ipad &Tablets", nil];
    musicalarr=[[NSArray alloc]initWithObjects:@"Guitar",@"Amplifiers",@"Brass insrtuments",@"Drums&Percussion",@"electronic equipment",@"Harmonium",@"Recording & Studio Equipment", nil];
    watcharr=[[NSArray alloc]initWithObjects:@"Men's Watches",@"Women's Watches",@"Pair Watches",@"Pocket Watches",@"Table Clocks",@"Wall Clocks",@"Kid's Watches", nil];
    kitchenarr=[[NSArray alloc]initWithObjects:@"Backing Accessories",@"Containers&Jars",@"Cooking Tools",@"Tea&Coffee",@"Thermoware",@"FoodProcessor", nil];
     memorycardarr=[[NSArray alloc]initWithObjects:@"Hard Disk Drives",@"Memory Card&Readers",@"Pand Drives",@"External Drive Casing",@"Internal Hard Drive", nil];
    mobileassarr=[[NSArray alloc]initWithObjects:@"Betteries",@"Bluetooth Device",@"External|Extened Bettery",@"Carkites &Chargeres",@"Cases &Pouches",@"Charger",@"Data Cable",@"Hands Free&Headsets", nil];
    jewellerarr=[[NSArray alloc]initWithObjects:@"Diamond Jewellery",@"Gold Jewellery",@"Sterling Silver jewellery",@"Fashion &lmitation Jewellery",@"Loose Diamond",@"Precious Metal Coise&Bars",@"Loose Gemstones&Pearls", nil];
    clotharr=[[NSArray alloc]initWithObjects:@"Men's Clothing",@"Women's Clothing",@"Kid's Clothing", nil];
     shoesarr=[[NSArray alloc]initWithObjects:@"Men's Shoes",@"Women's Shoes",@"Kid's Shoes", nil];
    mobilearr=[[NSArray alloc]initWithObjects:@"linoa",@"xolo", nil];
    
    //[self.tableView reloadData];    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (data==0)
    {
        return laptoparr.count;
    }
    else if(data==1)
    {
          return memorycardarr.count;
    }
    else if (data==2)
    {
        return  mobilearr.count;
    }
    else if (data==3)
    {
        return mobileassarr.count;
    }
    else if (data==4)
    {
        return musicalarr.count;
    }
    else if (data==5)
    {
        return kitchenarr.count;
    }
    else if (data==6)
    {
        return watcharr.count;
    }
    else if (data==7)
    {
        return jewellerarr.count;
    }
    else if (data==8)
    {
        return clotharr.count;
    }
    else
    {
        return shoesarr.count;
    }
    //[tableView reloadData];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *je=[tableView dequeueReusableCellWithIdentifier:@"cell1"];
    if (je==nil) {
        je = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell1"];
        
        if (data==0)
        {
            NSString *cellValue = [laptoparr objectAtIndex:indexPath.row];
            je.textLabel.text = cellValue;
        }
        if (data==1) {
            
            NSString *cellValue = [memorycardarr objectAtIndex:indexPath.row];
            je.textLabel.text = cellValue;
        }
        if (data==2) {
            NSString *cellValue=[mobilearr objectAtIndex:indexPath.row];
            je.textLabel.text=cellValue;
        }
        if (data==3) {
            NSString *cellValue=[mobileassarr objectAtIndex:indexPath.row];
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
            NSString *cellValue=[watcharr objectAtIndex:indexPath.row];
            je.textLabel.text=cellValue;
        }
        if (data==7) {
            NSString *cellValue=[jewellerarr objectAtIndex:indexPath.row];
            je.textLabel.text=cellValue;
        }
        if (data==8) {
            NSString *cellValue=[clotharr objectAtIndex:indexPath.row];
            je.textLabel.text=cellValue;
        }
        if (data==9) {
            NSString *cellValue=[shoesarr objectAtIndex:indexPath.row];
            je.textLabel.text=cellValue;
        }

    }
       //je.textLabel.text=[jeweller objectAtIndex:indexPath.row];
       
    
   // NSLog(@"Row: %i", indexPath.row);
    
    
    return je;
}

/*-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:0 inSection:1],[NSIndexPath indexPathForRow:1 inSection:1]] withRowAnimation:UITableViewRowAnimationAutomatic];
}*/
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
