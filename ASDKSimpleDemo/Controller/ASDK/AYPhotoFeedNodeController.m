//
//  AYPhotoFeedNodeController.m
//  ASDKSimpleDemo
//
//  Created by wpsd on 2016/11/11.
//  Copyright © 2016年 wpsd. All rights reserved.
//

#import "AYPhotoFeedNodeController.h"

@interface AYPhotoFeedNodeController ()<ASTableDelegate, ASTableDataSource>

@property (strong, nonatomic) ASTableNode *tableNode;

@end

@implementation AYPhotoFeedNodeController

#pragma mark - lifecycle

- (instancetype)init {
    
    _tableNode = [ASTableNode new];
    self = [super initWithNode:_tableNode];
    if (self == nil) { return self; }
    
    _tableNode.delegate = self;
    _tableNode.dataSource = self;
    [self.node addSubnode:_tableNode];
    
    return self;
}

- (void)loadView {
    [super loadView];
    
    self.tableNode.view.allowsSelection = NO;
    self.tableNode.view.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

#pragma mark - ASTableDataSource / ASTableDelegate

- (NSInteger)tableNode:(ASTableNode *)tableNode numberOfRowsInSection:(NSInteger)section {
    return 200;
}

- (ASCellNodeBlock)tableNode:(ASTableNode *)tableNode nodeBlockForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellStr = [NSString stringWithFormat:@"cell indexPath -> row:%lu", indexPath.row];
    return ^{
        ASTextCellNode *cellNode = [ASTextCellNode new];
        cellNode.text = cellStr;
        return cellNode;
    };
}

@end
