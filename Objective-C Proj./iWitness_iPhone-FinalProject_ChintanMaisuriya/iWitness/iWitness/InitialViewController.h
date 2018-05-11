//
//  InitialViewController.h
//  iWitness
//
//  Created by Chintan on 11/09/16.
//  Copyright © 2016 MAC OS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InitialViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *btnSignIn;
@property (weak, nonatomic) IBOutlet UIButton *btnSignUp;

- (IBAction)btnSignIn:(id)sender;
- (IBAction)btnSignUp:(id)sender;

@end
