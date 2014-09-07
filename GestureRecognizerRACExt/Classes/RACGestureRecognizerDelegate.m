//
//  RACGestureRecognizerDelegate.m
//  GestureRecognizerRACExt
//
//  Created by kaiinui on 2014/09/07.
//  Copyright (c) 2014年 kaiinui. All rights reserved.
//

#import "RACGestureRecognizerDelegate.h"
#import "UIGestureRecognizer+ReactiveCocoa.h"
#import <ReactiveCocoa.h>

@implementation RACGestureRecognizerDelegate

- (void)rac_gestureDelegate:(UIGestureRecognizer *)recognizer {
    [[recognizer rac_subject] sendNext:recognizer];
}

@end
