//
//  NewsViewController.h
//  NewsDemo
//
//  Created by Navnit Baldha on 24/01/2024.
//

#import <UIKit/UIKit.h>

@interface NewsViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *newsTableView;

@end

