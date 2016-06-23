//
//  ViewController.m
//  LeaksExample
//
//  Created by Сергей Романков on 22.06.16.
//  Copyright © 2016 Сергей Романков. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation ViewController{
    NSArray* _arrayTableData;
    UITableView* _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _arrayTableData = @[@"Утечки в делегатах", @"Утечки в блоках"];
    
    // Create tableView
    _tableView = [[UITableView alloc] initWithFrame:self.view.frame];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    
    [self.view addSubview:_tableView];
}

#pragma mark - UITableViewDataSource


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _arrayTableData.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell* cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@""];
    cell.textLabel.text = _arrayTableData[indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self pushViewControllerForIndex:indexPath.row];
}

#pragma marl - 

-(void)pushViewControllerForIndex:(NSInteger)index{
    UIViewController* viewController;
    switch (index) {
        case 0:
            viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"VCLeaksDelegate"];
            break;
            
        case 1:
            viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"VCLeaksBlocks"];
            break;
            
        default:
            break;
    }
    
    [self.navigationController pushViewController:viewController animated:YES];
}
@end
