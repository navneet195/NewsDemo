//
//  NewsViewModel.h
//  NewsDemo
//
//  Created by Navnit Baldha on 24/01/2024.
//

#import <Foundation/Foundation.h>

@interface NewsViewModel : NSObject

+(void)fetchArtices:(NSDictionary *)parameter success:(void (^)(NSArray *))successBlock;

@end
