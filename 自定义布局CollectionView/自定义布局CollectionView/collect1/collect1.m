//
//  collect1.m
//  CollectionView自定义布局
//
//  Created by mac on 2018/11/15.
//  Copyright © 2018 mac. All rights reserved.
//

#import "collect1.h"
#import "ImgCell.h"
#import "XKLineLayout.h"
@interface collect1 ()<UICollectionViewDataSource, UICollectionViewDelegate>
@property (nonatomic ,strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSArray *itemTitles;
@end

@implementation collect1

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    // 创建布局
    XKLineLayout *layout = [[XKLineLayout alloc] init];
    layout.itemSize = CGSizeMake(100, 100);
    
    // 创建CollectionView
    CGFloat collectionW = self.view.frame.size.width;
    CGFloat collectionH = 200;
    CGRect frame = CGRectMake(0, 150, collectionW, collectionH);
    _collectionView = [[UICollectionView alloc] initWithFrame:frame collectionViewLayout:layout];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    [self.view addSubview:_collectionView];
    
    // 注册
   
    [_collectionView registerClass:[ImgCell class] forCellWithReuseIdentifier:NSStringFromClass([ImgCell class])];
}
#pragma mark - <UICollectionViewDataSource>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 15;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    ImgCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([ImgCell class]) forIndexPath:indexPath];

    cell.imageName = [NSString stringWithFormat:@"%zd", indexPath.item];
    
    return cell;
}

#pragma mark - <UICollectionViewDelegate>
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"------%zd", indexPath.item);
    
    [self.collectionView selectItemAtIndexPath:indexPath animated:YES scrollPosition:UICollectionViewScrollPositionNone];
    
    //滚动到中间
    [self.collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    
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
