//
//  Article.m
//  NewsDemo
//
//  Created by Navnit Baldha on 24/01/2024.
//

#import "Article.h"
#import "NewsConstants.h"

@implementation Article

-(id)initWithDictionary:(NSDictionary *)dict
{
    self.publishedAt = [dict valueForKey:NEWS_ARTICLE_PUBLISHED_AT];
    self.title = [dict valueForKey:NEWS_ARTICLE_TITLE];
    self.url =  [dict valueForKey:NEWS_ARTICLE_URL];
    self.urlToImage =  [dict valueForKey:NEWS_ARTICLE_UR_TO_IMAGE];

    return self;
}

@end
