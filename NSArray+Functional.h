//
// Created by grav on 31/10/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

typedef id(^MapBlock)(id obj);

typedef void (^ApplyBlock)(id obj);

typedef BOOL (^FilterBlock)(id obj);

typedef id (^ReduceBlock)(id aggregation, id obj);

@interface NSArray (Functional)
- (NSArray *)mapUsingBlock:(MapBlock)block;
- (NSArray *)filterUsingBlock:(FilterBlock)block;
- (void)applyBlock:(ApplyBlock)block;
- (id)reduceUsingBlock:(ReduceBlock)block initialAggregation:(id)initialAggregation;

@end