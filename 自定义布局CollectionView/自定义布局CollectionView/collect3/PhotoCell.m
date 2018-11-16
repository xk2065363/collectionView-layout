//
//  PhotoCell.m
//  自定义布局CollectionView
//
//  Created by mac on 2018/11/16.
//  Copyright © 2018 mac. All rights reserved.
//

#import "PhotoCell.h"

@interface PhotoCell()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation PhotoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.imageView.layer.borderColor = [UIColor whiteColor].CGColor;
    self.imageView.layer.borderWidth = 10;
}
- (void)setImageName:(NSString *)imageName
{
    _imageName = [imageName copy];
    
    self.imageView.image = [UIImage imageNamed:imageName];
}
@end
