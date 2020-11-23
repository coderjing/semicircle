//
//  UIView+Size.h
//  demo
//
//  Created by jing on 2020/11/23.
//  Copyright © 2020 jing. All rights reserved.
//



#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Size)

@property (assign, nonatomic) CGFloat   top;
@property (assign, nonatomic) CGFloat   bottom;
@property (assign, nonatomic) CGFloat   left;
@property (assign, nonatomic) CGFloat   right;

@property (assign, nonatomic) CGFloat   x;
@property (assign, nonatomic) CGFloat   y;
@property (assign, nonatomic) CGPoint   origin;

@property (assign, nonatomic) CGFloat   centerX;
@property (assign, nonatomic) CGFloat   centerY;

@property (assign, nonatomic) CGFloat   width;
@property (assign, nonatomic) CGFloat   height;
@property (assign, nonatomic) CGSize    size;

@end

NS_ASSUME_NONNULL_END
