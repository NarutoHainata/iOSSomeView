//
//  TextFieldAndKeyboard.m
//  iOSSomeView
//
//  Created by yang on 16/7/28.
//  Copyright © 2016年 poplary. All rights reserved.
//

#import "TextFieldAndKeyboard.h"

@interface TextFieldAndKeyboard ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)UITextField *textField;

@end

@implementation TextFieldAndKeyboard

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    //创建tableview主视图
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    self.tableView  = tableView;
    
    //监听键盘弹出和消失
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillAppear:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillDisappear:) name:UIKeyboardWillHideNotification object:nil];
    
}
-(CGFloat)keyboardEndingFrameHeight:(NSDictionary *)userInfo//计算键盘的高度
{
    CGRect keyboardEndingUncorrectedFrame = [[userInfo objectForKey:UIKeyboardFrameEndUserInfoKey]CGRectValue];
    CGRect keyboardEndingFrame = [self.view convertRect:keyboardEndingUncorrectedFrame fromView:nil];
    return keyboardEndingFrame.size.height;
}
-(void)keyboardWillAppear:(NSNotification *)notification
{
    CGRect currentFrame = self.view.frame;
    CGFloat change = [self keyboardEndingFrameHeight:[notification userInfo]];
    currentFrame.origin.y = currentFrame.origin.y - change + 40;
    self.tableView.frame = currentFrame;
}
-(void)keyboardWillDisappear:(NSNotification *)notification
{
    CGRect currentFrame = self.tableView.frame;
    CGFloat change = [self keyboardEndingFrameHeight:[notification userInfo]];
    currentFrame.origin.y = currentFrame.origin.y + change - 40 ;
    self.tableView.frame = currentFrame;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellid"];
    cell.selectionStyle  =UITableViewCellSelectionStyleNone;
    //设置背景图片
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:self.view.frame];
    imageView.image = [UIImage imageNamed:@"background.jpg"];
    [cell.contentView addSubview:imageView];
    //设置按钮 用于消失键盘
    UIButton *keyboardBtn = [[UIButton alloc]initWithFrame:tableView.frame];
    [keyboardBtn setBackgroundColor:[UIColor clearColor]];
    [keyboardBtn addTarget:self action:@selector(dismissKeyboardClick) forControlEvents:UIControlEventTouchUpInside];
    [cell.contentView addSubview:keyboardBtn];
    //设置后退按钮
    UIButton *backBtn = [[UIButton alloc]initWithFrame:CGRectMake(20, 40, 30, 30)];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"back.png"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(clickBack) forControlEvents:UIControlEventTouchUpInside];
    [cell.contentView addSubview:backBtn];
    //设置输入款
    UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(20, SCREEN_HEIGHT/7*3, SCREEN_WIDTH-40, 40)];
    textField.delegate = self;
    textField.placeholder = @"请输入您的用户名";
    textField.textAlignment = NSTextAlignmentCenter;
    textField.backgroundColor = [UIColor whiteColor];
    textField.layer.cornerRadius = 10;
    [cell.contentView addSubview:textField];
    self.textField = textField;
    //闲置在一吨以内
    UILabel *limitLab = [[UILabel alloc]initWithFrame:CGRectMake(20, SCREEN_HEIGHT/7*3+50, SCREEN_WIDTH-40, 20)];
    limitLab.text = @"请输入100字以上的用户名";
    limitLab.textColor = [UIColor whiteColor];
    [cell.contentView addSubview:limitLab];
    limitLab.textAlignment = NSTextAlignmentRight;
    limitLab.font = [UIFont fontWithName:@"Arial" size:14];
    //设置拼车按钮
    UIButton *poolBtn = [[UIButton alloc]initWithFrame:CGRectMake(20, SCREEN_HEIGHT/7*3+80, SCREEN_WIDTH-40, 40)];
    [poolBtn setTitle:@"立即申请注册" forState:UIControlStateNormal];
    [poolBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [poolBtn setBackgroundColor:RGBA(141, 238, 238, 1)];
    poolBtn.layer.cornerRadius = 10;
    [poolBtn addTarget:self action:@selector(poolClick) forControlEvents:UIControlEventTouchUpInside];
    [cell.contentView addSubview:poolBtn];
    //设置拼车申请规则
    UIButton *ruleBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH-40, 20)];
    ruleBtn.center = CGPointMake(SCREEN_WIDTH/2, SCREEN_HEIGHT/7*3+140);
    ruleBtn.backgroundColor = [UIColor clearColor];
    [ruleBtn setTitleColor:RGBA(135, 206, 250, 1) forState:UIControlStateNormal];
    [ruleBtn setTitle:@"注册申请规则>>" forState:UIControlStateNormal];
    ruleBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    ruleBtn.titleLabel.font = [UIFont fontWithName:@"Arial" size:14];
    [ruleBtn addTarget:self action:@selector(ruleClick) forControlEvents:UIControlEventTouchUpInside];
    [cell.contentView addSubview:ruleBtn];
    return cell;
}

-(void)clickBack{
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)poolClick{
    
}
-(void)ruleClick{
    
}
-(void)dismissKeyboardClick{
    [self.textField resignFirstResponder];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return SCREEN_HEIGHT;
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
