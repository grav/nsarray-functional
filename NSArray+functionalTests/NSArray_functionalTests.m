/*

Copyright (c) 2012 Mikkel Gravgaard

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and
associated documentation files (the "Software"), to deal in the Software without restriction,
including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense,
and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial
portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT
LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/

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
