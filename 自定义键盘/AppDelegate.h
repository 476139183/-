//
//  AppDelegate.h
//  自定义键盘
//
//  Created by Yutian Duan on 2018/3/21.
//  Copyright © 2018年 duanyutian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

