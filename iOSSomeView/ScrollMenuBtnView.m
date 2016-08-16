//
//  MenuBtnView.m
//  PY_ScrollNewsMenuView
//
//  Created by yang on 16/7/20.
//  Copyright © 2016年 poplary. All rights reserved.
//

#import "ScrollMenuBtnView.h"

@implementation ScrollMenuBtnView

-(id)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor clearColor];

    }
    return self;
}
-(void)setBtnTitleArr:(NSMutableArray *)btnTitleArr{
    
    _btnTitleArr = btnTitleArr;
    [self createMenuBtn];
    
}
-(void)createMenuBtn{

    //自定义界面，创建按钮
    for (int i = 0 ; i<self.btnTitleArr.count; i++) {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(self.frame.size.width/3*i, 10, self.frame.size.width/3, 60)];
        [btn setTitle:[self.btnTitleArr objectAtIndex:i] forState:UIControlStateNormal];
       
        [btn setTitleColor:[UIColor colorWithRed:104/255.0 green:104/255.0 blue:124/255.0 alpha:1.f] forState:UIControlStateNormal];
        [btn setBackgroundColor:[UIColor clearColor]];
        //config
        btn.layer.borderColor = [UIColor grayColor].CGColor;
        btn.layer.borderWidth = 1;
        btn.layer.cornerRadius = 10;
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [btn setTag:i];
        
        
        [self addSubview:btn];
        
        if (i == 0) {
            //默认第一个选中
            self.selectBtn = btn;
        }
    }

}
-(void)btnClick:(UIButton *)sender{

    if (self.selectBtn == sender) {
        return;
    }
    self.selectBtn = sender;
    
    if ([self.delegate respondsToSelector:@selector(btnClickMenuViewAtIndex:)]) {
       
        [self.delegate btnClickMenuViewAtIndex:sender.tag];
    }
    
}
- (void)setselectedIndex:(NSInteger)index{

    if (self.subviews.count>index) {
        UIButton *selectBtn = (UIButton *)[self subviews][index];
        self.selectBtn = selectBtn;
        
    }

}
//设置选中目录
- (void)setSelectBtn:(UIButton *)selectBtn{
    if (selectBtn == _selectBtn) {
        return;
    }
    //改变按钮颜色
    [self.selectBtn setTitleColor:[UIColor colorWithRed:104/255.0 green:104/255.0 blue:124/255.0 alpha:1.f] forState:UIControlStateNormal];
    [selectBtn setTitleColor:[UIColor colorWithRed:49/255.0 green:195/255.0 blue:124/255.0 alpha:1.f] forState:UIControlStateNormal];
    
    //缩放动画
    CABasicAnimation *animation1 = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation1.fromValue = [NSNumber numberWithFloat:1.2f];
    animation1.toValue  = [NSNumber numberWithFloat:1.0f];
    animation1.duration = 0.3;
    animation1.repeatCount = 1;
    animation1.fillMode = kCAFillModeForwards;
    animation1.removedOnCompletion = NO;
    animation1.autoreverses = NO;
    [self.selectBtn.titleLabel.layer addAnimation:animation1 forKey:@"animation1"];
    
    CABasicAnimation *animation2 = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation2.fromValue = [NSNumber numberWithFloat:1.0f];
    animation2.toValue  = [NSNumber numberWithFloat:1.2f];
    animation2.duration = 0.3;
    animation2.repeatCount = 1;
    animation2.fillMode = kCAFillModeForwards;
    animation2.removedOnCompletion = NO;
    animation2.autoreverses = NO;
    [selectBtn.titleLabel.layer addAnimation:animation2 forKey:@"animation2"];
    
    _selectBtn = selectBtn;
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
