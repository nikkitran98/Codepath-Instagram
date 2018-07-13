//
//  ProfileViewController.m
//  Instagram
//
//  Created by Nikki Tran on 7/12/18.
//  Copyright © 2018 Nikki Tran. All rights reserved.
//

#import "ProfileViewController.h"

@interface ProfileViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (strong, nonatomic) NSArray *postsArray;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *) self.collectionView.collectionViewLayout;
    
    CGFloat postersPerLine = 3;
    CGFloat itemWidth = self.collectionView.frame.size.width / postersPerLine;
    CGFloat itemHeight = itemWidth * 1.5;
    layout.itemSize = CGSizeMake(itemWidth, itemHeight);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) fetchPosts {
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
//    MovieCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MovieCollectionCell" forIndexPath:indexPath];
//
//    NSDictionary *movie = self.filteredMovies[indexPath.row];
//    NSLog(@"%@", movie[@"title"]);
//
//    NSString *baseURLString = @"https://image.tmdb.org/t/p/w500";
//    NSString *posterURLString = movie[@"poster_path"];
//    NSString *fullPosterURLString = [baseURLString stringByAppendingString:posterURLString];
//
//    NSURL *posterURL = [NSURL URLWithString:fullPosterURLString];
//
//    NSURLRequest *request = [NSURLRequest requestWithURL:posterURL];
//    [cell.posterView setImageWithURLRequest:request placeholderImage:nil
//                                    success:^(NSURLRequest *imageRequest, NSHTTPURLResponse *imageResponse, UIImage *image) {
//
//                                        // imageResponse will be nil if the image is cached
//                                        if (imageResponse) {
//                                            NSLog(@"Image was NOT cached, fade in image");
//                                            cell.posterView.alpha = 0.0;
//                                            cell.posterView.image = image;
//
//                                            //Animate UIImageView back to alpha 1 over 0.3sec
//                                            [UIView animateWithDuration:0.3 animations:^{
//                                                cell.posterView.alpha = 1.0;
//                                            }];
//                                        }
//                                        else {
//                                            NSLog(@"Image was cached so just update the image");
//                                            cell.posterView.image = image;
//                                        }
//                                    }
//                                    failure:^(NSURLRequest *request, NSHTTPURLResponse * response, NSError *error) {
//                                        // do something for the failure condition
//                                    }];
//
//    return cell;
    return nil;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.postsArray.count;
}

@end
