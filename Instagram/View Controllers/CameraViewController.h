//
//  CameraViewController.h
//  Instagram
//
//  Created by Nikki Tran on 7/11/18.
//  Copyright © 2018 Nikki Tran. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CameraViewController : UIViewController

- (UIImage *)resizeImage:(UIImage *)image withSize:(CGSize)size;

@end
