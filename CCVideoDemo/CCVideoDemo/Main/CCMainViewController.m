//
//  CCMainViewController.m
//  CCVideoDemo
//
//  Created by cc on 2019/4/16.
//  Copyright © 2019 cc. All rights reserved.
//



#import "CCMainViewController.h"
#import "CCMainCollectionViewCell.h"

static NSString *const kMainCollectionViewCellId = @"kMainCollectionViewCellId";

static CGFloat const sampleItemWidth = 175.0;
static CGFloat const sampleItemHeight = 127.0;

@interface CCMainViewController () <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation CCMainViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self setupNavigationItem];
    [self setupCollectionView];
}

#pragma mark - CollectionView Delegate Methods

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return 12;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CCMainCollectionViewCell *cell = (CCMainCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:kMainCollectionViewCellId forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    cell.label.text = [NSString stringWithFormat:@"{%zd,%zd}" ,indexPath.section, indexPath.row];
    cell.imageView.image = [UIImage imageNamed:@"testImage"];
    return cell;
}

#pragma mark - Private

- (void)setupNavigationItem {
    
    self.navigationItem.title = @"Home";
}

- (void)setupCollectionView {
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
    layout.minimumLineSpacing = 10.0;
    layout.sectionInset = UIEdgeInsetsMake(10.0, 10.0, 20.0, 10.0);
    CGFloat itemWidth = self.view.bounds.size.width / 2.0 - 15.0;

    layout.itemSize = CGSizeMake(itemWidth, itemWidth * sampleItemHeight / sampleItemWidth);
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    [self.view addSubview: self.collectionView];
    self.collectionView.backgroundColor = [UIColor colorWithRed:248.0 / 255.0 green:248.0 / 255.0 blue:248.0 / 255.0 alpha:1];
    
    [self.collectionView registerClass:[CCMainCollectionViewCell class] forCellWithReuseIdentifier:kMainCollectionViewCellId];

    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
}

@end
