//
//  NewsViewModel.h
//  NewsDemo
//
//  Created by Navnit Baldha on 24/01/2024.
//

#import <Foundation/Foundation.h>

@interface DateExtension : NSObject
-(NSDate*)convertStringToDate: (NSString*) strToConvert;
-(NSString*)convertDateToString: (NSDate*) dateToConvert;
-(NSArray*)sortingDatabyDate:(NSArray*) article;
@end
