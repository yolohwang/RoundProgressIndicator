//
//  RPIView.h
//  
//
//  Created by YoloHwang on 17/3/22.
//
//

#import <UIKit/UIKit.h>

@interface RPIView : UIView

@property (nonatomic, assign) CGFloat lineWidth;
@property (nonatomic, copy)   UIColor *fillColor;
@property (nonatomic, copy)   UIColor *strokeColor;
@property (nonatomic, assign) CGFloat duration;
@property (nonatomic, copy)   NSArray<UIColor *> *colors;
@property (nonatomic, copy)   NSArray<NSNumber *> *locations;

- (instancetype)initWithFrame:(CGRect)frame;
- (void)showRoundProgressIndecatorWithParentView:(UIView *)parentView;

@end
