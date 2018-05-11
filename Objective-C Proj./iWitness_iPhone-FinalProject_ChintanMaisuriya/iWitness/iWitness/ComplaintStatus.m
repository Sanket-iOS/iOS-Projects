//
//  ComplaintStatus.m
//  iWitness
//
//  Created by Tops on 8/27/16.
//  Copyright © 2016 MAC OS. All rights reserved.
//

#import "ComplaintStatus.h"
#import "complaintStatusCell.h"
#import "ComplaintStatusDetail.h"

@interface ComplaintStatus ()

@end

@implementation ComplaintStatus
@synthesize complaintListTVC,cslSearchBar,isFiltered;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    searchCSList =[[NSMutableArray alloc]init];
    
    rightBarItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"Search.png"] style:UIBarButtonItemStylePlain target:self action:@selector(whenSearchClicked:)];
    self.navigationItem.rightBarButtonItem = rightBarItem;

    
    NSUserDefaults *uDef = [NSUserDefaults standardUserDefaults];
    strGetUID=[uDef valueForKey:@"UID"];
    
    NSURL *compURL=[NSURL URLWithString:@"http://localhost/iWitness_WS/getComplaintList.php"];
    
    NSString *strComp=[[NSString alloc]initWithFormat:@"userID=%@",strGetUID];
    NSData *compData = [strComp dataUsingEncoding:NSUTF8StringEncoding];
    NSString *compDataLength = [NSString stringWithFormat:@"%lu", (unsigned long)compData.length];
    
    NSMutableURLRequest *compREQ = [[NSMutableURLRequest alloc] init];
    [compREQ setURL:compURL];
    [compREQ setHTTPMethod:@"POST"];
    [compREQ setValue:compDataLength forHTTPHeaderField:@"Content-Length"];
    [compREQ setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [compREQ setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [compREQ setHTTPBody:compData];
    
    NSError *error = nil;
    NSURLSession *compSession = [NSURLSession sharedSession];
    if (!error)
    {
        NSURLSessionDataTask *getCLSTask=[compSession dataTaskWithRequest:compREQ completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
            getComplaintList = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
            {
                if ([getComplaintList count]>0) {
                    dispatch_async(dispatch_get_main_queue(),^{[complaintListTVC reloadData]; });
                }
                else{
                    UIAlertController *alert =[UIAlertController alertControllerWithTitle:@"Alert!" message:@"No complaint found" preferredStyle:UIAlertControllerStyleActionSheet];
                    
                    UIAlertAction *ok=[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *act){
                        [self.navigationController dismissViewControllerAnimated:YES completion:NULL];
                    }];
                    
                    [alert addAction:ok];
                    
                    dispatch_async(dispatch_get_main_queue(), ^{[self presentViewController:alert animated:YES completion:nil];});
                }
            }
        }];
        [getCLSTask resume];
    }
}

- (void)whenSearchClicked:(id)sender
{
    cslSearchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0,0, 250,44)];
    cslSearchBar.searchBarStyle=UISearchBarStyleMinimal;
    //cslSearchBar.tintColor=[UIColor colorWithRed:48/255.00f green:173/255.00f blue:255/255.00f alpha:0.9];
    cslSearchBar.placeholder = @"Search here";
    self.navigationItem.titleView=cslSearchBar;
    cslSearchBar.delegate=self;
    cslSearchBar.hidden=NO;
    
    self.navigationItem.leftBarButtonItem = nil;
    self.navigationItem.hidesBackButton=YES;
    self.navigationItem.rightBarButtonItem=nil;
    [cslSearchBar setShowsCancelButton:YES animated:YES];
}


-(void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope{
    NSPredicate *resultPredicate    = [NSPredicate predicateWithFormat:@"ctName contains[cd] %@", searchText];
    searchCSList = [NSMutableArray arrayWithArray:[getComplaintList filteredArrayUsingPredicate:resultPredicate]];
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    if (searchText.length>0) {
        // search and reload data source
        isFiltered = YES;
        [self filterContentForSearchText:searchText scope:[[searchBar scopeButtonTitles] objectAtIndex:[searchBar selectedScopeButtonIndex]]];
        [complaintListTVC reloadData];
    }else{
        isFiltered = NO;
        [searchBar resignFirstResponder];
    }
    [complaintListTVC reloadData];
}


- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    [searchBar setShowsCancelButton:YES animated:YES];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    [self cancelSearching];
    [complaintListTVC reloadData];
    
    searchBar.hidden=YES;
    self.navigationItem.leftBarButtonItem=self.navigationItem.backBarButtonItem;
    [self.navigationItem setHidesBackButton:NO animated:YES];
    self.navigationItem.rightBarButtonItem = rightBarItem;
}

-(void)cancelSearching{
    cslSearchBar.text=@"";
    [cslSearchBar setShowsCancelButton:NO animated:YES];
    [cslSearchBar resignFirstResponder];
    isFiltered = FALSE;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (isFiltered==NO) {
        return [getComplaintList count];
    }else{
        return [searchCSList count];
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    complaintStatusCell *csCell = [tableView dequeueReusableCellWithIdentifier:@"csCell"];
    
    if (isFiltered==NO) {
        csCell.lblCrimeType.text=[[getComplaintList objectAtIndex:indexPath.row]valueForKey:@"ctName"];
        
        NSString *str = [[getComplaintList objectAtIndex:indexPath.row]valueForKey:@"ctName"];
        char ch = [str characterAtIndex:0];
        
        csCell.lblComplaintLetter.text=[NSString stringWithFormat:@"%c",ch];
        csCell.lblComplaintStatus.text=[[getComplaintList objectAtIndex:indexPath.row]valueForKey:@"cStatus"];
        
        NSString *date=[[getComplaintList objectAtIndex:indexPath.row]valueForKey:@"cDate"];
        NSDateFormatter *df1=[[NSDateFormatter alloc]init];
        [df1 setDateFormat:@"yyyy/MM/dd"];
        NSDate *Date=[df1 dateFromString:date];
        [df1 setDateFormat:@"dd/MM/yyyy"];
        NSString *compDate=[df1 stringFromDate:Date];
        
        NSString *time=[[getComplaintList objectAtIndex:indexPath.row]valueForKey:@"cTime"];
        NSDateFormatter *df2=[[NSDateFormatter alloc]init];
        [df2 setDateFormat:@"HH:mm:ss"];
        NSDate *Time=[df2 dateFromString:time];
        [df2 setDateFormat:@"hh:mm a"];
        NSString *compTime=[df2 stringFromDate:Time];
        
        compDateTime=[NSString stringWithFormat:@"%@ %@",compDate,compTime];
        csCell.lblComplaintDateTime.text=compDateTime;
    }else{
        csCell.lblCrimeType.text=[[searchCSList objectAtIndex:indexPath.row]valueForKey:@"ctName"];
        csCell.lblComplaintStatus.text=[[searchCSList objectAtIndex:indexPath.row]valueForKey:@"cStatus"];
        
        NSString *date=[[searchCSList objectAtIndex:indexPath.row]valueForKey:@"cDate"];
        NSDateFormatter *df1=[[NSDateFormatter alloc]init];
        [df1 setDateFormat:@"yyyy/MM/dd"];
        NSDate *Date=[df1 dateFromString:date];
        [df1 setDateFormat:@"dd/MM/yyyy"];
        NSString *compDate=[df1 stringFromDate:Date];
        
        NSString *time=[[searchCSList objectAtIndex:indexPath.row]valueForKey:@"cTime"];
        NSDateFormatter *df2=[[NSDateFormatter alloc]init];
        [df2 setDateFormat:@"HH:mm:ss"];
        NSDate *Time=[df2 dateFromString:time];
        [df2 setDateFormat:@"hh:mm a"];
        NSString *compTime=[df2 stringFromDate:Time];
        
        compDateTime=[NSString stringWithFormat:@"%@ %@",compDate,compTime];
        csCell.lblComplaintDateTime.text=compDateTime;
    }
    csCell.accessoryType=UITableViewCellAccessoryDetailButton;
    return csCell;
}

-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    
    NSUserDefaults *csdDef=[NSUserDefaults standardUserDefaults];
    
    if (isFiltered==NO) {
        NSString *setCSD  = [getComplaintList objectAtIndex:indexPath.row];
        [csdDef setObject:setCSD forKey:@"setDetails"];
    }else{
        NSString *setCSD  = [searchCSList objectAtIndex:indexPath.row];
        [csdDef setObject:setCSD forKey:@"setDetails"];
    }
    
    ComplaintStatusDetail *navCSD=[self.storyboard instantiateViewControllerWithIdentifier:@"CSDetail_SB"];
    [self.navigationController pushViewController:navCSD animated:YES];
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
