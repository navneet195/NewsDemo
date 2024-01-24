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
#import "DateExtension.h"

@interface NewsViewController()

@property (nonatomic,retain) NSMutableArray *articles;
@property (nonatomic,retain) DateExtension* extension;

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
    self.extension = [[DateExtension alloc]init];

    [NewsViewModel fetchArtices:nil success:^(NSArray *arr)
     {
        NSDateFormatter *df = [[NSDateFormatter alloc] init];
        [df setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss'Z'"]; // MMM dd, yyyy

        NSArray *sortedArray = [self.extension sortingDatabyDate: arr];
        self.articles = [[NSMutableArray alloc]initWithArray:sortedArray];
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


    NSDate *date = [self.extension convertStringToDate: model.publishedAt];
    cell.articlePublishedDate.text = [self.extension convertDateToString: date];

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
