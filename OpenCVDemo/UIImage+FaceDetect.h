//
//  UIImage+FaceDetect.h
//  OpenCVDemo
//
//  Created by 郭玉富 on 2017/6/5.
//  Copyright © 2017年 郭玉富. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (FaceDetect)
+ (UIImage *)detectFace:(UIImage *)image;
@end
