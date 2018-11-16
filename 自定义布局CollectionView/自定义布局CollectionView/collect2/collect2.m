//
//  collect2.m
//  自定义布局CollectionView
//
//  Created by mac on 2018/11/16.
//  Copyright © 2018 mac. All rights reserved.
//

#import "collect2.h"
#import "ImgCell.h"
#import "XKWaterLayout.h"
@interface collect2 ()<UICollectionViewDataSource, UICollectionViewDelegate>

@end

@implementation collect2

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 创建布局
    XKWaterLayout *layout = [[XKWaterLayout alloc] init];
    
    // 创建CollectionView
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    [self.view addSubview:collectionView];
    
    // 注册
    [collectionView registerClass:[ImgCell class] forCellWithReuseIdentifier:NSStringFromClass([ImgCell class])];
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
}



@end
