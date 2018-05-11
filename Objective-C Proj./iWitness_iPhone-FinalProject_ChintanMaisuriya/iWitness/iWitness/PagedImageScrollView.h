//
//  PagedImageScrollView.h
//  iWitness
//
//  Created by MACOS on 7/29/16.
//  Copyright © 2016 MAC OS. All rights reserved.
//


#import <UIKit/UIKit.h>

enum PageControlPosition {
    PageControlPositionRightCorner = 0,
    PageControlPositionCenterBottom = 1,
    PageControlPositionLeftCorner = 2,
};


@interface PagedImageScrollView : UIView

@property (nonatomic, strong)UIButton *btnCancel;
@property (nonatomic, strong) UIScrollView *scrollView;
@property(nonatomic, strong)UIVisualEffectView *blur;
@property (nonatomic, strong) UIPageControl *pageControl;
@property (nonatomic, assign) enum PageControlPosition pageControlPos; //default is PageControlPositionRightCorner

- (void)setScrollViewContents: (NSArray *)images;
@end
