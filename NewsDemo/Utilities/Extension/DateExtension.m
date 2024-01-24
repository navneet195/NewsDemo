//
//  NewsViewModel.m
//  NewsDemo
//
//  Created by Navnit Baldha on 24/01/2024.
//

#import "Article.h"
#import "NewsConstants.h"
#import "DateExtension.h"

@implementation DateExtension

-(NSDate*)convertStringToDate: (NSString*) strToConvert {
    if ([strToConvert isKindOfClass:[NSDate class]]) {
        return (NSDate*)strToConvert;
    }

    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss'Z'"];
    NSDate *date = [dateFormat dateFromString:strToConvert];
    return date;
}

-(NSString*)convertDateToString: (NSDate*) dateToConvert {
    if ([dateToConvert isKindOfClass:[NSString class]]) {
        return (NSString*)dateToConvert;
    }

    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"MMM dd, yyyy"];
    NSString *date = [dateFormat stringFromDate:dateToConvert];
    return date;
}


-(NSArray*)sortingDatabyDate:(NSArray*) article {

    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss'Z'"];

    NSArray *sortedArray = [article sortedArrayUsingComparator:^NSComparisonResult(Article *obj1, Article *obj2) {
        NSDate *d1 = [df dateFromString: obj1.publishedAt];
        NSDate *d2 = [df dateFromString: obj2.publishedAt];
        return [d2 compare: d1];
    }];

    return sortedArray;
}

@end
