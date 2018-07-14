//
//  ProfileCollectionViewCell.m
//  Instagram
//
//  Created by Nikki Tran on 7/12/18.
//  Copyright © 2018 Nikki Tran. All rights reserved.
//

#import "ProfileCollectionViewCell.h"

@implementation ProfileCollectionViewCell

- (void) setPost:(Post *) post {
    _post = post;
    self.postImage.file = post.image;
    [self.postImage loadInBackground];
}

@end
