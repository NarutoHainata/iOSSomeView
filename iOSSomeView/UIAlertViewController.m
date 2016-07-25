//
//  UIAlertViewController.m
//  iOSSomeView
//
//  Created by yang on 16/7/25.
//  Copyright © 2016年 poplary. All rights reserved.
//

#import "UIAlertViewController.h"

@interface UIAlertViewController ()
@property(nonatomic,strong)NSMutableArray *alertBtnArr;
@end

@implementation UIAlertViewController

- (void)viewDidLoad {
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.title = @"UIAlertViewController";
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.alertBtnArr = [[NSMutableArray alloc]init];
    for (int i = 0; i<2; i++) {
        
        UIButton *alertViewBtn = [[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width/4, 100+50*i, self.view.frame.size.width/2, 30)];
        alertViewBtn.backgroundColor = [UIColor greenColor];
        alertViewBtn.layer.borderColor = [UIColor grayColor].CGColor;
        alertViewBtn.layer.cornerRadius = 10;
        alertViewBtn.layer.borderWidth = 1;
        [alertViewBtn setTag:i];
        [alertViewBtn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:alertViewBtn];
        [self.alertBtnArr addObject:alertViewBtn];
    }
    //设置按钮的字体颜色和文字
    [[self.alertBtnArr objectAtIndex:0] setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [[self.alertBtnArr objectAtIndex:0] setTitle:@"点击登录" forState:UIControlStateNormal];
    [[self.alertBtnArr objectAtIndex:1] setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [[self.alertBtnArr objectAtIndex:1] setTitle:@"点击分享" forState:UIControlStateNormal];
}
-(void)click:(UIButton *)sender{
    if (sender.tag == 0) {
        [self eventAlert];
    }
    else if (sender.tag == 1){
        [self eventActionSheet];
    }
    
}
#pragma mark eventAlert
-(void)eventAlert{
    //创建alert控制器 设置样式UIAlertControllerStyleAlert
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Title-登录" message:@"Message-请输入登录信息" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"登录" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    UIAlertAction *cancleAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alertController addAction:defaultAction];
    [alertController addAction:cancleAction];
    //为alertController 添加textField
    if (alertController.preferredStyle == UIAlertControllerStyleAlert) {
        [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
            // 给输入框设置一些信息
            textField.placeholder = @"请输入用户名";
            textField.textAlignment = NSTextAlignmentCenter;
        }];
        [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
            // 给输入框设置一些信息
            textField.placeholder = @"请输入密码";
            textField.secureTextEntry = YES;
            textField.textAlignment = NSTextAlignmentCenter;
        }];
    }
    [self presentViewController:alertController animated:YES completion:nil];
    
}
#pragma mark eventActionSheet
-(void)eventActionSheet{
    //创建alert控制器 设置样式UIAlertControllerStyleActionSheet
    UIAlertController *ActionSheetController = [UIAlertController alertControllerWithTitle:@"Title-分享" message:@"Message-请选择分享平台" preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *defaultActionSheet = [UIAlertAction actionWithTitle:@"百度分享" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    UIAlertAction *cancleActionSheet = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [ActionSheetController addAction:defaultActionSheet];
    [ActionSheetController addAction:cancleActionSheet];
    
    
    [self presentViewController:ActionSheetController animated:YES completion:nil];

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
