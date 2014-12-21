//
//  DataModel.h
//  dataCore
//
//  Created by Alexandr Kharchenko on 20.12.14.
//  Copyright (c) 2014 Alexandr Kharchenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

#import "Task.h"
#import "Comment.h"

@interface DataModel : NSObject

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

/**
 @brief Deletes object from db.
 @param obj The object, can be nil.
 */
- (void) deleteObject:(DataModelBaseObject *) obj;


/**
 @brief Creates db object by name and class.
 @param name The name of the object entry. Should NOT be nil.
 @param clas The class type of the object entry. Should NOT be nil.
 @return Newly created object.
 */
- (id) createObject:(NSString *) name ofClass:(Class) clas;


/**
 @brief Create new task object. Not saved to db, call it manually after setup.
 @detailed createdAt & updatedAt fields setted to the current date.
 @return New task object or nil.
 */
- (Task *) createNewTask;
- (Comment *) createNewComment;

/**
 @brief Locate task with specific ID.
 @return Task object or nil.
 */
- (Task *) getTaskByID:(unsigned long long) taskID;



- (void) saveContext;

+ (DataModel *) model;

@end