//
//  GreetingOperation.m
//  New-project_25-GreetingOperation
//
//  Created by Geraint on 2018/5/17.
//  Copyright © 2018年 kilolumen. All rights reserved.
//

#import "GreetingOperation.h"

@implementation GreetingOperation

{
    // 这两个 私有变量，用于设置 isFinished和isExeuting方法，并返回她们的结果
    BOOL finished;
    BOOL executing;
}

- (id)init {
    if (self = [super init]) {
        finished = NO;
        executing = NO;
    }
    return self;
}

- (void)start {
    // 如果操作被取消了就返回结果
    if ([self isCancelled]) {
        [self willChangeValueForKey:@"isFinished"];
        finished = YES;
        [self didChangeValueForKey:@"isFinished"];
        return;
    }
    
    // 如果没取消，就会创建一个新的线程 使用调用独立线程执行main方法中的操作，并发送适当的KVO通知
    [self willChangeValueForKey:@"isExecuting"];
    [NSThread detachNewThreadSelector:@selector(main) toTarget:self withObject:nil];
    executing = YES;
    [self didChangeValueForKey:@"isExecuting"];
    
}

- (void)main {
    
    @autoreleasepool {
        
        @try {
            if (![self isCancelled]) {
                NSLog(@"Hello , World!  ");
                
                // 暂停，以便模拟执行任务的过程
                [NSThread sleepForTimeInterval:3.0];
                NSLog(@"Goodbye , World!");
                [self willChangeValueForKey:@"isFinished"];
                [self willChangeValueForKey:@"isExecuting"];
                executing = NO;
                finished = YES;
                [self didChangeValueForKey:@"isExecuting"];
                [self didChangeValueForKey:@"isFinished"];
            }
        }
        @catch (NSException *ex) {}
    }
}

- (BOOL)isConcurrent {
    return YES;
}

- (BOOL)isExecuting {
    return executing;
}
- (BOOL)isFinished {
    return finished;
}

@end
