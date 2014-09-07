//
//  UIGestureRecognizer+ReactiveCocoa.h
//  GestureRecognizerRACExt
//
//  Created by kaiinui on 2014/09/07.
//  Copyright (c) 2014年 kaiinui. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RACSubject;
@class RACSignal;
@class RACGestureRecognizerDelegate;

/* TODO: NO DELEGATE! Just set a target and an action! */

@interface UIGestureRecognizer (ReactiveCocoa) // TODO: To make them private, separate them into a category.

/**
 private: To retain UIGestureDelegate. The GestureRecognizer's delegate will be
 */
@property (nonatomic, strong) RACGestureRecognizerDelegate *rac_gestureDelegate;

/**
 protected: To retain subject while recognizing gestures.
 */
@property (nonatomic, strong) RACSubject *rac_subject;

/**
 protected: Initialize RAC Extensions. (delegate retain, RACSubject initialization)
 Call when initialize inherited GestureRecognizers
 */
- (void)rac_initializeRAC;

/**
 public: RACSignal from the GestureRecognizer.
 */
- (RACSignal *)rac_signal;

@end
