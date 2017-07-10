//
//  ViewController.m
//  ScrollView Image Gallery
//
//  Created by Alex Wymer  on 2017-07-10.
//  Copyright © 2017 Sav Inc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () 


@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (nonatomic) UIImageView *field;
@property (nonatomic) UIImageView *night;
@property (nonatomic) UIImageView *zoomed;

@property (nonatomic) CGSize contentSize;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupScrollView];
}

-(void)setupScrollView {
    
    self.scrollView.delegate = self;
    self.scrollView.pagingEnabled = YES;
    
    
    //Field
    self.field = [UIImageView new];
    self.field.translatesAutoresizingMaskIntoConstraints = NO;
    self.field.image = [UIImage imageNamed:@"Lighthouse-in-Field.imageset"];
    [self.scrollView addSubview:self.field];
    
    [self.field.leadingAnchor constraintEqualToAnchor:self.scrollView.leadingAnchor].active = YES;
    [self.field.topAnchor constraintEqualToAnchor:self.scrollView.topAnchor].active = YES;
    [self.field.bottomAnchor constraintEqualToAnchor:self.scrollView.bottomAnchor].active = YES;
    [self.field.widthAnchor constraintEqualToAnchor:self.scrollView.widthAnchor].active = YES;
    [self.field.heightAnchor constraintEqualToAnchor:self.view.heightAnchor].active = YES;
    
    //Night
    self.night = [UIImageView new];
    self.night.translatesAutoresizingMaskIntoConstraints = NO;
    self.night.image = [UIImage imageNamed:@"Lighthouse-night.imageset"];
    [self.scrollView addSubview:self.night];
    
    [self.night.leadingAnchor constraintEqualToAnchor:self.field.trailingAnchor].active = YES;
    [self.night.topAnchor constraintEqualToAnchor:self.scrollView.topAnchor].active = YES;
    [self.night.bottomAnchor constraintEqualToAnchor:self.scrollView.bottomAnchor].active = YES;
    [self.night.widthAnchor constraintEqualToAnchor:self.scrollView.widthAnchor].active = YES;
    [self.night.heightAnchor constraintEqualToAnchor:self.view.heightAnchor].active = YES;
    
    //Zoomed
    self.zoomed = [UIImageView new];
    self.zoomed.translatesAutoresizingMaskIntoConstraints = NO;
    self.zoomed.image = [UIImage imageNamed:@"Lighthouse-zoomed.imageset"];
    [self.scrollView addSubview:self.zoomed];
    
    [self.zoomed.leadingAnchor constraintEqualToAnchor:self.night.trailingAnchor].active = YES;
    [self.zoomed.topAnchor constraintEqualToAnchor:self.scrollView.topAnchor].active = YES;
    [self.zoomed.bottomAnchor constraintEqualToAnchor:self.scrollView.bottomAnchor].active = YES;
    [self.zoomed.widthAnchor constraintEqualToAnchor:self.scrollView.widthAnchor].active = YES;
    [self.zoomed.heightAnchor constraintEqualToAnchor:self.view.heightAnchor].active = YES;
    [self.zoomed.trailingAnchor constraintEqualToAnchor:self.scrollView.trailingAnchor].active = YES;

    
}



    



@end
