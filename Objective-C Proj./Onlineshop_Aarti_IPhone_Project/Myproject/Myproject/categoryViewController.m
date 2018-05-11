//
//  categoryViewController.m
//  Myproject
//
//  Created by tops on 12/27/14.
//  Copyright (c) 2014 disha. All rights reserved.
//

#import "categoryViewController.h"
#import "productlistViewController.h"
//#import "DBHandler.h"
@interface categoryViewController ()

@end

@implementation categoryViewController
@synthesize tableview;

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.tableview.backgroundColor=[UIColor clearColor];
    //NSString *query=@"select * from Category_Master";
    //NSLog(@"%@",query);
    // DBHandler *db=[[DBHandler alloc]init];
   // categoryarr=[db SelectStudents:query];
    //categoryarr=[[NSMutableArray alloc]initWithObjects:@"Laptop,Computer &Tablet",@"Clothing",@"Watches",@"Jewellery",@"Musical Instrument",@"Kitchen &Dining",@"shoes", nil];
    //sercharray=[NSMutableArray arrayWithCapacity:[categoryarr count]];
   /* NSURL *url=[NSURL URLWithString:@"http://shopapi.somee.com/api/values/Get"];
    NSData *data=[NSData dataWithContentsOfURL:url];
    categoryarr=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
    NSLog(@"%@",categoryarr);
    sercharray=[NSMutableArray arrayWithCapacity:[categoryarr count]];*/
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated
{
    NSURL *url=[NSURL URLWithString:@"http://shopapi.somee.com/api/values/Get"];
    NSData *data=[NSData dataWithContentsOfURL:url];
    categoryarr=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
    NSLog(@"%@",categoryarr);
    sercharray=[NSMutableArray arrayWithCapacity:[categoryarr count]];
    // NSLog(@"%@",url);
    
    // NSMutableURLRequest *Request = [NSMutableURLRequest requestWithURL:url];
    // NSURLConnection *con = [[NSURLConnection alloc]initWithRequest:Request delegate:self];
    
    //NSLog(@"%@",con.description);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //return  categoryarr.count;

    if (tableView ==self.searchDisplayController.searchResultsTableView)
    {
        return [sercharray count];
    }
    else
    {
        return [categoryarr count];
    }

}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        tableView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"background.jpg"]];
        cell.textLabel.text=[[categoryarr objectAtIndex:indexPath.row]objectForKey:@"CategoryName"];
        
    }
    if (tableView == self.searchDisplayController.searchResultsTableView)
    {
        cell.textLabel.text = [[sercharray objectAtIndex:indexPath.row]objectForKey:@"CategoryName"];
    }
    else
    {
        cell.textLabel.text = [categoryarr[indexPath.row]objectForKey:@"CategoryName"];
    }
    //cell.backgroundColor=[UIColor clearColor];
    return cell;
    }
- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope
{
    [sercharray removeAllObjects];
    NSPredicate *resultPredicate = [NSPredicate predicateWithFormat:@"SELF contains[c] %@", searchText];
    sercharray = [NSMutableArray arrayWithArray: [categoryarr filteredArrayUsingPredicate:resultPredicate]];
}

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    [self filterContentForSearchText:searchString scope:[[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:[self.searchDisplayController.searchBar selectedScopeButtonIndex]]];
    
    return YES;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //JewelleryViewController *jewellery=[[JewelleryViewController alloc]init];
    //[self.navigationController pushViewController:jewellery animated:YES];
  
        
    productlistViewController *view1 = [self.storyboard instantiateViewControllerWithIdentifier:@"cell1"];
    //view1.data=indexPath.row;
    
    //NSString *ind =indexPath.row;
    
    NSMutableString *indexString = [NSMutableString stringWithFormat:@"%lu",indexPath.row];
    NSLog(@"%@",indexString);
    view1.str1=indexString;
    //view1.str1=[NSString stringWithFormat:@"%@",indexPath.row];
    [self.navigationController pushViewController:view1 animated:YES];
    
    
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
