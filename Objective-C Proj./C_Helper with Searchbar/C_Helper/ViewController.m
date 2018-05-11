//
//  ViewController.m
//  C_Helper
//
//  Created by mac on 4/1/15.
//  Copyright (c) 2015 ratan. All rights reserved.
//

#import "ViewController.h"
#import "DBoperation.h"
#import "DetalaView.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}
-(void)viewWillAppear:(BOOL)animated
{
    DBoperation *db=[[DBoperation alloc]init];
      GeatData=[db Selectuser];
    NSLog(@"%@",GeatData);
    
}

-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    if (searchText.length == 0)
    {
        isfiltered = NO;
    }
    else
    {
        isfiltered = YES;
        filteredstring =[[NSMutableArray alloc]init];
        
        for (NSString *str in GeatData)
        {
            NSRange strRange= [str rangeOfString:searchText options:NSCaseInsensitiveSearch];
            
            if (strRange.location != NSNotFound)
            {
                [filteredstring addObject:str];
            }
        }
    }
    
    [self.mytableview reloadData ];
}
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [self.mytableview resignFirstResponder];
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (isfiltered)
    {
        return [filteredstring count] ;
    }
    return [GeatData count];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"Cell1"];
    if (!cell)
    {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell1"];
    }
    if (!isfiltered)
    {
        cell.textLabel.text=[GeatData  objectAtIndex:indexPath.row];
    }
    else
    {
        cell.textLabel.text=[filteredstring objectAtIndex:indexPath.row];
    }
    
      cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
      //[cell setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"007.jpg"]]];
      cell.textLabel.textColor=[UIColor blackColor];
    
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell1=[tableView cellForRowAtIndexPath:indexPath];
    
    NSString *strname=cell1.textLabel.text;
    
    DetalaView *VC=[self.storyboard instantiateViewControllerWithIdentifier:@"DeView"];
    VC.str=strname;
    [self.navigationController pushViewController:VC animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
