//
//  UIGestureRecognizer+ReactiveCocoa.h
//  GestureRecognizerRACExt
//
//  Created by kaiinui on 2014/09/07.
//  Copyright (c) 2014年 kaiinui. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RACSubject;

@interface UIGestureRecognizer (ReactiveCocoa)

/**
 To retain UIGestureDelegate in itself.
 */
@property (nonatomic, strong) id<UIGestureRecognizerDelegate> rac_gestureDelegate;
@property (nonatomic, strong) RACSubject *rac_subject;

@end
