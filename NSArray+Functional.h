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
- (NSArray *)mapUsingBlock:(id(^)(id))block;
- (NSArray *)filterUsingBlock:(BOOL(^)(id))block;
- (void)applyBlock:(void(^)(id))block;
- (id)reduceUsingBlock:(ReduceBlock)block initialAggregation:(id)initialAggregation;

@end