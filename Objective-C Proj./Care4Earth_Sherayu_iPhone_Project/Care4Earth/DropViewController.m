//
//  DropViewController.m
//  Care4Earth
//
//  Created by mac on 2/25/15.
//  Copyright (c) 2015 disha. All rights reserved.
//

#import "DropViewController.h"

@interface DropViewController ()

@end

@implementation DropViewController
@synthesize btn,tblSimpleTable,i,arrData;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
        
    }
    return self;
}

- (void)viewDidLoad {
    arrData = [[NSMutableArray alloc] initWithObjects:@"iPhone",@"iPod",@"MacBook",@"MacBook Pro",nil];
    //tblSimpleTable.frame =CGRectMake(10, 10, 300, 100);
    flag=1;
    tblSimpleTable.hidden=YES;
    btn.layer.cornerRadius=8;
    tblSimpleTable.layer.cornerRadius=8;
    //i=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow-down.png"]];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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

- (IBAction)btnClicked:(id)sender {
    if (flag==1) {
        flag=0;
        tblSimpleTable.hidden=NO;
        i.hidden=YES;
    }
    else{
        flag=1;
        tblSimpleTable.hidden=YES;
        i.hidden=NO;
    }
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [arrData count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	
	if (cell == nil) {
        
		
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
		
    }
    
	cell.textLabel.text = [arrData objectAtIndex:indexPath.row];
    
	return cell;

    }

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
}
@end
