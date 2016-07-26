//
//  MenuBtnViewController.m
//  iOSSomeView
//
//  Created by yang on 16/7/26.
//  Copyright © 2016年 poplary. All rights reserved.
//

#import "MenuBtnViewController.h"
#import "Header.h"
@interface MenuBtnViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
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
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-100, 0, 100, 160) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource  = self;
    tableView.hidden = YES;
    tableView.layer.cornerRadius = 10;
    [self.view addSubview:tableView];
    self.tableView = tableView;
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(hideTableView)];
    [self.view addGestureRecognizer:pan];
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellid"];
    cell.textLabel.text = @"cell";
    return  cell;
}
-(void)rightBtnClick{
    
    if (self.tableView.hidden == YES) {
        self.tableView.hidden  = NO;
    }else{
        self.tableView.hidden = YES;
    }
    
    
    
}
-(void)hideTableView{
    self.tableView.hidden  = YES;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 30;
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
