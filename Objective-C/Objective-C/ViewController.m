//
//  ViewController.m
//  Objective-C
//
//  Created by YoloHwang on 17/3/21.
//  Copyright © 2017年 Yolo. All rights reserved.
//

#import "ViewController.h"
#import "RPIView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *testView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    RPIView *v = [[RPIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    v.center = self.view.center;
    v.locations = [NSArray arrayWithObjects:@(0.2),@(0.5), nil];
    v.colors = [NSArray arrayWithObjects:(id)[UIColor redColor].CGColor,(id)[UIColor greenColor].CGColor,(id)[UIColor grayColor].CGColor, nil];
    [v showRoundProgressIndecatorWithParentView:self.view];
    
    [self gradientTest];
}

- (void)gradientTest {
    CAGradientLayer *layer = [CAGradientLayer layer];
    layer.frame = self.testView.bounds;
    layer.locations = [NSArray arrayWithObjects:@(0.3),@(0.6),@(0.9), nil];
    layer.colors = [NSArray arrayWithObjects:(id)[UIColor redColor].CGColor,(id)[UIColor greenColor].CGColor,(id)[UIColor blueColor].CGColor,nil];
    layer.startPoint = CGPointMake(0, 0);
    layer.endPoint = CGPointMake(0, 1);
    [self.testView.layer addSublayer:layer];
}


@end
