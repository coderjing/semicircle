//
//  ViewController.m
//  demo
//
//  Created by jing on 2020/3/9.
//  Copyright © 2020 jing. All rights reserved.
//

#import "ViewController.h"
//Controller
//View
#import "JYZJFormulaRecommendationView.h"

@interface ViewController ()

@property (nonatomic, strong) JYZJFormulaRecommendationView *mainView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupUI];
}


- (void)setupUI {
    self.title = @"更多热门配方";
    
    self.mainView = [[JYZJFormulaRecommendationView alloc] initWithFrame:self.view.bounds];
    self.mainView.dataSourceArr = @[@"疲惫", @"发胖", @"消瘦", @"发高烧", @"发低烧", @"失眠", @"头晕", @"痉挛", @"水肿", @"发痒", @"泌尿异常", @"痉挛"];
    
    [self.view addSubview:self.mainView];
}


@end
