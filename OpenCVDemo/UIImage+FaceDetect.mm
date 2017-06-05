//
//  UIImage+FaceDetect.m
//  OpenCVDemo
//
//  Created by 郭玉富 on 2017/6/5.
//  Copyright © 2017年 郭玉富. All rights reserved.
//

#import "UIImage+FaceDetect.h"
#import "opencv2/highgui/ios.h"

@implementation UIImage (FaceDetect)

+ (UIImage *)detectFace:(UIImage *)sourceImage {
    UIImage *image = [sourceImage copy];
    cv::CascadeClassifier faceDetector;
    // Load cascade classifier from the XML file
    NSString* cascadePath = [[NSBundle mainBundle]
                             pathForResource:@"haarcascade_frontalface_alt"
                             ofType:@"xml"];
    faceDetector.load([cascadePath UTF8String]);
    
    cv::Mat faceImage;
    UIImageToMat(image, faceImage);
    
    // Convert to grayscale
    cv::Mat gray;
    cvtColor(faceImage, gray, CV_BGR2GRAY);
    
    // Detect faces
    std::vector<cv::Rect> faces;
    faceDetector.detectMultiScale(gray, faces, 1.1,
                                  2, 0|CV_HAAR_SCALE_IMAGE, cv::Size(30, 30));
    
    // Draw all detected faces
    for(unsigned int i = 0; i < faces.size(); i++) {
        const cv::Rect& face = faces[i];
        // Get top-left and bottom-right corner points
        cv::Point tl(face.x, face.y);
        cv::Point br = tl + cv::Point(face.width, face.height);
        
        // Draw rectangle around the face
        cv::Scalar magenta = cv::Scalar(255, 0, 255);
        cv::rectangle(faceImage, tl, br, magenta, 4, 8, 0);
    }

    // Show resulting image
    return MatToUIImage(faceImage);
}

@end
