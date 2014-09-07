//
//  UIGestureRecognizer+ReactiveCocoa.m
//  GestureRecognizerRACExt
//
//  Created by kaiinui on 2014/09/07.
//  Copyright (c) 2014年 kaiinui. All rights reserved.
//

#import "UIGestureRecognizer+ReactiveCocoa.h"

#import <objc/runtime.h>
#import <ReactiveCocoa.h>
#import "RACGestureRecognizerDelegate.h"

@implementation UIGestureRecognizer (ReactiveCocoa)

@dynamic rac_gestureDelegate, rac_subject;

# pragma mark - Public

- (RACSignal *)rac_signal {
    return self.rac_subject;
}

# pragma mark - Initialization

- (void)rac_initializeRAC {
    self.rac_gestureDelegate = [[RACGestureRecognizerDelegate alloc] init];
    self.delegate = self.rac_gestureDelegate;
    self.rac_subject = [RACSubject subject];
}

# pragma mark - AssociatedObject

- (void)setRac_gestureDelegate:(RACGestureRecognizerDelegate *)rac_gestureDelegate {
    objc_setAssociatedObject(self, @selector(rac_gestureDelegate), rac_gestureDelegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (RACGestureRecognizerDelegate *)rac_gestureDelegate {
    return objc_getAssociatedObject(self, @selector(rac_gestureDelegate));
}

- (void)setRac_subject:(RACSubject *)rac_subject {
    objc_setAssociatedObject(self, @selector(rac_subject), rac_subject, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (RACSubject *)rac_subject {
    return objc_getAssociatedObject(self, @selector(rac_subject));
}

@end
