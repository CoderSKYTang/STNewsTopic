//
//  ViewController.m
//  STNewsTopic
//
//  Created by 研发部 on 16/5/9.
//  Copyright © 2016年 yanfabu. All rights reserved.
//

#import "ViewController.h"



@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

// 轮播图
@property (nonatomic, strong) NSArray *slideArr;

// 新闻
@property (nonatomic, strong) NSArray *listsArr;

@end

@implementation ViewController

#pragma mark ----------------------
#pragma mark 初始化方法
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"新闻专题";
    [self tableViewSetup];
}

- (void)tableViewSetup
{
    CGFloat screenW = [UIScreen mainScreen].bounds.size.width;
    CGFloat screenH = [UIScreen mainScreen].bounds.size.height;
    
    UITableView *topicView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, screenW, (screenH - 64 - 44)) style:UITableViewStyleGrouped];
    [self.view addSubview:topicView];
    topicView.backgroundColor = [UIColor redColor];
    topicView.dataSource = self;
    topicView.delegate = self;
}

#pragma mark ----------------------
#pragma mark UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *ID = @"ID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}

@end
