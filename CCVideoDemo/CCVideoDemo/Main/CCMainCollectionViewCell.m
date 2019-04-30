//
//  CCMainCollectionViewCell.m
//  CCVideoDemo
//
//  Created by cc on 2019/4/16.
//  Copyright © 2019 cc. All rights reserved.
//

#import "CCMainCollectionViewCell.h"

static CGFloat const sampleItemImageHeight = 97.0;
static CGFloat const sampleItemTitleHeight = 30.0;

@implementation CCMainCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        self.layer.cornerRadius = 5.0f;
        self.clipsToBounds = YES;
        [self setupImageView];
        [self setupTitle];
    }
    return self;
}

#pragma mark - Private

- (void)setupImageView {
    
    CGSize cellContentSize = self.contentView.bounds.size;
    self.imageView = [[UIImageView alloc] initWithFrame: CGRectMake(0, 0, cellContentSize.width, cellContentSize.height * sampleItemImageHeight / (sampleItemImageHeight + sampleItemTitleHeight))];
    self.imageView.backgroundColor = [UIColor redColor];
    self.imageView.contentMode = UIViewContentModeScaleAspectFill;
    self.imageView.clipsToBounds = YES;
    [self.contentView addSubview:self.imageView];
}

- (void)setupTitle {
    
    CGSize cellContentSize = self.contentView.bounds.size;
    self.label = [[UILabel alloc] initWithFrame: CGRectMake(5, self.imageView.bounds.size.height, cellContentSize.width, cellContentSize.height * sampleItemTitleHeight / (sampleItemImageHeight + sampleItemTitleHeight))];
    self.label.backgroundColor = [UIColor whiteColor];
    [self.label setFont: [UIFont fontWithName:@"PingFangSC-Regular" size:14]];
    self.label.textColor = [UIColor colorWithRed:51.0 / 255.0 green:51.0 / 255.0 blue:51.0 / 255.0 alpha:1];
    [self.contentView addSubview:self.label];
}

@end
