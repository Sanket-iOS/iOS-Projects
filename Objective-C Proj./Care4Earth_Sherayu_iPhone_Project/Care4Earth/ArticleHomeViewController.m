//
//  ArticleHomeViewController.m
//  Care4Earth
//
//  Created by tops on 2/13/15.
//  Copyright (c) 2015 disha. All rights reserved.
//

#import "ArticleHomeViewController.h"
#import "SelectArticleViewController.h"
@interface ArticleHomeViewController ()

@end

@implementation ArticleHomeViewController
@synthesize arrData;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    NSString *strurl=[[NSString alloc]initWithFormat:@"http://carefourearth.somee.com/categorydetail/getallcategory"];
    
    NSURL *url=[[NSURL alloc]initWithString:strurl];
    
    NSData *data=[[NSData alloc]initWithContentsOfURL:url];
    
    arrData=[[NSMutableArray alloc]init];
    arrData =[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
    NSLog(@"%@",arrData);
    

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

- (IBAction)btnback:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [arrData count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"mycell"];
    if(cell==nil)
    {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"mycell"];
        cell.textLabel.text=[[arrData objectAtIndex:indexPath.row]objectForKey:@"CategoryName"];
        
        //cell.imageView.image=[UIImage imageNamed:[[arrData objectAtIndex:indexPath.row]objectForKey:@"image"]];
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SelectArticleViewController *pet=[[SelectArticleViewController alloc]initWithNibName:@"SelectArticleViewController" bundle:nil];
    int i=indexPath.row+1;
    pet.tipsid=[[NSString alloc]initWithFormat:@"%d",i];
    [self.navigationController pushViewController:pet animated:YES];
}



@end
