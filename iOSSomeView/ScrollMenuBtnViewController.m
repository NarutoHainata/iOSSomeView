//
//  ViewController.m
//  PY_ScrollNewsMenuView
//
//  Created by yang on 16/7/20.
//  Copyright © 2016年 poplary. All rights reserved.
//
#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height
#define randColor [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1];
#import "ScrollMenuBtnViewController.h"
#import "ScrollMenuBtnView.h"
@interface ScrollMenuBtnViewController ()<UIScrollViewDelegate,ScrollMenuViewDelegate>
@property(nonatomic,strong)UIScrollView *scrollView;
@property(nonatomic,strong)ScrollMenuBtnView *menuBtnView;
@property(nonatomic,strong)NSMutableArray *titleBtnArr;
@end

@implementation ScrollMenuBtnViewController

- (void)viewDidLoad {
    
    // Do any additional setup after loading the view, typically from a nib.
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    self.title = @"ScrollMenuBtnViewController";
    self.view.backgroundColor = randColor;
    
    self.titleBtnArr = [[NSMutableArray alloc]initWithArray:@[@"动漫",@"爱情",@"穿越"]];
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 80, WIDTH, HEIGHT-80)];
    scrollView.delegate = self;
    scrollView.contentSize = CGSizeMake(WIDTH*self.titleBtnArr.count, HEIGHT-80);
    for (int i = 0 ; i<self.titleBtnArr.count; i++) {
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(scrollView.frame.size.width*i, 0, scrollView.frame.size.width, scrollView.frame.size.height)];
        view.backgroundColor = randColor;
        [scrollView addSubview:view];
    }
    //设置整页滚动
    scrollView.pagingEnabled = YES;
    [self.view addSubview:scrollView];
    self.scrollView = scrollView;
    
    [super viewDidLoad];
    //创建菜单栏
    ScrollMenuBtnView *menuView = [[ScrollMenuBtnView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 60)];
    menuView.delegate = self;
    menuView.btnTitleArr = self.titleBtnArr;
    [self.view addSubview:menuView];
    self.menuBtnView = menuView;

}
-(void)btnClickMenuViewAtIndex:(NSInteger)index{
    
    self.scrollView.contentOffset = CGPointMake(index*WIDTH, 0);
    
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    int current = scrollView.contentOffset.x/[UIScreen mainScreen].bounds.size.width;
    
    [self.menuBtnView setselectedIndex:current];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
