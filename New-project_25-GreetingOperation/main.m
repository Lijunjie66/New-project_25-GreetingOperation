//
//  main.m
//  New-project_25-GreetingOperation
//
//  Created by Geraint on 2018/5/16.
//  Copyright © 2018年 kilolumen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "GreetingOperation.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        
        GreetingOperation *greetignOp = [GreetingOperation new];
        [greetignOp start];
        while (![greetignOp isFinished]);
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
