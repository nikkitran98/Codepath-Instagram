//
//  Post.m
//  Instagram
//
//  Created by Nikki Tran on 7/11/18.
//  Copyright © 2018 Nikki Tran. All rights reserved.
//

#import "Post.h"
#import <NSDate+DateTools.h>

@implementation Post

@dynamic postID;
@dynamic userID;
@dynamic author;
@dynamic caption;
@dynamic image;
@dynamic likeCount;
@dynamic commentCount;
@dynamic createdAtString;

+ (nonnull NSString *)parseClassName {
    return @"Post";
}

//- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
//    self = [super init];
//    if (self) {
//        NSString *createdAtOriginalString = dictionary[@"created_at"];
//        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//        // Configure the input format to parse the date string
//        formatter.dateFormat = @"E MMM d HH:mm:ss Z y";
//
//        NSDate *createdAtDate = [formatter dateFromString:createdAtOriginalString];
//
//        NSTimeInterval secondsBetween = [[NSDate date] timeIntervalSinceDate:createdAtDate];
//
//        if (secondsBetween <= 28800) {
//            self.createdAtString = createdAtDate.shortTimeAgoSinceNow;
//        }
//        else {
//            // Convert String to Date
//            NSDate *date = [formatter dateFromString:createdAtOriginalString];
//            // Configure output format
//            formatter.dateStyle = NSDateFormatterShortStyle;
//            formatter.timeStyle = NSDateFormatterNoStyle;
//            // Convert Date to String
//            self.createdAtString = [formatter stringFromDate:date];
//        }
//
//    }
//    return self;
//}

+ (void) postUserImage: ( UIImage * _Nullable )image withCaption: ( NSString * _Nullable )caption withCompletion: (PFBooleanResultBlock  _Nullable)completion {
    
    Post *newPost = [Post new];
    newPost.image = [self getPFFileFromImage:image];
    newPost.author = [PFUser currentUser];
    newPost.caption = caption;
    newPost.likeCount = @(0);
    newPost.commentCount = @(0);
    
    [newPost saveInBackgroundWithBlock: completion];
}

+ (PFFile *)getPFFileFromImage: (UIImage * _Nullable)image {
    
    // check if image is not nil
    if (!image) {
        return nil;
    }
    
    NSData *imageData = UIImagePNGRepresentation(image);
    // get image data and check if that is not nil
    if (!imageData) {
        return nil;
    }
    
    return [PFFile fileWithName:@"image.png" data:imageData];
}

@end
