//
//  UIGestureRecognizer+ReactiveCocoa.h
//  GestureRecognizerRACExt
//
//  Created by kaiinui on 2014/09/07.
//  Copyright (c) 2014年 kaiinui. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RACSubject;
@class RACGestureRecognizerDelegate;

@interface UIGestureRecognizer (ReactiveCocoa)

/**
 To retain UIGestureDelegate. The GestureRecognizer's delegate will be
 */
@property (nonatomic, strong) RACGestureRecognizerDelegate *rac_gestureDelegate;

/**
 
 */
@property (nonatomic, strong) RACSubject *rac_subject;

@end
