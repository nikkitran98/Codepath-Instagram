//
//  PostCell.h
//  Instagram
//
//  Created by Nikki Tran on 7/11/18.
//  Copyright © 2018 Nikki Tran. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Post.h"
#import <ParseUI.h>

@interface PostCell : UITableViewCell

@property (strong, nonatomic) NSURL *profileURL;
@property (weak, nonatomic) IBOutlet UIImageView *profileImage;
@property (weak, nonatomic) IBOutlet UILabel *topUsernameLabel;
@property (weak, nonatomic) IBOutlet PFImageView *postImage;
@property (weak, nonatomic) IBOutlet UILabel *likesLabel;
@property (weak, nonatomic) IBOutlet UILabel *commentsLabel;
@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
@property (weak, nonatomic) IBOutlet UITextView *captionView;
@property (weak, nonatomic) IBOutlet UILabel *createdAt;

@property (strong, nonatomic) Post *post;

@end
