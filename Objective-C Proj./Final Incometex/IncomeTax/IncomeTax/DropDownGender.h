//
//  DropDownGender.h
//  IncomeTax
//
//  Created by tops on 3/29/15.
//  Copyright (c) 2015 tops. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    BLENDIN1,
    GROW1,
    BOTH1
} AnimationType1;

@protocol DropDownViewDelegate

@required

-(void)dropDownCellSelected1:(NSInteger)returnIndex;

@end


@interface DropDownGender : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    
	UITableView *uiTableView;
	
	NSArray *arrayData;
	
	CGFloat heightOfCell;
	
	CGFloat paddingLeft;
	
	CGFloat paddingRight;
	
	CGFloat paddingTop;
	
	CGFloat heightTableView;
	
	UIView *refView;
	
	id<DropDownViewDelegate> delegate;
	
	NSInteger animationType;
	
	CGFloat open;
	
	CGFloat close;

}
@property (nonatomic,retain) id<DropDownViewDelegate> delegate;

@property (nonatomic,retain)UITableView *uiTableView;

@property (nonatomic,retain) NSArray *arrayData;

@property (nonatomic) CGFloat heightOfCell;

@property (nonatomic) CGFloat paddingLeft;

@property (nonatomic) CGFloat paddingRight;

@property (nonatomic) CGFloat paddingTop;

@property (nonatomic) CGFloat heightTableView;

@property (nonatomic,retain)UIView *refView;

@property (nonatomic) CGFloat open;

@property (nonatomic) CGFloat close;

- (id)initWithArrayData:(NSArray*)data cellHeight:(CGFloat)cHeight heightTableView:(CGFloat)tHeightTableView paddingTop:(CGFloat)tPaddingTop paddingLeft:(CGFloat)tPaddingLeft paddingRight:(CGFloat)tPaddingRight refView:(UIView*)rView animation:(AnimationType1)tAnimation  openAnimationDuration:(CGFloat)openDuration closeAnimationDuration:(CGFloat)closeDuration;

-(void)closeAnimation;

-(void)openAnimation;

@end
