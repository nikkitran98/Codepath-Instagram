//
//  DetailedViewController.m
//  Instagram
//
//  Created by Nikki Tran on 7/12/18.
//  Copyright © 2018 Nikki Tran. All rights reserved.
//

#import "DetailedViewController.h"
#import <ParseUI/ParseUI.h>
#import <DateTools/DateTools.h>
#import "PostCell.h"

@interface DetailedViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *postImage;
@property (weak, nonatomic) IBOutlet UILabel *likesLabel;
@property (weak, nonatomic) IBOutlet UILabel *commentsLabel;
@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
@property (weak, nonatomic) IBOutlet UITextView *captionView;
@property (weak, nonatomic) IBOutlet UILabel *createdAt;

@end

@implementation DetailedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)configureView {
//    self.postImage.image = [UIImage imageNamed:@"image_placeholder"];
//    self.postImage.file = post.image;
//    [self.postImage loadInBackground];
//
//    self.createdAt.text = [self.post.createdAt shortTimeAgoSinceNow];
//    self.usernameLabel.text = self.post.author.username;
//    self.captionView.text = self.post.caption;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
