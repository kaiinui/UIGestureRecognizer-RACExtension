//
//  RACGestureRecognizerDelegate.h
//  GestureRecognizerRACExt
//
//  Created by kaiinui on 2014/09/07.
//  Copyright (c) 2014年 kaiinui. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RACGestureRecognizerDelegate : NSObject <UIGestureRecognizerDelegate>

- (void)rac_gestureDelegate:(UIGestureRecognizer *)recognizer;

@end
