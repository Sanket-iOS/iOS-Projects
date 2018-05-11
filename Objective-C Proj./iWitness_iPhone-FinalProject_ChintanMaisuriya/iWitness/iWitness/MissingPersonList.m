//
//  MissingPersonList.m
//  iWitness
//
//  Created by MACOS on 6/22/16.
//  Copyright © 2016 MAC OS. All rights reserved.
//

#import "MissingPersonList.h"
#import "MP_CollectionCell.h"
#import "MP_DetailView.h"
#import "HomeTab.h"

@interface MissingPersonList ()

@end

@implementation MissingPersonList
@synthesize MPCollectionList,mplSearchBar,isFiltered;

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
    
    searchMPList =[[NSMutableArray alloc]init];

    
    rightBarItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"Search.png"] style:UIBarButtonItemStylePlain target:self action:@selector(whenSearchClicked:)];
    self.navigationItem.rightBarButtonItem = rightBarItem;
    
    NSString *strGetMPs = [NSString stringWithFormat:@"http://localhost/iWitness_WS/missingpeople.php?all"];
    NSURL *mpURL = [NSURL URLWithString:strGetMPs];
    NSURLRequest *mpREQ = [NSURLRequest requestWithURL:mpURL];
    
    NSURLSession *getMPSession = [NSURLSession sharedSession];
    NSURLSessionDataTask *getMPSTask = [getMPSession dataTaskWithRequest:mpREQ completionHandler:^(NSData *data,NSURLResponse *response, NSError *error){
        
        getMPDetails = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
        {
            if ([getMPDetails count]>0) {
                dispatch_async(dispatch_get_main_queue(),^{[MPCollectionList reloadData]; });
            }
            else{
            UIAlertController *alert =[UIAlertController alertControllerWithTitle:@"Alert!" message:@"There's no missing person found" preferredStyle:UIAlertControllerStyleActionSheet];
            
            UIAlertAction *ok=[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *act){
                      HomeTab *navHomeTab = [self.storyboard instantiateViewControllerWithIdentifier:@"mainTabBar"];
                      [self.navigationController pushViewController:navHomeTab animated:NO];
                    }];
            
            [alert addAction:ok];
            
         dispatch_async(dispatch_get_main_queue(), ^{[self presentViewController:alert animated:YES completion:nil];});
        }
      }
    }];
    [getMPSTask resume];
}

- (void)whenSearchClicked:(id)sender
{
    mplSearchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0,0, 250,44)];
    mplSearchBar.searchBarStyle=UISearchBarStyleMinimal;
    //mplSearchBar.tintColor=[UIColor colorWithRed:48/255.00f green:173/255.00f blue:255/255.00f alpha:0.9];
    mplSearchBar.placeholder = @"Search here";
    self.navigationItem.titleView=mplSearchBar;
    mplSearchBar.delegate=self;
    mplSearchBar.hidden=NO;
    
    self.navigationItem.leftBarButtonItem = nil;
    self.navigationItem.hidesBackButton=YES;
    self.navigationItem.rightBarButtonItem=nil;
    [mplSearchBar setShowsCancelButton:YES animated:YES];
}


-(void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope{
    NSPredicate *resultPredicate    = [NSPredicate predicateWithFormat:@"mpName contains[cd] %@", searchText];
    searchMPList = [NSMutableArray arrayWithArray:[getMPDetails filteredArrayUsingPredicate:resultPredicate]];
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    if (searchText.length>0) {
        // search and reload data source
        isFiltered = YES;
        [self filterContentForSearchText:searchText scope:[[searchBar scopeButtonTitles] objectAtIndex:[searchBar selectedScopeButtonIndex]]];
        [MPCollectionList reloadData];
    }else{
        isFiltered = NO;
        [searchBar resignFirstResponder];
    }
    [MPCollectionList reloadData];
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
    [MPCollectionList reloadData];
    
    searchBar.hidden=YES;
    self.navigationItem.leftBarButtonItem=self.navigationItem.backBarButtonItem;
    [self.navigationItem setHidesBackButton:NO animated:YES];
    self.navigationItem.rightBarButtonItem = rightBarItem;
}

-(void)cancelSearching{
    mplSearchBar.text=@"";
    [mplSearchBar setShowsCancelButton:NO animated:YES];
    [mplSearchBar resignFirstResponder];
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
    if (isFiltered==NO) {
        return [getMPDetails count];
    }else{
        return [searchMPList count];
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    MP_CollectionCell *mpCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellMP" forIndexPath:indexPath];
    mpCell.layer.borderWidth=4;
    mpCell.layer.borderColor=[[UIColor groupTableViewBackgroundColor]CGColor];
    mpCell.layer.cornerRadius=1;
    
    mpCell.layer.shadowColor=[[UIColor blackColor]CGColor];
    mpCell.layer.shadowOffset=CGSizeMake(3,3);
    mpCell.layer.shadowOpacity=1.0;
    mpCell.layer.shadowRadius=2.0;
    mpCell.layer.shadowPath=[[UIBezierPath bezierPathWithRect:mpCell.bounds]CGPath];
    
    if (isFiltered==NO) {
        // mpCell.imgMP.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[[getMPDetails objectAtIndex:indexPath.row]valueForKey:@"mpImage"]]]];
        mpCell.lblMP.text = [[getMPDetails objectAtIndex:indexPath.row]valueForKey:@"mpName"];

    }else{
        // mpCell.imgMP.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[[searchMPList objectAtIndex:indexPath.row]valueForKey:@"mpImage"]]]];
        mpCell.lblMP.text = [[searchMPList objectAtIndex:indexPath.row]valueForKey:@"mpName"];
    }
    return mpCell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
   
    NSUserDefaults *uDef = [NSUserDefaults standardUserDefaults];
    if (isFiltered==NO) {
        NSString *setMPD = [getMPDetails objectAtIndex:indexPath.row];
        [uDef setValue:setMPD forKey:@"setDetails"];
    }else{
        NSString *setMPD = [searchMPList objectAtIndex:indexPath.row];
        [uDef setValue:setMPD forKey:@"setDetails"];
    }
    
    MP_DetailView *navMPDetails = [self.storyboard instantiateViewControllerWithIdentifier:@"mpDetails_SB"];
    [self.navigationController pushViewController:navMPDetails animated:YES];
}



#pragma mark <UICollectionViewDelegate>

//
//   // Uncomment this method to specify if the specified item should be highlighted during tracking
//- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
//	return YES;
//}


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
