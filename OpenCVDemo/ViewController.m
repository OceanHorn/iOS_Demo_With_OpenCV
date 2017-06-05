//
//  ViewController.m
//  OpenCVDemo
//
//  Created by 郭玉富 on 2017/6/5.
//  Copyright © 2017年 郭玉富. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+FaceDetect.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setupUIComponents];
}

- (void)setupUIComponents {
    UIImage *image = [UIImage imageNamed:@"face.jpeg"];
    image = [UIImage detectFace:image];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 20, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.width * 10.0 / 16)];
    imageView.image = image;
    [self.view addSubview:imageView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
