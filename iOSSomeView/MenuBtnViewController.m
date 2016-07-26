//
//  MenuBtnViewController.m
//  iOSSomeView
//
//  Created by yang on 16/7/26.
//  Copyright © 2016年 poplary. All rights reserved.
//

#import "MenuBtnViewController.h"
#import "Header.h"
@interface MenuBtnViewController ()<UIPopoverPresentationControllerDelegate>
@property(nonatomic,strong)PopoverViewController *popoverVC;
@end

@implementation MenuBtnViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = RGBA(245, 245, 245, 1);
    self.title = @"MenuBtnViewController";
    //自定义右按钮
    UIButton *rightBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
    rightBtn.backgroundColor = [UIColor blackColor];
    [rightBtn addTarget:self action:@selector(rightBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *rightBtnItem = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    self.navigationItem.rightBarButtonItem = rightBtnItem;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tableDidSelected:) name:@"click" object:nil];
    
}
//处理popover上的talbe的cell点击
- (void)tableDidSelected:(NSNotification *)notification {
    NSIndexPath *indexpath = (NSIndexPath *)notification.object;
    switch (indexpath.row) {
        case 0:
            self.view.backgroundColor = [UIColor greenColor];
            break;
        case 1:
            self.view.backgroundColor = [UIColor grayColor];
            break;
        case 2:
            self.view.backgroundColor = [UIColor blueColor];
            break;
        case 3:
            self.view.backgroundColor = [UIColor purpleColor];
            break;
        case 4:
            self.view.backgroundColor = [UIColor yellowColor];
            break;
    }
}

-(void)rightBtnClick{
    
    
    self.popoverVC = [[PopoverViewController alloc] init];
    self.popoverVC.modalPresentationStyle = UIModalPresentationPopover;
    self.popoverVC.popoverPresentationController.barButtonItem = self.navigationItem.rightBarButtonItem;  //rect参数是以view的左上角为坐标原点（0，0）
    self.popoverVC.popoverPresentationController.permittedArrowDirections = UIPopoverArrowDirectionUnknown; //箭头方向,如果是baritem不设置方向，会默认up，up的效果也是最理想的
    self.popoverVC.popoverPresentationController.delegate = self;
    [self presentViewController:self.popoverVC animated:YES completion:nil];

    
}
- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller{
    return UIModalPresentationNone;
}

- (BOOL)popoverPresentationControllerShouldDismissPopover:(UIPopoverPresentationController *)popoverPresentationController{
    return YES;   //点击蒙版popover不消失， 默认yes
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
