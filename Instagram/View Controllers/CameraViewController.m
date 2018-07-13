//
//  CameraViewController.m
//  Instagram
//
//  Created by Nikki Tran on 7/11/18.
//  Copyright © 2018 Nikki Tran. All rights reserved.
//

#import "CameraViewController.h"
#import "Parse.h"
#import "AppDelegate.h"
#import "Post.h"
#import <MBProgressHUD/MBProgressHUD.h>

@interface CameraViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>


@property (weak, nonatomic) IBOutlet UIImageView *selectedImage;
@property (weak, nonatomic) IBOutlet UITextView *photoDescription;
@property (nonatomic) BOOL uploading;

@end

@implementation CameraViewController

- (void) getImage {
    UIImagePickerController *imagePickerVC = [UIImagePickerController new];
    imagePickerVC.delegate = self;
    imagePickerVC.allowsEditing = YES;
    self.uploading = NO;
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        imagePickerVC.sourceType = UIImagePickerControllerSourceTypeCamera;
    }
    else {
        NSLog(@"Camera 🚫 available so we will use photo library instead");
        imagePickerVC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    
    [self presentViewController:imagePickerVC animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    // Get the image captured by the UIImagePickerController
    UIImage *originalImage = info[UIImagePickerControllerOriginalImage];
    UIImage *editedImage = info[UIImagePickerControllerEditedImage];
    
    // Do something with the images (based on your use case)
    self.selectedImage.image = [self resizeImage:editedImage withSize:CGSizeMake(400, 400)];
    NSLog(@"swap");
    // Dismiss UIImagePickerController to go back to your original view controller
    [self dismissViewControllerAnimated:YES completion:nil];
    
    // [self performSegueWithIdentifier:@"tagSegue" sender:nil];
}

- (IBAction)didTapSelectImage:(id)sender {
    [self getImage];
}


// did tap post
- (IBAction)didTapPost:(id)sender {
    if (![self.selectedImage.image isEqual:[UIImage imageNamed:@"image_placeholder"]] && !self.uploading) {
        NSLog(@"Yeehaw");
        self.uploading = YES;
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        [Post postUserImage:self.selectedImage.image withCaption:self.photoDescription.text withCompletion:^(BOOL succeeded, NSError * _Nullable error) {
            if (succeeded) {
                NSLog(@"Post success");
                self.selectedImage.image = [UIImage imageNamed:@"image_placeholder"];
            }
            else {
                NSLog(@"Failed to post");
            }
            self.uploading = NO;
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            [self performSegueWithIdentifier:@"loggedInSegue" sender:nil];
        }];
    }
    else {
        NSLog(@"No image to upload");
    }
}

// did tap cancel
- (IBAction)didTapCancel:(id)sender {
    [self performSegueWithIdentifier:@"loggedInSegue" sender:nil];
}

- (UIImage *)resizeImage:(UIImage *)image withSize:(CGSize)size {
    UIImageView *resizeImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    
    resizeImageView.contentMode = UIViewContentModeScaleAspectFill;
    resizeImageView.image = image;
    
    UIGraphicsBeginImageContext(size);
    [resizeImageView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}




@end
