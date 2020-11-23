//
//  JYZJFormulaRightBackView.m
//  demo
//
//  Created by jing on 2020/11/23.
//  Copyright © 2020 jing. All rights reserved.
//

#import "JYZJFormulaRightBackView.h"


@implementation JYZJFormulaRightBackView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}


- (void)setupUI {
    UIGraphicsBeginImageContext(self.bounds.size);
    UIBezierPath *p1 = [UIBezierPath bezierPath];
    [p1 addArcWithCenter:CGPointMake(self.width, self.height / 2) radius: self.width - 1 startAngle: M_PI * 0.5 endAngle: M_PI * 1.5  clockwise:YES];
    CAShapeLayer *l1 = [CAShapeLayer layer];
    l1.frame = self.bounds;
    l1.strokeColor = [UIColor colorWithHexString:@"#7F89B3" alpha:0.4].CGColor;
    l1.lineWidth = 1;
    l1.path = p1.CGPath;
    [self.layer addSublayer:l1];
    
    CAShapeLayer *l2 = [CAShapeLayer layer];
    l2.frame = CGRectMake(self.width * 0.17 + self.width * 0.44, self.height * 0.06 , self.width * 0.83, self.height * 0.88);
    
    UIBezierPath *p2 = [UIBezierPath bezierPath];
    [p2 addArcWithCenter:CGPointMake(l2.frame.size.width * 0.5, l2.frame.size.height / 2) radius: l2.frame.size.width - 3.5 startAngle: 0 endAngle: M_PI * 2  clockwise:YES];
    l2.strokeColor = [UIColor colorWithHexString:@"#D21A8A" alpha:0.4].CGColor;
    l2.fillColor = [UIColor clearColor].CGColor;
    l2.lineWidth = 3.5;
    l2.lineDashPattern = @[@10, @5];
    l2.path = p2.CGPath;
    
    CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: -M_PI * 0.05 ]; //ni
    rotationAnimation.duration = 0.5;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = FLT_MAX;
    rotationAnimation.removedOnCompletion = NO;
    [l2 addAnimation:rotationAnimation forKey:@"rotationAnimation"];
    
    [self.layer addSublayer:l2];
    
    CAShapeLayer *l3 = [CAShapeLayer layer];
    l3.frame = CGRectMake(17.5 - 12.5, 19 + 12.5, self.width - 35 - 25, self.height - 38 - 25);
    
    UIBezierPath *p3 = [UIBezierPath bezierPath];
    [p3 addArcWithCenter:CGPointMake(self.width, l3.frame.size.height / 2) radius: l3.frame.size.width - 1 startAngle: M_PI * 0.5 endAngle: M_PI * 1.5  clockwise:YES];
    l3.strokeColor = [UIColor colorWithHexString:@"#FFFFFF" alpha: 0.4].CGColor;
    l3.fillColor = [UIColor clearColor].CGColor;
    l3.lineWidth = 1;
    l3.path = p3.CGPath;
    [self.layer addSublayer:l3];
    
    CAShapeLayer *l4 = [CAShapeLayer layer];
    l4.frame = CGRectMake(self.width * 0.26 + self.width * 0.37 + 6.5, self.height * 0.09 , self.width * 0.74 - 6.5, self.height * 0.82);
    
    UIBezierPath *p4 = [UIBezierPath bezierPath];
    [p4 addArcWithCenter:CGPointMake(l4.frame.size.width * 0.5, l4.frame.size.height / 2) radius: l4.frame.size.width - 3.5 startAngle: 0 endAngle: M_PI * 2  clockwise:YES];
    l4.strokeColor = [UIColor colorWithHexString:@"#FFFFFF" alpha:0.1].CGColor;
    l4.fillColor = [UIColor clearColor].CGColor;
    l4.lineWidth = 3.5;
    l4.lineDashPattern = @[@2, @5];
    l4.path = p4.CGPath;
    
    CABasicAnimation *rotationAnimation1 = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation1.toValue = [NSNumber numberWithFloat: M_PI * 0.05 ];
    rotationAnimation1.duration = 0.5;
    rotationAnimation1.cumulative = YES;
    rotationAnimation1.repeatCount = FLT_MAX;
    rotationAnimation1.removedOnCompletion = NO;
    [l4 addAnimation:rotationAnimation1 forKey:@"rotationAnimation"];
    
    [self.layer addSublayer:l4];
    
    CAShapeLayer *l5 = [CAShapeLayer layer];
    l5.frame = CGRectMake(self.width * 0.75 , self.height * 0.181 , self.width * 0.49, self.height * 0.63);
    
    UIBezierPath *p5 = [UIBezierPath bezierPath];
    [p5 addArcWithCenter:CGPointMake(l5.frame.size.width * 0.5, l5.frame.size.height / 2) radius: l5.frame.size.width - 5.5 startAngle: 0 endAngle: M_PI * 2  clockwise:YES];
    l5.strokeColor = [UIColor colorWithHexString:mainColor alpha:0.2].CGColor;
    l5.fillColor = [UIColor clearColor].CGColor;
    l5.lineWidth = 5.5;
    l5.lineDashPattern = @[@8, @5];
    l5.path = p5.CGPath;
    
    CABasicAnimation *rotationAnimation2 = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation2.toValue = [NSNumber numberWithFloat: -M_PI * 0.05 ];
    rotationAnimation2.duration = 0.5;
    rotationAnimation2.cumulative = YES;
    rotationAnimation2.repeatCount = FLT_MAX;
    rotationAnimation2.removedOnCompletion = NO;
    [l5 addAnimation:rotationAnimation2 forKey:@"rotationAnimation"];
    
    [self.layer addSublayer:l5];
    
    CAShapeLayer *l6 = [CAShapeLayer layer];
    l6.frame = CGRectMake(self.width * 0.75 + 15.5, self.height * 0.181 + 15.5 , self.width * 0.49 - 31, self.height * 0.63 - 31);
    
    UIBezierPath *p6 = [UIBezierPath bezierPath];
    [p6 addArcWithCenter:CGPointMake(l6.frame.size.width * 0.5, l6.frame.size.height / 2) radius: l6.frame.size.width - 4 startAngle: M_PI * 0.5 endAngle: M_PI * 1.5  clockwise:YES];
    l6.strokeColor = [UIColor colorWithHexString:mainColor].CGColor;
    l6.fillColor = [UIColor clearColor].CGColor;
    l6.lineWidth = 4;
    l6.path = p6.CGPath;

    [self.layer addSublayer:l6];
    
    CAShapeLayer *l7 = [CAShapeLayer layer];
    l7.frame = CGRectMake(self.width * 0.75 + 15.5 + 9.5, self.height * 0.181 + 15.5 + 9.5 , self.width * 0.49 - 31 - 19, self.height * 0.63 - 31 - 19);
    
    UIBezierPath *p7 = [UIBezierPath bezierPath];
    [p7 addArcWithCenter:CGPointMake(l7.frame.size.width * 0.5, l7.frame.size.height / 2) radius: l7.frame.size.width - 4 startAngle: 0 endAngle: M_PI * 2  clockwise:YES];
    l7.strokeColor = [UIColor colorWithHexString:mainColor].CGColor;
    l7.fillColor = [UIColor clearColor].CGColor;
    l7.lineWidth = 4;
    l7.lineDashPattern = @[@40, @5];
    l7.path = p7.CGPath;
    
    CABasicAnimation *rotationAnimation3 = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation3.toValue = [NSNumber numberWithFloat: M_PI * 0.05 ];
    rotationAnimation3.duration = 0.5;
    rotationAnimation3.cumulative = YES;
    rotationAnimation3.repeatCount = FLT_MAX;
    rotationAnimation3.removedOnCompletion = NO;
    [l7 addAnimation:rotationAnimation3 forKey:@"rotationAnimation"];
    
    [self.layer addSublayer:l7];
    
    CAShapeLayer *l8 = [CAShapeLayer layer];
    l8.frame = CGRectMake(self.width * 0.75 + 15.5 + 9.5 + 10, self.height * 0.181 + 15.5 + 9.5 + 20 , self.width * 0.49 - 31 - 20 - 19, self.height * 0.63 - 31 - 40 - 19);
    
    UIBezierPath *p8 = [UIBezierPath bezierPath];
    [p8 addArcWithCenter:CGPointMake(l8.frame.size.width * 0.5, l8.frame.size.height / 2) radius: l8.frame.size.width - 1 startAngle: M_PI * 0.5 endAngle: M_PI * 1.5  clockwise:YES];
    l8.strokeColor = [UIColor colorWithHexString:@"#D21A8A"].CGColor;
    l8.fillColor = [UIColor clearColor].CGColor;
    l8.lineWidth = 1;
    l8.path = p8.CGPath;

    [self.layer addSublayer:l8];
    
    CAShapeLayer *l9 = [CAShapeLayer layer];
    l9.frame = CGRectMake(self.width * 0.75 + 15.5 + 9.5 + 15, self.height * 0.181 + 15.5 + 9.5 + 25, self.width * 0.49 - 31 - 30 - 19, self.height * 0.63 - 31 - 50 - 19);
    
    UIBezierPath *p9 = [UIBezierPath bezierPath];
    [p9 addArcWithCenter:CGPointMake(l9.frame.size.width * 0.5, l9.frame.size.height / 2) radius: l9.frame.size.width - 1 startAngle: M_PI * 0.5 endAngle: M_PI * 1.5  clockwise:YES];
    l9.strokeColor = [UIColor colorWithHexString:mainColor].CGColor;
    l9.fillColor = [UIColor clearColor].CGColor;
    l9.lineWidth = 1;
    l9.path = p9.CGPath;

    [self.layer addSublayer:l9];
    
    UIGraphicsEndImageContext();
}

@end
