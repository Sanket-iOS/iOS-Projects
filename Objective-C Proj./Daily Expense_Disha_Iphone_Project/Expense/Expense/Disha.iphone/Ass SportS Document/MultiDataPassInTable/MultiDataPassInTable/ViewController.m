//
//  ViewController.m
//  MultiDataPassInTable
//
//  Created by tops on 1/12/15.
//  Copyright (c) 2015 Disha. All rights reserved.
//

#import "ViewController.h"
#import "Second.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	item=[[NSArray alloc]initWithObjects:@"Sport",@"Mobile",@"Clothe"
          ,@"Tablet",@"Bag",@"Choklet",@"Spect",@"Shoes",nil];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return item.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"mycell"];
    if(cell==nil)
    {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"mycell"];
        cell.textLabel.text=[item objectAtIndex:indexPath.row];
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    UITableViewCell *cell=[tableView cellForRowAtIndexPath:indexPath];
    NSString *name=cell.textLabel.text;
 
    Second *S=[self.storyboard instantiateViewControllerWithIdentifier:@"second"];
    S.brandName=name;
  
    [self.navigationController pushViewController:S animated:YES];   
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
