//
//  ViewController.m
//  自定义布局CollectionView
//
//  Created by mac on 2018/11/15.
//  Copyright © 2018 mac. All rights reserved.
//

#import "ViewController.h"
#import "collect1.h"
#import "collect2.h"
#import "collect3.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic ,strong) UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self tableView];
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        _tableView.showsVerticalScrollIndicator = NO;
        [self.view addSubview:self.tableView];
    }
    return _tableView;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSArray *arr = @[@"1",@"2",@"3"];
    // 创建一个cellID，用于cell的重用
    NSString *cellID = @"cellID";
    // 从tableview的重用池里通过cellID取一个cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        // 如果tableview的重用池中没有取到，就创建一个新的cell，style为Value2，并用cellID对其进行标记。
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:cellID];
    }
    // 设置 cell 的标题
    cell.textLabel.text = [NSString stringWithFormat:@"这是第%@个cell", arr[indexPath.row]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
        NSLog(@"%ld",indexPath.row);
        switch (indexPath.row) {
            case 0:
            {
                collect1 *vc = [[collect1 alloc]init];
                [self.navigationController pushViewController:vc animated:YES];
            }
                break;
            case 1:
            {
                collect2 *vc = [[collect2 alloc]init];
                [self.navigationController pushViewController:vc animated:YES];
            }
                break;
            case 2:
            {
                collect3 *vc = [[collect3 alloc]init];
                [self.navigationController pushViewController:vc animated:YES];
            }
                break;
            default:
                break;
        }
}
@end
