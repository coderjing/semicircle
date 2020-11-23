//
//  JYZJCircularCollectionViewLayout.m
//  demo
//
//  Created by jing on 2020/11/23.
//  Copyright © 2020 jing. All rights reserved.
//

#import "JYZJCircularCollectionViewLayout.h"

@implementation JYZJCircularCollectionViewLayout {
    NSMutableArray *_attributes;
}

- (void)prepareLayout {
    [super prepareLayout];
    
    // 按钮个数
    int itemCount = (int)[self.collectionView numberOfItemsInSection:0];
    _attributes = [[NSMutableArray alloc] init];
    // 先设定大圆的半径 取长和宽最短的（圆环外径）
    CGFloat radius = MIN(self.collectionView.frame.size.width, self.collectionView.frame.size.height) * 0.85;
    // 圆心位置
    CGPoint center =  CGPointMake(Bound_Width, self.collectionView.height * 0.5);
    
    // 设置每个item的大小
    for (int idx = 0; idx < itemCount; idx ++) {
        
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:idx inSection:0];
        UICollectionViewLayoutAttributes * attris = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
        // 设置item大小
        attris.size = CGSizeMake(_cellWidth, _cellHeight);
        
        if (itemCount == 1) {
            attris.center = self.collectionView.center;
        } else {
            
            // 计算每个item的圆心位置
            /*
             .
             . .
             .  . r
             .   .
             .    .
             .......
             */
            // 计算每个item中心的坐标
            // 算出的x，y值还要减去item自身的半径大小
            float x = center.x + cosf(2 * M_PI / itemCount * idx + _rotationAngle) * (radius - _cellWidth / 2.0);
            float y = center.y + sinf(2 * M_PI / itemCount * idx + _rotationAngle) * (radius - _cellHeight / 2.0);
            
            attris.center = CGPointMake(x, y);
        }
        [_attributes addObject:attris];
    }
}

// contentSize
- (CGSize)collectionViewContentSize {
    return self.collectionView.frame.size;
}

// cell / header / footer 的frame数组
- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    return _attributes;
}

@end
