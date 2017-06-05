//
//  UIImage+Change.m
//  First
//
//  Created by 郭玉富 on 2017/6/4.
//  Copyright © 2017年 郭玉富. All rights reserved.
//

#import "UIImage+Change.h"
#import "opencv2/highgui/ios.h"

@implementation UIImage (Change)

- (UIImage *)changeImage {
    
    UIImage *image = [self copy];
    cv::Mat cvImage;
    
    // Convert UIImage* to cv::Mat
    UIImageToMat(image, cvImage);
    
    if (!cvImage.empty()) {
        cv::Mat gray;
        // Convert the image to grayscale
        cv::cvtColor(cvImage, gray, CV_RGBA2GRAY);
        // Apply Gaussian filter to remove small edges
        cv::GaussianBlur(gray, gray, cv::Size(5, 5), 1.2, 1.2);
        // Calculate edges with Canny
        cv::Mat edges;
        cv::Canny(gray, edges, 0, 50);
        // Fill image with white color
        cvImage.setTo(cv::Scalar::all(255));
        // Change color on edges
        cvImage.setTo(cv::Scalar(0, 128, 255, 255), edges);
        // Convert cv::Mat to UIImage* and show the resulting image
        image = MatToUIImage(cvImage);
    }
    
    return image;
}

@end
