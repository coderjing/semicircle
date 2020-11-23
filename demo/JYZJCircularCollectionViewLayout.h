//
//  JYZJCircularCollectionViewLayout.h
//  demo
//
//  Created by jing on 2020/11/23.
//  Copyright © 2020 jing. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface JYZJCircularCollectionViewLayout : UICollectionViewLayout

@property (assign, nonatomic) CGFloat cellHeight; //cell size
@property (assign, nonatomic) CGFloat cellWidth;

@property (assign, nonatomic) CGFloat rotationAngle;

@end

NS_ASSUME_NONNULL_END
