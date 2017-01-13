//
//  ZJNHeaderView.m
//  ZJNBanTangHomeNavigationDemo
//
//  Created by 朱佳男 on 2017/1/10.
//  Copyright © 2017年 ShangYuKeJi. All rights reserved.
//

#import "ZJNHeaderView.h"
#import "UIView+Extension.h"
#import "UIImage+ZJNImage.h"
#define NAVBAR_CHANGE_POINT 50

@interface ZJNHeaderView()

@property (nonatomic ,strong)UISearchBar *searchBar;//搜索框
@property (nonatomic ,strong)UIButton    *searchButton;//搜索按钮
@property (nonatomic ,strong)UIButton    *emailButton;//邮箱按钮

@end
@implementation ZJNHeaderView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.searchBar];
        [self addSubview:self.searchButton];
        [self addSubview:self.emailButton];
    }
    return self;
}
-(void)dealloc
{
    [self.tableView removeObserver:self forKeyPath:NSStringFromSelector(@selector(contentOffset))];
    
}
-(void)willMoveToSuperview:(UIView *)newSuperview
{
    [super willMoveToSuperview:newSuperview];
    NSKeyValueObservingOptions options = NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld;
    [self.tableView addObserver:self forKeyPath:@"contentOffset" options:options context:nil];
//    [self.tableView addObserver:self forKeyPath:NSStringFromSelector(@selector(contentOffset)) options:options context:nil];之所以用这种方法是为了防止拼写错误
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    if (![keyPath isEqualToString:@"contentOffset"]) {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
        return;
    }
    UITableView *tableView = (UITableView *)object;
    CGFloat tableViewOffsetY = tableView.contentOffset.y;
    
    UIColor *color = [UIColor whiteColor];
    CGFloat alpha = MIN(1, tableViewOffsetY/136);
    self.backgroundColor = [color colorWithAlphaComponent:alpha];
    
    if (tableViewOffsetY < 125) {
        [UIView animateWithDuration:0.25 animations:^{
            self.searchButton.hidden = NO;
            [self.emailButton setBackgroundImage:[UIImage imageNamed:@"home_email_black"] forState:UIControlStateNormal];
            self.searchBar.frame = CGRectMake(-(self.width-60), 30, self.width-80, 30);
            self.searchButton.alpha = 1-alpha;
            self.emailButton.alpha = 1-alpha;
        }];
    }else if (tableViewOffsetY >= 125){
        [UIView animateWithDuration:0.25 animations:^{
            self.searchBar.frame = CGRectMake(20, 30, self.width-80, 30);
            self.searchButton.hidden = YES;
            self.emailButton.alpha = 1;
            [self.emailButton setBackgroundImage:[UIImage imageNamed:@"home_email_red"] forState:UIControlStateNormal];
        }];
    }
}

-(UISearchBar *)searchBar
{
    if (!_searchBar) {
        _searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(-(self.width - 60), 30, self.width-80, 30)];
        _searchBar.placeholder = @"搜索值得买的好物";
        _searchBar.layer.cornerRadius = 15;
        _searchBar.layer.masksToBounds = YES;
        [_searchBar setSearchFieldBackgroundImage:[UIImage imageWithColor:[UIColor clearColor] size:_searchBar.size] forState:UIControlStateNormal];
        [_searchBar setBackgroundImage:[UIImage imageWithColor:[[UIColor grayColor] colorWithAlphaComponent:0.4] size:_searchBar.size]];
        UITextField *searchField = [_searchBar valueForKey:@"_searchField"];
        searchField.textColor = [UIColor whiteColor];
        [searchField setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
        
    }
    return _searchBar;
}

-(UIButton *)searchButton
{
    if (!_searchButton) {
        _searchButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _searchButton.frame = CGRectMake(20, 30, 30, 30);
        [_searchButton setBackgroundImage:[UIImage imageNamed:@"home_search_icon"] forState:UIControlStateNormal];
    }
    return _searchButton;
}

-(UIButton *)emailButton
{
    if (!_emailButton) {
        _emailButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _emailButton.frame = CGRectMake(self.width-45, 30, 30, 30);
        [_emailButton setBackgroundImage:[UIImage imageNamed:@"home_email_black"] forState:UIControlStateNormal];
    }
    return _emailButton;
}

@end
