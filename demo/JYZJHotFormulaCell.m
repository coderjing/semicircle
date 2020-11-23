//
//  JYZJHotFormulaCell.m
//  demo
//
//  Created by jing on 2020/11/23.
//  Copyright © 2020 jing. All rights reserved.
//

#import "JYZJHotFormulaCell.h"
#import "UIColor+HexColor.h"

@interface JYZJHotFormulaCell ()

@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UIImageView *imgView;

@end

@implementation JYZJHotFormulaCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}


- (void)setupUI {
    UIImageView *backImgView = ({
        UIImageView *v = [[UIImageView alloc] initWithFrame:CGRectMake(self.width - 41, self.height / 2 - 20.5, 41, 41)];
        v.image = [UIImage imageNamed:@"jyzj_formulaname_bg"];
        [self.contentView addSubview:v];
        v;
    });
    
    self.imgView = ({
        UIImageView *v = [[UIImageView alloc] initWithFrame:CGRectMake(backImgView.width / 2 - 10, backImgView.height / 2 - 10, 20, 20)];
        v.image = [UIImage imageNamed:@"jyzj_formulatest_icon"];
        [backImgView addSubview:v];
        v;
    });
    
    self.nameLabel = ({
        UILabel *lb = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.width - backImgView.width - 10, self.height)];
        lb.textColor = [UIColor colorWithHexString:mainColor];
        lb.font = [UIFont systemFontOfSize:12];
        lb.text = @"异常";
        lb.textAlignment = NSTextAlignmentCenter;
        lb.numberOfLines = 0;
        [self.contentView addSubview:lb];
        lb;
    });
}


- (void)setName:(NSString *)name {
    self.nameLabel.text = name;
}

@end
