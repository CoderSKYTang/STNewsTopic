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
@property (nonatomic, strong) NSMutableArray *listsArr;

@end

@implementation ViewController

#pragma mark ----------------------
#pragma mark LazyLoad
- (NSMutableArray *)listsArr
{
    if (_listsArr == nil) {
        NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:@"/Users/yanfabu/Desktop/requestData.plist"][@"data"][@"common"][@"list"];
        for (NSDictionary *listDict in dict[@"lists"]) {
            
        }
        _listsArr = dict[@"lists"];
    }
    return _listsArr;
}

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
    topicView.dataSource = self;
    topicView.delegate = self;
}

#pragma mark ----------------------
#pragma mark UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.listsArr.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *arr = self.listsArr[section];
    return arr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *ID = @"ID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    NSDictionary *dict = self.listsArr[indexPath.section][indexPath.row];
    cell.textLabel.text = dict[@"title"];
    return cell;
}

@end
