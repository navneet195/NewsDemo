//
//  NewsViewController.m
//  NewsDemo
//
//  Created by Navnit Baldha on 24/01/2024.
//

#import "NewsViewController.h"
#import "Article.h"
#import "NewsViewModel.h"
#import "NewsConstants.h"
#import "ArticleCell.h"

@interface NewsViewController()

@property (nonatomic,retain) NSMutableArray *articles;

@end

@implementation NewsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = NEWS_APP_TITLE;

    [NewsViewModel fetchArtices:nil success:^(NSArray *arr)
     {
        self.articles = [[NSMutableArray alloc]initWithArray:arr];
    }];

    [self.newsTableView registerNib:[UINib nibWithNibName:NEWS_ARTICLE_NIB_NAME bundle:nil] forCellReuseIdentifier:TABLE_CELL_IDENTIFIER];

}

#pragma mark - Table View Datasource & Delegate Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.articles.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ArticleCell *cell = (ArticleCell*)[tableView dequeueReusableCellWithIdentifier:TABLE_CELL_IDENTIFIER forIndexPath:indexPath];

    if (cell == nil)
    {
        cell = [[ArticleCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:TABLE_CELL_IDENTIFIER];
    }

    Article *model = self.articles[indexPath.row];

    cell.articleTitle.text = model.title;
    cell.articlePublishedDate.text = model.publishedAt;

    dispatch_async(dispatch_get_global_queue(0,0), ^{
            NSData * data = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: model.urlToImage]];
            if ( data == nil )
                return;
            dispatch_async(dispatch_get_main_queue(), ^{
                cell.articleImage.image = [UIImage imageWithData: data];
            });
        });
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
