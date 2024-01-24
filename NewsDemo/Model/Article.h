//
//  Article.h
//  NewsDemo
//
//  Created by Navnit Baldha on 24/01/2024.
//


#import <Foundation/Foundation.h>

@interface Article : NSObject

@property (nonatomic, strong) NSString *publishedAt;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSString *urlToImage;

-(id)initWithDictionary:(NSDictionary*)dict;

@end

