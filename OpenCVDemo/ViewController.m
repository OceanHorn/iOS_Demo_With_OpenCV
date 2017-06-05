//
//  ViewController.m
//  OpenCVDemo
//
//  Created by 郭玉富 on 2017/6/5.
//  Copyright © 2017年 郭玉富. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+Change.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setupUIComponents];
}

- (void)setupUIComponents {
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 20, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height/3.0)];
    UIImage *image = [UIImage imageNamed:@"road.jpeg"];
    imageView.image = image;
    
    [self.view addSubview:imageView];
    
    UIImageView *imageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 250, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height/3.0)];
    UIImage *image1 = [UIImage imageNamed:@"road.jpeg"];
    imageView1.image = [image1 changeImage];
    
    [self.view addSubview:imageView1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
