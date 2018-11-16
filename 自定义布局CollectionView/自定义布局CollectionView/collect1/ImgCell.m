//
//  ImgCell.m
//  CollectionView自定义布局
//
//  Created by mac on 2018/11/15.
//  Copyright © 2018 mac. All rights reserved.
//

#import "ImgCell.h"
@interface ImgCell()
@property (nonatomic ,strong) UIImageView *imageView;
@end

@implementation ImgCell
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        self.imageView.layer.borderColor = [UIColor whiteColor].CGColor;
        self.imageView.layer.borderWidth = 10;
        [self addSubview:self.imageView];
//        self.imageView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    }
    return self;
}
//- (UIImageView *)imageView{
//    if (!_imageView) {
//        _imageView = [[UIImageView alloc]init];
//        self.imageView.layer.borderColor = [UIColor whiteColor].CGColor;
//        self.imageView.layer.borderWidth = 10;
//    }
//    return _imageView;
//}
- (void)setImageName:(NSString *)imageName{
    _imageName = [imageName copy];
    
    self.imageView.image = [UIImage imageNamed:imageName];
}
@end
