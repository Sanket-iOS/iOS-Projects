//
//  WantedPersonsList.m
//  iWitness
//
//  Created by MACOS on 6/24/16.
//  Copyright © 2016 MAC OS. All rights reserved.
//

#import "WantedPersonsList.h"
#import "WP_CollectionCell.h"
#import "WP_DetailView.h"
#import "HomeTab.h"


@interface WantedPersonsList ()

@end

@implementation WantedPersonsList
{
    UIActivityIndicatorView *activityView;
    UIView *loadingView;
    UILabel *loadingLabel;
}
@synthesize WPCollectionList,wplSearchBar,isFiltered;

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
    
    
    //for Activity indicator----
//    flag=0;
//    
//    if (flag==0) {
//        
//        loadingView = [[UIView alloc] initWithFrame:CGRectMake(75, 155, 170, 170)];
//        loadingView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
//        loadingView.clipsToBounds = YES;
//        loadingView.layer.cornerRadius = 10.0;
//        
//        activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
//        activityView.frame = CGRectMake(65, 40, activityView.bounds.size.width, activityView.bounds.size.height);
//        [loadingView addSubview:activityView];
//        
//        loadingLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 115, 130, 22)];
//        loadingLabel.backgroundColor = [UIColor clearColor];
//        loadingLabel.textColor = [UIColor whiteColor];
//        loadingLabel.adjustsFontSizeToFitWidth = YES;
//        loadingLabel.textAlignment=NSTextAlignmentCenter;
//        loadingLabel.text = @"Loading...";
//        [loadingView addSubview:loadingLabel];
//        
//        [self.view addSubview:loadingView];
//        [activityView startAnimating];
//    }
//    else{
//        [activityView stopAnimating];
//        [loadingView removeFromSuperview];
//    }
    
    searchWPList =[[NSMutableArray alloc]init];
    
    
    rightBarItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"Search.png"] style:UIBarButtonItemStylePlain target:self action:@selector(whenSearchClicked:)];
    self.navigationItem.rightBarButtonItem = rightBarItem;
    
    
    NSString *strGetWPs = [NSString stringWithFormat:@"http://localhost/iWitness_WS/wantedpeople.php?all"];
    NSURL *wpURL = [NSURL URLWithString:strGetWPs];
    NSURLRequest *wpREQ = [NSURLRequest requestWithURL:wpURL];
    
    NSURLSession *getWPSession = [NSURLSession sharedSession];
    NSURLSessionDataTask *getWPSTask = [getWPSession dataTaskWithRequest:wpREQ completionHandler:^(NSData *data,NSURLResponse *response, NSError *error){
        
        getWPDetails = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
        {
            if ([getWPDetails count]>0) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [WPCollectionList reloadData];
                });
            }else
            {
            UIAlertController *alert =[UIAlertController alertControllerWithTitle:@"Alert!" message:@"There's no wanted person found" preferredStyle:UIAlertControllerStyleActionSheet];
            
            UIAlertAction *ok=[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *act)
                    { 
                      HomeTab *navHomeTab = [self.storyboard instantiateViewControllerWithIdentifier:@"mainTabBar"];
                      [self.navigationController pushViewController:navHomeTab animated:NO];
                    }];
            [alert addAction:ok];
            
            dispatch_async(dispatch_get_main_queue(), ^{[self presentViewController:alert animated:YES completion:nil];});
        }
      }
    }];
    [getWPSTask resume];
}

- (void)whenSearchClicked:(id)sender
{
    wplSearchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0,0, 250,44)];
    wplSearchBar.searchBarStyle=UISearchBarStyleMinimal;
    //wplSearchBar.tintColor=[UIColor colorWithRed:48/255.00f green:173/255.00f blue:255/255.00f alpha:0.9];
    wplSearchBar.placeholder = @"Search here";
    self.navigationItem.titleView=wplSearchBar;
    wplSearchBar.delegate=self;
    wplSearchBar.hidden=NO;
    
    self.navigationItem.leftBarButtonItem = nil;
    self.navigationItem.hidesBackButton=YES;
    self.navigationItem.rightBarButtonItem=nil;
    [wplSearchBar setShowsCancelButton:YES animated:YES];
}


-(void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope{
    NSPredicate *resultPredicate    = [NSPredicate predicateWithFormat:@"wpName contains[cd] %@", searchText];
    searchWPList = [NSMutableArray arrayWithArray:[getWPDetails filteredArrayUsingPredicate:resultPredicate]];
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    if (searchText.length>0) {
        // search and reload data source
        isFiltered = YES;
        [self filterContentForSearchText:searchText scope:[[searchBar scopeButtonTitles] objectAtIndex:[searchBar selectedScopeButtonIndex]]];
        [WPCollectionList reloadData];
    }else{
        isFiltered = NO;
        [searchBar resignFirstResponder];
    }
    [WPCollectionList reloadData];
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
    [WPCollectionList reloadData];
    
    searchBar.hidden=YES;
    self.navigationItem.leftBarButtonItem=self.navigationItem.backBarButtonItem;
    [self.navigationItem setHidesBackButton:NO animated:YES];
    self.navigationItem.rightBarButtonItem = rightBarItem;
}

-(void)cancelSearching{
    wplSearchBar.text=@"";
    [wplSearchBar setShowsCancelButton:NO animated:YES];
    [wplSearchBar resignFirstResponder];
    isFiltered = FALSE;
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

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
   //#warning Incomplete implementation, return the number of sections
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
   //#warning Incomplete implementation, return the number of items
    //flag=1;
    
    if (isFiltered==NO) {
        return [getWPDetails count];
    }else{
        return [searchWPList count];
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    WP_CollectionCell *wpCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellWP" forIndexPath:indexPath];
    wpCell.layer.borderWidth=4;
    wpCell.layer.borderColor=[[UIColor groupTableViewBackgroundColor]CGColor];
    wpCell.layer.cornerRadius=1;
    
    wpCell.layer.shadowColor=[[UIColor blackColor]CGColor];
    wpCell.layer.shadowOffset=CGSizeMake(3,3);
    wpCell.layer.shadowOpacity=1.0;
    wpCell.layer.shadowRadius=2.0;
    wpCell.layer.shadowPath=[[UIBezierPath bezierPathWithRect:wpCell.bounds]CGPath];

    if (isFiltered==NO) {
        // wpCell.imgWP.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[[getWPDetails objectAtIndex:indexPath.row]valueForKey:@"wpImage"]]]];
        wpCell.lblWP.text=[[getWPDetails objectAtIndex:indexPath.row]valueForKey:@"wpName"];
    }else{
        // wpCell.imgWP.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[[searchWPList objectAtIndex:indexPath.row]valueForKey:@"wpImage"]]]];
        wpCell.lblWP.text=[[searchWPList objectAtIndex:indexPath.row]valueForKey:@"wpName"];
    }
    return wpCell;

}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

    NSUserDefaults *uDef = [NSUserDefaults standardUserDefaults];
    
    if (isFiltered==NO) {
        NSString *setWPD  = [getWPDetails objectAtIndex:indexPath.row];
        [uDef setObject:setWPD forKey:@"setDetails"];
    }else{
        NSString *setWPD  = [searchWPList objectAtIndex:indexPath.row];
        [uDef setObject:setWPD forKey:@"setDetails"];
    }
    
    
    WP_DetailView *navWPDetails = [self.storyboard instantiateViewControllerWithIdentifier:@"wpDetails_SB"];
    [self.navigationController pushViewController:navWPDetails animated:YES];
}


#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
