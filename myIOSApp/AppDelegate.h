//
//  AppDelegate.h
//  myIOSApp
//
//  Created by 吕义丰 on 2022/5/27.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

