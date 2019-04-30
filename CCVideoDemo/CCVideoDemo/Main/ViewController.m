//
//  ViewController.m
//  CCVideoDemo
//
//  Created by cc on 2019/4/15.
//  Copyright © 2019 cc. All rights reserved.
//

#import "ViewController.h"
#import <MediaPlayer/MediaPlayer.h>

@interface ViewController ()

@property (nonatomic, strong) MPVolumeView *volumeView;
@property (nonatomic, strong) UISlider *volumeSlider;
@property (nonatomic, assign) CGPoint originalPoint;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self addGestures];
}

#pragma mark - Getter/Setter

- (MPVolumeView *)volumeView {
    
    if (_volumeView == nil) {
        _volumeView = [[MPVolumeView alloc] init];
    }
    return _volumeView;
}

- (UISlider *)volumeSlider {
    
    if (_volumeSlider == nil) {
        for(UIView *view in self.volumeView.subviews){
            if ([NSStringFromClass(view.class) isEqualToString:@"MPVolumeSlider"]) {
                _volumeSlider = (UISlider *)view;
                break;
            }
        }
    }
    return _volumeSlider;
}
// window -Root-> CCNavigationViewController -Root- CCMainViewController
// CCMainViewController
// CCNavigationViewController
#pragma mark - Gestures

- (void)addGestures {
    
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(onPanGestureStateChange:)];
    [self.view addGestureRecognizer:panGestureRecognizer];
}

- (void)onPanGestureStateChange:(UIPanGestureRecognizer *)panGesture {
    
    switch (panGesture.state) {
        case UIGestureRecognizerStateBegan:
            self.originalPoint = [panGesture locationInView:self.view];
            break;
            
        case UIGestureRecognizerStateChanged: {
            [self handleGestureRecognizerStateChanged:panGesture];
        }
            break;
            
        default:
            break;
    }
}

#pragma mark - Private
// define Vs static
// 200
- (void)handleGestureRecognizerStateChanged:(UIPanGestureRecognizer *)panGesture {
    // 上：0.01  下：-0.01
    CGFloat valueOffset = [panGesture translationInView:self.view].y / 500.0;
    if (self.originalPoint.x < self.view.bounds.size.width/2.0) {
        CGFloat newBrightness = [[UIScreen mainScreen] brightness] - valueOffset;
        [[UIScreen mainScreen] setBrightness:MAX(0,MIN(1, newBrightness))];
    } else {
        CGFloat newVolume = self.volumeSlider.value - valueOffset;
        self.volumeSlider.value = MAX(0,MIN(1, newVolume));
    }
}

@end
