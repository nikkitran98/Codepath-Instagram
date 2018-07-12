//
//  PostCell.m
//  Instagram
//
//  Created by Nikki Tran on 7/11/18.
//  Copyright © 2018 Nikki Tran. All rights reserved.
//

#import "PostCell.h"
#import "Post.h"
#import <ParseUI.h>
#import <DateTools/DateTools.h>

@implementation PostCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) setPost: (Post *)post {
    _post = post;
    
    self.postImage.image = [UIImage imageNamed:@"image_placeholder"];
    self.postImage.file = post.image;
    [self.postImage loadInBackground];
    
    self.createdAt.text = [post.createdAt shortTimeAgoSinceNow];
    self.usernameLabel.text = post.author.username;
    self.captionView.text = post.caption;
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc]init];
    NSNumber *likes = [formatter numberFromString:self.likesLabel.text];
    NSNumber *comments = [formatter numberFromString:self.commentsLabel.text];
    likes = post.likeCount;
    comments = post.commentCount;
    
//    self.likesLabel.text = post.likeCount;
//    self.commentsLabel.text = post.commentCount;
}



@end