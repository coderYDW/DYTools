//
//  DYCoreDataManagedContext.h
//  通讯录(数据库)
//
//  Created by Yangdongwu on 16/8/17.
//  Copyright © 2016年 DovYoung. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

#define kFileName @"mysql"

#define kDYCoreDataManagedContext [DYCoreDataManagedContext sharedManager]

@interface DYCoreDataManagedContext : NSObject



- (void)deleteAllEntites;

/**
 *  得到沙盒路径
 */
- (NSURL *)getDocumentPath;
/**
 *  保存数据
 */
- (void)save;

/**
 *  单例方法
 */
+ (instancetype)sharedManager;

/**
 *  上下文
 */
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
/**
 *  模型
 */
@property (nonatomic, strong) NSManagedObjectModel *managedObjectModel;
/**
 *  存储调度器
 */
@property (nonatomic, strong) NSPersistentStoreCoordinator *persistentStoreCoordinator;


@end
