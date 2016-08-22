//
//  DYCoreDataManagedContext.m
//  通讯录(数据库)
//
//  Created by Yangdongwu on 16/8/17.
//  Copyright © 2016年 DovYoung. All rights reserved.
//

#import "DYCoreDataManagedContext.h"

@interface DYCoreDataManagedContext ()

@end

@implementation DYCoreDataManagedContext


+ (instancetype)sharedManager {
    static id instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

#pragma mark - 懒加载

/**
 *  山下文
 */
- (NSManagedObjectContext *)managedObjectContext {
    if (_managedObjectContext == nil) {
        
        //创建上下文并制定类型为主线程类型
        _managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
        //设置存储调度器,多个山下文可以设置一个存储调度器,但是官方建议设置一个
        [_managedObjectContext setPersistentStoreCoordinator:self.persistentStoreCoordinator];
        
    }
    return _managedObjectContext;
}

/**
 *  存储调度器
 */
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    if (_persistentStoreCoordinator == nil) {
        
        //创建存储调度器,并给model赋值
        _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:self.managedObjectModel];
        
        //设置存储路径
        //设置存储路径
        NSURL *url = [[self getDocumentPath] URLByAppendingPathComponent:[NSString stringWithFormat:@"%@.db",kFileName]];
        
        //设置存储器类型和存储路径
        [_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:url options:nil error:nil];
        
        
    }
    return _persistentStoreCoordinator;
}

/**
 *  得到存储路径
 */
- (NSURL *)getDocumentPath {
    return [[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask].firstObject;
}

/**
 *  被管理的对象模型
 */
- (NSManagedObjectModel *)managedObjectModel {
    if (_managedObjectModel == nil) {
        //根据路径创建
        _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"CoreData" withExtension:@"momd"]];
    }
    return _managedObjectModel;
}

/**
 *  保存数据
 */
- (void)save {
    
    BOOL result = [self.managedObjectContext save:nil];
    
    if (result == YES) {
        NSLog(@"保存成功");
    }
    else {
        NSLog(@"保存失败");
    }
    
}


- (void)deleteAllEntites
{
    NSString *documentPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject;
    
    NSString *path1 = [documentPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.db",kFileName]];
    NSString *path2 = [documentPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.db-shm",kFileName]];
    NSString *path3 = [documentPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.db-wal",kFileName]];
    
    
    NSError *error = nil;
    [[NSFileManager defaultManager] removeItemAtPath:path1 error:&error];
    [[NSFileManager defaultManager] removeItemAtPath:path2 error:&error];
    [[NSFileManager defaultManager] removeItemAtPath:path3 error:&error];
    
    if (error == nil) {
        NSLog(@"清空数据库成功");
    }
    else
    {
        NSLog(@"清空数据库失败");
        NSLog(@"%@",error.description);
    }
}



@end
