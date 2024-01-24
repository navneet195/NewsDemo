//
//  ArticleCell.h
//  NewsDemo
//
//  Created by Navnit Baldha on 24/01/2024.
//

#import <UIKit/UIKit.h>

@interface ArticleCell: UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *mainView;

@property (weak, nonatomic) IBOutlet UIImageView *articleImage;
@property (weak, nonatomic) IBOutlet UILabel *articleTitle;
@property (weak, nonatomic) IBOutlet UILabel *articlePublishedDate;

@end
