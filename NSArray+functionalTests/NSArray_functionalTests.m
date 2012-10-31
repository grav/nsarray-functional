//
//  NSArray_functionalTests.m
//  NSArray+functionalTests
//
//  Created by Mikkel Gravgaard on 10/31/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NSArray_functionalTests.h"
#import "NSArray+Functional.h"
@implementation NSArray_functionalTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testFilter
{
    NSArray *result = @[@6, @7, @8, @9, @10];
    FilterBlock largerThan5 = ^BOOL(NSNumber *o) {
        return [o intValue] > 5;
    };
    NSArray *test = [@[@1, @2, @3, @4, @5, @6, @7, @8, @9, @10] filterUsingBlock:largerThan5];
    STAssertEqualObjects(result, test, @"Everything above 5 should be kept");

}

- (void)testMap
{
    NSArray *result = @[@2,@3,@4,@5];
    MapBlock addOne = ^NSNumber *(NSNumber *n) {
        return @([n intValue] + 1);
    };
    NSArray *test = [@[@1, @2, @3, @4] mapUsingBlock:addOne];
    STAssertEqualObjects(result, test, @"1 should be added");
}

- (void)testReduce
{
    NSNumber *result = @10;
    ReduceBlock sum = ^NSNumber *(NSNumber *a, NSNumber *o) {
        return @([a intValue] + [o intValue]);
    };
    NSArray *test = [@[@1, @2, @3, @4] reduceUsingBlock:sum initialAggregation:0];
    STAssertEqualObjects(result, test, @"Numbers should be summed");
}

- (void)testApply
{
    NSArray *in = @[@"foo",@"bar",@"baz"];
    NSMutableArray *out = [NSMutableArray array];
    ApplyBlock addToOut = ^(id o) {
        [out addObject:o];
    };
    [in applyBlock:addToOut];
    STAssertEqualObjects(in, out, @"All objects in 'in' should be added to 'out");
}

@end
