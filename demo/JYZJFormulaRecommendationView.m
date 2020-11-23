//
//  JYZJFormulaRecommendationView.m
//  demo
//
//  Created by jing on 2020/11/23.
//  Copyright © 2020 jing. All rights reserved.
//

#import "JYZJFormulaRecommendationView.h"
//View
#import "JYZJHotFormulaCell.h"
#import "JYZJCircularCollectionViewLayout.h"
#import "JYZJFormulaRightBackView.h"

@interface JYZJFormulaRecommendationView ()<UICollectionViewDelegate, UICollectionViewDataSource, UIGestureRecognizerDelegate>

@property (nonatomic, strong) UICollectionView *collView;
@property (nonatomic, strong) JYZJCircularCollectionViewLayout *layout;
@property (nonatomic, strong) JYZJFormulaRightBackView *rightView;
@property (nonatomic, assign) BOOL isFirst;

@property (assign, nonatomic) CGPoint lastPoint; //上一次滑动到的点
@property (assign, nonatomic) CGPoint centerPoint; // 中心点
@property (assign, nonatomic) CGFloat totalRads; // 相对于初始状态滑动过的角度总和

/** 圆环上按钮直径 */
@property (assign, nonatomic) CGFloat itemRadius;

/** 圆环外径 */
@property (assign, nonatomic) CGFloat larRadius;

@end

static NSString *FormulaCellId = @"JYZJHotFormulaCellId";

@implementation JYZJFormulaRecommendationView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}


- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.collView.frame = self.bounds;
}


- (UICollectionView *)collView {
    if (_collView == nil) {
        _layout = [[JYZJCircularCollectionViewLayout alloc] init];
        _layout.cellWidth = Bound_Width * 0.22;
        _layout.cellHeight = 50;
        _collView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:_layout];
        _collView.delegate = self;
        _collView.dataSource = self;
        
        [_collView registerClass:JYZJHotFormulaCell.class forCellWithReuseIdentifier:FormulaCellId];
    }
    return _collView;
}


- (JYZJFormulaRightBackView *)rightView {
    if (_rightView == nil) {
        _rightView = [[JYZJFormulaRightBackView alloc] initWithFrame:CGRectMake(Bound_Width * 0.25 + self.layout.cellWidth * 0.5 + 10, self.layout.cellHeight * 4, Bound_Width * 0.75 - self.layout.cellWidth * 0.5 - 10, self.height - self.layout.cellHeight * 4)];
    }
    return _rightView;
}


- (void)setupUI {
    [self addSubview:self.collView];
    [self addSubview:self.rightView];
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(menuBeingPaned:)];
    pan.delegate = self;
    [self.collView addGestureRecognizer:pan];
    
    // 设置滑动中心点
    _centerPoint = CGPointMake(Bound_Width, Bound_Height / 2);
    // 圆环外径
    CGFloat larRadius = MIN(self.collView.width, self.collView.height) * 0.85;
    _larRadius = larRadius;
    _itemRadius = _layout.cellWidth;
    
    _isFirst = YES;
}


- (void)setDataSourceArr:(NSArray *)dataSourceArr {
    if (![dataSourceArr isKindOfClass:NSArray.class]) return;
    if (_isFirst && dataSourceArr.count <= 16) {
        NSMutableArray *arr = [NSMutableArray array];
        [arr addObjectsFromArray:dataSourceArr];
        [arr addObjectsFromArray:dataSourceArr];
        _dataSourceArr = arr;
        [self.collView reloadData];
        self.isFirst = NO;
        return;
    }
    _dataSourceArr = dataSourceArr;
    [self.collView reloadData];
}


#pragma mark -- UICollectionViewDelegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return  self.dataSourceArr.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    JYZJHotFormulaCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:FormulaCellId forIndexPath:indexPath];
    if (self.dataSourceArr.count > indexPath.row) {
        [cell setName:self.dataSourceArr[indexPath.row]];
    }
    return cell;
}


- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    cell.layer.transform = CATransform3DMakeScale(0, 0, 1);
     [UIView animateWithDuration:0.25 animations:^{
        cell.layer.transform = CATransform3DMakeScale(1, 1, 1);
    }];
    
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}


#pragma mark -- UIGestureRecognizerDelegate
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    // 初始滑动时记录点为当前点
    if ([gestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]]) {
        CGPoint point = [gestureRecognizer locationInView:gestureRecognizer.view];
        _lastPoint = point;
    }
    return YES;
}


#pragma mark -- 菜单滑动，重新布局
- (void)menuBeingPaned:(UIPanGestureRecognizer *)panGR {
    CGPoint point = [panGR locationInView:panGR.view];
    [self touchMoving:point];
}


// 正在滑动中
- (void)touchMoving:(CGPoint )point {
    // 以collectionView center为中心计算滑动角度
    CGFloat rads = [self angleBetweenFirstLineStart:_centerPoint
                                       firstLineEnd:_lastPoint
                                 andSecondLineStart:_centerPoint
                                      secondLineEnd:point];
    
    if (_lastPoint.x != _centerPoint.x && point.x != _centerPoint.x) {

        CGFloat k1 = (_lastPoint.y - _centerPoint.y) / (_lastPoint.x - _centerPoint.x);
        CGFloat k2 = (point.y - _centerPoint.y) / (point.x - _centerPoint.x);
        if (k2 > k1) {
            _totalRads += rads;
        } else {
            _totalRads -= rads;
        }
    }
    
    _layout.rotationAngle = _totalRads;
    // 重新布局
    [_layout invalidateLayout];
    
    // 更新记录点
    _lastPoint = point;
}


// 两条直线之间的夹角
- (CGFloat)angleBetweenFirstLineStart:(CGPoint)firstLineStart
                         firstLineEnd:(CGPoint)firstLineEnd
                   andSecondLineStart:(CGPoint)secondLineStart
                        secondLineEnd:(CGPoint)secondLineEnd {
    CGFloat a1 = firstLineEnd.x - firstLineStart.x;
    CGFloat b1 = firstLineEnd.y - firstLineStart.y;
    CGFloat a2 = secondLineEnd.x - secondLineStart.x;
    CGFloat b2 = secondLineEnd.y - secondLineStart.y;
    
    // 夹角余弦
    double cos = (a1 * a2 + b1 * b2) / (sqrt(pow(a1, 2.0) + pow(b1, 2.0)) * sqrt(pow(a2, 2.0) + pow(b2, 2.0)));
    cos = cos > 1 ? 1 : cos;
    return acos(cos);
}

@end
