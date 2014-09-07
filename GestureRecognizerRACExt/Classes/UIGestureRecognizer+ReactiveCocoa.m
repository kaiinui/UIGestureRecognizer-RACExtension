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
#import "RACGestureRecognizerActionHandler.h"

@implementation UIGestureRecognizer (ReactiveCocoa)

@dynamic rac_gestureHandler, rac_subject;

# pragma mark - Public

+ (instancetype)rac_recognizer {
    UIGestureRecognizer *recognizer = [[self alloc] init];
    [recognizer rac_initializeRAC];
    [recognizer addTarget:recognizer.rac_gestureHandler action:@selector(rac_handleGesture:)];
    return recognizer;
}

- (RACSignal *)rac_signal {
    return self.rac_subject;
}

# pragma mark - Initialization

- (void)rac_initializeRAC {
    self.rac_gestureHandler = [[RACGestureRecognizerActionHandler alloc] init];
    self.rac_subject = [RACSubject subject];
}

# pragma mark - AssociatedObject

- (void)setRac_gestureHandler:(RACGestureRecognizerActionHandler *)rac_gestureDelegate {
    objc_setAssociatedObject(self, @selector(rac_gestureHandler), rac_gestureDelegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (RACGestureRecognizerActionHandler *)rac_gestureHandler {
    return objc_getAssociatedObject(self, @selector(rac_gestureHandler));
}

- (void)setRac_subject:(RACSubject *)rac_subject {
    objc_setAssociatedObject(self, @selector(rac_subject), rac_subject, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (RACSubject *)rac_subject {
    return objc_getAssociatedObject(self, @selector(rac_subject));
}

@end
