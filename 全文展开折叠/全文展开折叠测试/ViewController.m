//
//  ViewController.m
//  全文展开折叠测试
//
//  Created by Biao on 16/6/4.
//  Copyright © 2016年 Biao.com. All rights reserved.
//

#import "ViewController.h"
#import "TestCell.h"
@interface ViewController () <cellDelegate,UITableViewDelegate, UITableViewDataSource>

@property(nonatomic,strong) UITableView *testTBV;
@property (nonatomic,strong) NSMutableArray *expandArray;
@end

static NSString *CellIdentifier = @"TableViewCell";

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.expandArray = [NSMutableArray array];
    _testTBV = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _testTBV.delegate = self;
    _testTBV.dataSource = self;
    [_testTBV registerNib:[UINib nibWithNibName:@"TestCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:CellIdentifier];
    _testTBV.estimatedRowHeight = 80;
    _testTBV.rowHeight = UITableViewAutomaticDimension;
    [self.view addSubview:_testTBV];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TestCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        
        cell = [[[NSBundle mainBundle]loadNibNamed:@"TestCell" owner:nil options:nil] lastObject];
    }
    
    cell.delegate = self;
    
    cell.button.tag = indexPath.row;
    
    cell.testLabel.text =   [NSString stringWithFormat: @"第%ld行 ------ 全新的Quick Type功能发挥了Siri的人工智能属性，用户在输入的时候系统将自动提供输入建议。另外Siri自消息应用中的响应也更为智能，比如当有朋友询问“你在哪里”时Siri将自动提供位置信息，而当询问“John的邮件说写了什么”的时候Siri会自动搜索联系人信息。",indexPath.row];
    

    //    cell.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];
    
    if ( [self.expandArray containsObject: indexPath]) {
        cell.testLabel.numberOfLines = 0;
        [cell.button setTitle:@"收起" forState:UIControlStateNormal];
    }else{
        cell.testLabel.numberOfLines = 1;
        [cell.button setTitle:@"展开" forState:UIControlStateNormal];
    }
    
    
    return cell;
}


-(void)reloadAtIndex:(NSInteger)row
{
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:row inSection:0];
    
    if ( [self.expandArray containsObject:indexPath]) {
        [self.expandArray removeObject:indexPath];
    }else{
        [self.expandArray addObject:indexPath];
    }
    
    NSLog(@"count: %ld",self.expandArray.count);
    
    
    [self.testTBV reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
