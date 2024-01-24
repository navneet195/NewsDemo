//
//  NewsViewModel.m
//  NewsDemo
//
//  Created by Navnit Baldha on 24/01/2024.
//

#import "NewsViewModel.h"
#import "Article.h"
#import "NewsConstants.h"
#import "DateExtension.h"

@implementation NewsViewModel

+(void)fetchArtices:(NSDictionary *)parameter success:(void (^)(NSArray *))successBlock
{

    NSString *filePath = [[NSBundle mainBundle] pathForResource:NEWS_FILE_NAME ofType:NEWS_EXTENTION_FILE_NAME];

    // Reset data.
    NSMutableArray *articles = [[NSMutableArray alloc]init];

    NSError *error = nil;

    NSData *JSONData = [NSData dataWithContentsOfFile:filePath options:NSDataReadingMappedIfSafe error:&error];

    // Create an Objective-C object from JSON Data

    NSDictionary* dict= [NSJSONSerialization
                         JSONObjectWithData:JSONData
                         options:NSJSONReadingAllowFragments
                         error:&error];

    NSMutableArray* response = [dict valueForKey:ARTICLE_ENTITY_NAME];

    NSLog(@"%@", response);
    for(NSDictionary *obj in response){
        Article *articleList = [[Article alloc]initWithDictionary:obj];
        [articles addObject:articleList];
    }
    successBlock(articles);
}

@end
