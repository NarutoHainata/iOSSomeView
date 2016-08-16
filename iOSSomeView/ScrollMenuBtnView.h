//
//  MenuBtnView.h
//  PY_ScrollNewsMenuView
//
//  Created by yang on 16/7/20.
//  Copyright © 2016年 poplary. All rights reserved.
//
#import <UIKit/UIKit.h>

@protocol ScrollMenuViewDelegate <NSObject>

-(void)btnClickMenuViewAtIndex:(NSInteger)index;

@end

@interface ScrollMenuBtnView : UIView
@property(nonatomic,weak)id<ScrollMenuViewDelegate> delegate;
@property(nonatomic,strong)UIButton *selectBtn;
@property(nonatomic,strong)UILabel *selectLab;
@property(nonatomic,strong)NSMutableArray *btnTitleArr;
- (void)setselectedIndex:(NSInteger)index;
@end
