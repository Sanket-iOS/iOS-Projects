//
//  NewsFeed.m
//  iWitness
//
//  Created by Chintan on 07/10/16.
//  Copyright © 2016 MAC OS. All rights reserved.
//

#import "NewsFeed.h"

@interface NewsFeed ()

@end

@implementation NewsFeed

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewDidAppear:(BOOL)animated{
    UIAlertController *alt = [UIAlertController alertControllerWithTitle:@"Caution!" message:@"This service will be available shortly" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *actOK = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
        [self dismissViewControllerAnimated:YES completion:NULL];
    }];
    
    [alt addAction:actOK];
    [self presentViewController:alt animated:YES completion:NULL];
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

@end
