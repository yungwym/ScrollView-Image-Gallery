//
//  ViewController.m
//  ScrollView Image Gallery
//
//  Created by Alex Wymer  on 2017-07-10.
//  Copyright © 2017 Sav Inc. All rights reserved.
//

#import "ViewController.h"
#import "ImageDetailViewController.h"

@interface ViewController () <UIScrollViewDelegate>


@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (nonatomic) UIPageControl *pc;

@property (nonatomic) UIImageView *field;
@property (nonatomic) UIImageView *night;
@property (nonatomic) UIImageView *zoomed;

@property (nonatomic) CGSize contentSize;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Main Gallery"; 
    
    [self setupScrollView];
    [self setUpPageControl];
    self.scrollView.delegate = self; 
    
}

-(void)setupScrollView {
    
  //  self.scrollView.delegate = self;
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

- (IBAction)imageTapped:(UITapGestureRecognizer *)sender {
    
    [self performSegueWithIdentifier:@"segue" sender:sender];
    
    NSLog(@"%@", sender);
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"segue"]) {
        
        ImageDetailViewController *target = segue.destinationViewController;
        
        CGPoint location = [sender locationInView:self.scrollView];
        int selectedImage = location.x/self.scrollView.frame.size.width;
        
        if (selectedImage == 0) {
            
            target.detailImage = self.field.image;
            
        } else if (selectedImage == 1) {
            
            target.detailImage = self.night.image;
            
        } else {
            
            target.detailImage = self.zoomed.image;
            
        }
    }
}


-(void)setUpPageControl {
    
    self.pc = [UIPageControl new];
    [self.view addSubview:self.pc];
    [self.view bringSubviewToFront:self.pc];
    self.pc.backgroundColor = [UIColor blackColor];
    self.pc.alpha = 0.5;
    self.pc.numberOfPages = 3;
    
    CGRect frame = CGRectMake(0, self.view.bounds.size.height-50, self.view.bounds.size.width, 50.0);
    
    self.pc.frame = frame;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    int currentPage = (int)self.scrollView.contentOffset.x / self.scrollView.frame.size.width;
    self.pc.currentPage = currentPage;
}


@end
