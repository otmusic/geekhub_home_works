//
//  DataModel.m
//  dataCore
//
//  Created by Alexandr Kharchenko on 20.12.14.
//  Copyright (c) 2014 Alexandr Kharchenko. All rights reserved.
//

#import "DataModel.h"

@implementation DataModel

- (NSArray *) fetchEntitiesForName:(NSString *) name
					 withPredicate:(NSPredicate *) predicate
				andSortDescriptors:(NSArray *) sortDescriptors
{
	NSFetchRequest * fetchRequest = [[NSFetchRequest alloc] init];
	
	NSEntityDescription * entity = [NSEntityDescription entityForName:name
											   inManagedObjectContext:[self managedObjectContext]];
	
	[fetchRequest setEntity:entity];
	if (predicate)
	{
		[fetchRequest setPredicate:predicate];
	}
	
	if (sortDescriptors)
	{
		[fetchRequest setSortDescriptors:sortDescriptors];
	}
	else
	{
		[fetchRequest setSortDescriptors:[NSArray array]];
	}
	
	NSFetchedResultsController * result = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest
																			  managedObjectContext:[self managedObjectContext]
																				sectionNameKeyPath:nil
																						 cacheName:nil];
	NSError * error = nil;
	if (![result performFetch:&error])
	{
		NSLog(@"Critical Error %@ %@", error, [error userInfo]);
		abort();
	}
	
	NSArray * arr = [result fetchedObjects];
	
	return (arr && [arr count] > 0) ? arr : nil;
}

- (NSArray *) fetchEntitiesForName:(NSString *) name
					 withPredicate:(NSPredicate *) predicate
{
	return [self fetchEntitiesForName:name withPredicate:predicate andSortDescriptors:nil];
}

- (NSArray *) fetchEntitiesForName:(NSString *) name
{
	return [self fetchEntitiesForName:name withPredicate:nil andSortDescriptors:nil];
}

- (NSManagedObject *) getObjectForEntity:(NSString *) entity
{
#ifdef DEBUG
	assert(entity);
#endif
	NSManagedObjectContext * managedObjectContext = [self managedObjectContext];
	if (managedObjectContext)
	{
		NSManagedObject * object = [[NSManagedObject alloc] initWithEntity:[NSEntityDescription entityForName:entity inManagedObjectContext:managedObjectContext]
											insertIntoManagedObjectContext:managedObjectContext];
		return object;
	}
	return nil;
}

- (void) deleteObject:(DataModelBaseObject *) obj
{
	if (obj)
	{
		[[self managedObjectContext] deleteObject:obj];
	}
}

- (id) createObject:(NSString *) name ofClass:(Class) clas
{
#ifdef DEBUG
	assert(name);
	assert(clas);
#endif
	NSManagedObject * obj = [self getObjectForEntity:name];
	return (obj && [obj isKindOfClass:clas]) ? obj : nil;
}

- (Task *) createNewTask
{
	return [self createObject:@"Task" ofClass:[Task class]];
}

- (Comment *) createNewComment
{
	return [self createObject:@"Comment" ofClass:[Comment class]];
}

- (Task *) getTaskByID:(unsigned long long) taskID
{
	NSPredicate * predicate = [NSPredicate predicateWithFormat:@"identifier=%llu", taskID];
	if (!predicate) return nil;
	NSArray * tasks = [self fetchEntitiesForName:@"Task" withPredicate:predicate];
	return (tasks && [tasks count] > 0) ? [tasks firstObject] : nil;
}

- (NSURL *)applicationDocumentsDirectory {
	return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel {
	if (_managedObjectModel != nil) {
		return _managedObjectModel;
	}
	NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"CDB" withExtension:@"momd"];
	_managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
	return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
	if (_persistentStoreCoordinator != nil) {
		return _persistentStoreCoordinator;
	}
	
	_persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
	NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"CDB.sqlite"];
	NSError *error = nil;
	NSString *failureReason = @"There was an error creating or loading the application's saved data.";
	if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
		NSMutableDictionary *dict = [NSMutableDictionary dictionary];
		dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
		dict[NSLocalizedFailureReasonErrorKey] = failureReason;
		dict[NSUnderlyingErrorKey] = error;
		error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
		
		NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
		abort();
	}
	
	return _persistentStoreCoordinator;
}


- (NSManagedObjectContext *)managedObjectContext {
	if (_managedObjectContext != nil) {
		return _managedObjectContext;
	}
	
	NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
	if (!coordinator) {
		return nil;
	}
	_managedObjectContext = [[NSManagedObjectContext alloc] init];
	[_managedObjectContext setPersistentStoreCoordinator:coordinator];
	return _managedObjectContext;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
	NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
	if (managedObjectContext != nil) {
		NSError *error = nil;
		if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
		
			NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
			abort();
		}
	}
}

static __strong DataModel * _model = nil;
+ (DataModel *) model
{
	if (!_model)
	{
		_model = [[DataModel alloc] init];
	}
	return _model;
}

@end
