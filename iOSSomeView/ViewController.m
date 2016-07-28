//
//  ViewController.m
//  iOSSomeView
//
//  Created by yang on 16/7/25.
//  Copyright © 2016年 poplary. All rights reserved.
//

#import "ViewController.h"

#import "Header.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *saveVCArr;
@property(nonatomic,strong)NSMutableArray *saveCellTtile;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"主页";
    // Do any additional setup after loading the view, typically from a nib.
    UIAlertViewController *alertViewC = [[UIAlertViewController alloc]init];
    CollectionViewController *collectionViewC = [[CollectionViewController alloc]init];
    MenuBtnViewController *menuBtnViewC = [[MenuBtnViewController alloc]init];
    TextFieldAndKeyboard *textFieldKeyboard = [[TextFieldAndKeyboard alloc]init];
    
    
    self.saveVCArr = [[NSMutableArray alloc]initWithObjects:alertViewC,collectionViewC,menuBtnViewC,textFieldKeyboard, nil];
    
    self.saveCellTtile = [[NSMutableArray alloc]initWithObjects:@"UIAlertController",@"CollectionViewController",@"MenuBtnViewController",@"TextFieldAndKeyboard", nil];
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.backgroundColor = RGBA(245, 245, 245, 1);
    tableView.backgroundView = [[UIView alloc]initWithFrame:tableView.frame];
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:tableView.frame];
    imageView.image = [UIImage imageNamed:@"mainbg.jpeg"];
    [tableView.backgroundView addSubview:imageView];
    tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 0.01f)];
    tableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:tableView];
    self.tableView = tableView;
    
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.saveVCArr.count;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellid"];
    cell.textLabel.text = [self.saveCellTtile objectAtIndex:indexPath.row];
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor whiteColor];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [self.navigationController pushViewController:[self.saveVCArr objectAtIndex:indexPath.row] animated:NO];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
