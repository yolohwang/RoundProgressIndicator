//
//  RPIView.m
//  
//
//  Created by YoloHwang on 17/3/22.
//
//

#import "RPIView.h"

@implementation RPIView

#define defaultLineWidth   4.0
#define defaultDuration    5.0
#define defaultFillColor   [UIColor clearColor]
#define defaultStrokeColor [UIColor redColor]
#define RGB(r,g,b)         [UIColor colorWithRed:r/255.0 green:gr/255.0 blue:b/255.0 alpha:1.0]
#define defaultColors      [NSArray arrayWithObjects:(id)[UIColor redColor].CGColor, nil];
#define defaultLocations   [NSArray arrayWithObjects:@(1.0), nil];


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.lineWidth   = defaultLineWidth;
        self.fillColor   = defaultFillColor;
        self.strokeColor = defaultStrokeColor;
        self.duration    = defaultDuration;
        self.colors      = defaultColors;
        self.locations   = defaultLocations;
    }
    return self;
}

- (void)showRoundProgressIndecatorWithParentView:(UIView *)parentView {
    
    [self setupUI];
    [parentView addSubview:self];
}

- (void)setupUI {
    
    float centerX = self.bounds.size.width * 0.5;
    float centerY = self.bounds.size.height * 0.5;
    float raduis = (self.bounds.size.width - self.lineWidth) * 0.5;
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(centerX, centerY) radius:raduis startAngle:-M_PI_2 endAngle:(1.5 * M_PI) clockwise:YES];
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.fillColor = self.fillColor.CGColor;
    shapeLayer.strokeColor = self.strokeColor.CGColor;
    shapeLayer.lineWidth = self.lineWidth;
    shapeLayer.lineCap = kCALineCapRound;
    shapeLayer.path = path.CGPath;
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = self.bounds;
    gradientLayer.colors = self.colors;
    gradientLayer.locations = self.locations;
    
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(0, 1);
    gradientLayer.mask = shapeLayer;
    
    [self.layer addSublayer:gradientLayer];
    [self animationWithLayer:shapeLayer];
}

- (void)animationWithLayer:(CALayer *)layer {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.fromValue = @(0);
    animation.toValue = @(1.0);
    animation.duration = self.duration;
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    [layer addAnimation:animation forKey:nil];
}

@end
