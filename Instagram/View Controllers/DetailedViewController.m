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
#import "Post.h"

@interface DetailedViewController ()

@end

@implementation DetailedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureView];
}

- (void)configureView {
    self.postImage.image = [UIImage imageNamed:@"image_placeholder"];
    self.postImage.file = self.post[@"image"];
    [self.postImage loadInBackground];

    self.createdAt.text = [self.post.createdAt shortTimeAgoSinceNow];
    self.usernameLabel.text = self.post.author.username;
    self.captionView.text = self.post.caption;
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
