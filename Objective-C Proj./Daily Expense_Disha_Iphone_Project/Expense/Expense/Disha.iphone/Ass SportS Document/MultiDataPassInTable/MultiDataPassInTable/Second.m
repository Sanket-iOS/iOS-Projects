//
//  Second.m
//  MultiDataPassInTable
//
//  Created by tops on 1/12/15.
//  Copyright (c) 2015 Disha. All rights reserved.
//

#import "Second.h"

@interface Second ()

@end

@implementation Second

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSArray *Product=[[NSArray alloc]initWithObjects:@{@"Name":@"bassketBall",@"Price":@"Rs.200",@"Image":@"bassketBall.jpeg",@"Brand":@"Sport"},@{@"Name":@"Boxxing",@"Price":@"Rs.5800",@"Image":@"Boxxing.jpeg",@"Brand":@"Sport"},@{@"Name":@"chess",@"Price":@"Rs.360",@"Image":@"chess.jpeg",@"Brand":@"Sport"},@{@"Name":@"criket",@"Price":@"Rs.1020",@"Image":@"criket.jpeg",@"Brand":@"Sport"},@{@"Name":@"hockey",@"Price":@"Rs.500",@"Image":@"hockey.jpeg",@"Brand":@"Sport"},@{@"Name":@"racket",@"Price":@"Rs.436",@"Image":@"racket.jpeg",@"Brand":@"Sport"},@{@"Name":@"TableTennis",@"Price":@"Rs.15000",@"Image":@"tabletennis.jpeg",@"Brand":@"Sport"},@{@"Name":@"Apple",@"Price":@"Rs.65890",@"Image":@"Apple.jpeg",@"Brand":@"Mobile"},@{@"Name":@"Nokia",@"Price":@"Rs.10000",@"Image":@"Nokia.jpeg",@"Brand":@"Mobile"},@{@"Name":@"Samsung",@"Price":@"Rs.25000",@"Image":@".jpeg",@"Brand":@"Mobile"},@{@"Name":@"Sony",@"Price":@"Rs.35400",@"Image":@"Sony.jpeg",@"Brand":@"Mobile"},@{@"Name":@"Xolo",@"Price":@"Rs.15000",@"Image":@"Xolo.jpeg",@"Brand":@"Mobile"},@{@"Name":@"dress",@"Price":@"Rs.1500",@"Image":@"dress.jpeg",@"Brand":@"Clothe"},@{@"Name":@"formal",@"Price":@"Rs.1000",@"Image":@"formal.jpeg",@"Brand":@"Clothe"},@{@"Name":@"Child Shut",@"Price":@"Rs.1500",@"Image":@"man.jpeg",@"Brand":@"Clothe"},@{@"Name":@"Nighty",@"Price":@"Rs.2300",@"Image":@"nity.jpeg",@"Brand":@"Clothe"},@{@"Name":@"Sari",@"Price":@"Rs.6000",@"Image":@"sari.jpeg",@"Brand":@"Clothe"},@{@"Name":@"Scurt",@"Price":@"Rs.890",@"Image":@"Scurt.jpeg",@"Brand":@"Clothe"},@{@"Name":@"Shirt",@"Price":@"Rs.840",@"Image":@"shirt.jpeg",@"Brand":@"Clothe"},@{@"Name":@"Top",@"Price":@"Rs.300",@"Image":@"tops.jpeg",@"Brand":@"Clothe"},@{@"Name":@"T-Shirt",@"Price":@"Rs.3650",@"Image":@"tshirt.jpeg",@"Brand":@"Clothe"},@{@"Name":@"Zins",@"Price":@"Rs.2500",@"Image":@"Zens.jpeg",@"Brand":@"Clothe"},@{@"Name":@"I Pad",@"Price":@"Rs.80000",@"Image":@"Ipad.jpeg",@"Brand":@"Tablet"},@{@"Name":@"LG",@"Price":@"RS.25000",@"Image":@"Lg.jpeg",@"Brand":@"Tablet"},@{@"Name":@"MicroMAx",@"Price":@"Rs.25000",@"Image":@"MicroMax.jpeg",@"Brand":@"Tablet"},@{@"Name":@"Onda",@"Price":@"Rs.69000",@"Image":@"Onda.jpeg",@"Brand":@"Tablet"},@{@"Name":@"SamSung",@"Price":@"Rs.78000",@"Image":@"Samsung.jpeg",@"Brand":@"Tablet"},@{@"Name":@"Sony",@"Price":@"Rs.23000",@"Image":@"Sony.jpeg",@"Brand":@"Tablet"},@{@"Name":@"Dairy Milk",@"Price":@"Rs.35",@"Image":@"dairy milk.jpeg",@"Brand":@"Choklet"},@{@"Name":@"Five Star",@"Price":@"Rs.20",@"Image":@"five star.jpeg",@"Brand":@"Choklet"},@{@"Name":@"Galaxy",@"Price":@"Rs.40",@"Image":@"GAlaxy.jpeg",@"Brand":@"Choklet"},@{@"Name":@"Kit Kat",@"Price":@"Rs.15",@"Image":@"kit ket.jpeg",@"Brand":@"Choklet"},@{@"Name":@"Lindt",@"Price":@"Rs.10",@"Image":@"lindt.jpeg",@"Brand":@"Choklet"},@{@"Name":@"Mars",@"Price":@"Rs.13",@"Image":@"mars.jpeg",@"Brand":@"Choklet"},@{@"Name":@"Business",@"Price":@"Rs.8520",@"Image":@"business.jpeg",@"Brand":@"Shoes"},@{@"Name":@"Cap TOE BELS",@"Price":@"RS.2500",@"Image":@"cap toe bels.jpeg",@"Brand":@"Shoes"},@{@"Name":@"Child Man",@"Price":@"Rs.2300",@"Image":@"child man.jpeg",@"Brand":@"Shoes"},@{@"Name":@"Child Woman",@"Price":@"Rs.2500",@"Image":@"child woman.jpeg",@"Brand":@"Shoes"},@{@"Name":@"Hall",@"Price":@"Rs.2500",@"Image":@"hall.jpeg",@"Brand":@"Shoes"},@{@"Name":@"Snekers",@"Price":@"Rs.8900",@"Image":@"snekers.jpeg",@"Brand":@"Shoes"},@{@"Name":@"Chukkas",@"Price":@"Rs.2600",@"Image":@"chukkas.jpeg",@"Brand":@"Shoes"},@{@"Name":@"Kitten",@"Price":@"Rs.9800",@"Image":@"kitten.jpeg",@"Brand":@"Shoes"},@{@"Name":@"Wedges",@"Price":@"Rs.2400",@"Image":@"Wedges.jpeg",@"Brand":@"Shoes"},@{@"Name":@"E12311",@"Price":@"Rs.250",@"Image":@"E12311.jpeg",@"Brand":@"Spect"},@{@"Name":@"E12322",@"Price":@"Rs.650",@"Image":@"E12322.jpeg",@"Brand":@"Spect"},@{@"Name":@"E12345",@"Price":@"Rs.2350",@"Image":@"E12345.jpeg",@"Brand":@"Spect"},@{@"Name":@"E12354",@"Price":@"Rs.250",@"Image":@"E12354.jpeg",@"Brand":@"Spect"},@{@"Name":@"E12355",@"Price":@"Rs.650",@"Image":@"E12355.jpeg",@"Brand":@"Spect"},@{@"Name":@"E12358",@"Price":@"Rs.500",@"Image":@"E12358.jpeg",@"Brand":@"Spect"},@{@"Name":@"E12366",@"Price":@"Rs.980",@"Image":@"E12366.jpeg",@"Brand":@"Spect"},@{@"Name":@"E12374",@"Price":@"Rs.360",@"Image":@"E12374.jpeg",@"Brand":@"Spect"},@{@"Name":@"E12384",@"Price":@"Rs.250",@"Image":@"E12384.jpeg",@"Brand":@"Spect"},@{@"Name":@"E12387",@"Price":@"Rs.690",@"Image":@"E12387.jpeg",@"Brand":@"Spect"},@{@"Name":@"E12388",@"Price":@"Rs.560",@"Image":@"E12388.jpeg",@"Brand":@"Spect"},@{@"Name":@"E12389",@"Price":@"Rs.220",@"Image":@"E12389.jpeg",@"Brand":@"Spect"},@{@"Name":@"E12395",@"Price":@"Rs.702",@"Image":@"E12395.jpeg",@"Brand":@"Spect"},@{@"Name":@"Anthletic Bag",@"Price":@"Rs.1500",@"Image":@"Athletic bag.jpeg",@"Brand":@"Bag"},@{@"Name":@"BackPack Bag",@"Price":@"Rs.2600",@"Image":@"backpack.jpeg",@"Brand":@"Bag"},@{@"Name":@"Baguette bag",@"Price":@"Rs.8400",@"Image":@"Baguette.jpeg",@"Brand":@"Bag"},@{@"Name":@"Bowling bag",@"Price":@"Rs.200",@"Image":@"Bowling.jpg",@"Brand":@"Bag"},@{@"Name":@"Bucket Bag",@"Price":@"Rs.8900",@"Image":@"bucket.jpg",@"Brand":@"Bag"},@{@"Name":@"Wristlet Bag",@"Price":@"Rs.2500",@"Image":@"Wristlet.jpg",@"Brand":@"Bag"},nil];
    NSPredicate *predict=[NSPredicate predicateWithFormat:@"Brand==%@",self.brandName];
    sub=[Product filteredArrayUsingPredicate:predict];
                          
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
        return sub.count;
    }
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(cell==nil)
    {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
        cell.textLabel.text=[[sub objectAtIndex:indexPath.row]objectForKey:@"Name"];
        cell.detailTextLabel.text=[[sub objectAtIndex:indexPath.row]objectForKey:@"Price"];
        cell.imageView.image=[UIImage imageNamed:[[sub objectAtIndex:indexPath.row]objectForKey:@"Image"]];
        
    }
    return cell;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
