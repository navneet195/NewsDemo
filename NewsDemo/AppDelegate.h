//
//  AppDelegate.h
//  NewsDemo
//
//  Created by Navnit Baldha on 24/01/2024.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

