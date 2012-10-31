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
    NSArray *test = [@[@1, @2, @3, @4, @5, @6, @7, @8, @9, @10] filterUsingBlock:^BOOL(NSNumber * o) {
        return [o intValue] > 5;
    }];
    STAssertEqualObjects(result, test, @"LargerThan5 should keep everything above 5");

}

- (void)testMap
{
    NSArray *result = @[@2,@3,@4,@5];
    NSArray *test = [@[@1, @2, @3, @4] mapUsingBlock:^NSNumber *(NSNumber *n) {
        return @([n intValue] + 1);
    }];
    STAssertEqualObjects(result, test, @"AddOne should add 1");
}

- (void)testReduce
{
    NSNumber *result = @10;
    NSArray *test = [@[@1, @2, @3, @4] reduceUsingBlock:^NSNumber *(NSNumber *a, NSNumber *o) {
        return @([a intValue] + [o intValue]);
    } initialAggregation:0];
    STAssertEqualObjects(result, test, @"Sum should sum numbers");
}

- (void)testApply
{
    NSArray *in = @[@"foo",@"bar",@"baz"];
    NSMutableArray *out = [NSMutableArray array];
    [in applyBlock:^(id o) {
        [out addObject:o];
    }];
    STAssertEqualObjects(in, out, @"All objects in 'in' should be added to 'out");
}

@end
