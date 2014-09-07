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

@implementation UIGestureRecognizer (ReactiveCocoa)

@dynamic rac_gestureDelegate;

- (void)setRac_gestureDelegate:(NSNumber *)rac_gestureDelegate {
    objc_setAssociatedObject(self, @selector(rac_gestureDelegate), rac_gestureDelegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSNumber *)rac_gestureDelegate {
    return objc_getAssociatedObject(self, @selector(rac_gestureDelegate));
}

@end
