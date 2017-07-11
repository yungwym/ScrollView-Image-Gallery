//
//  ImageDetailViewController.m
//  ScrollView Image Gallery
//
//  Created by Alex Wymer  on 2017-07-10.
//  Copyright © 2017 Sav Inc. All rights reserved.
//

#import "ImageDetailViewController.h"

@interface ImageDetailViewController () <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;




@end

@implementation ImageDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.scrollView.minimumZoomScale = 0.2;
    self.scrollView.maximumZoomScale = 2.0;
    
    self.scrollView.zoomScale = 1.0;
    
}


-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    
    return self.imageView;
}

@end
