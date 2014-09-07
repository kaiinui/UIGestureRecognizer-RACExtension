//
//  KIViewController.m
//  GestureRecognizerRACExt
//
//  Created by kaiinui on 2014/09/06.
//  Copyright (c) 2014年 kaiinui. All rights reserved.
//

#import "KIViewController.h"

#import "UIGestureRecognizer+ReactiveCocoa.h"
#import <ReactiveCocoa.h>

@interface KIViewController ()

@end

@implementation KIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIPanGestureRecognizer *recognizer = [UIPanGestureRecognizer rac_recognizer];
    [[recognizer rac_signal] subscribeNext:^(id x) {
        UIPanGestureRecognizer *recognizer = x;
        switch (recognizer.state) {
            case UIGestureRecognizerStateBegan:
                NSLog(@"Began");
                break;
            case UIGestureRecognizerStatePossible:
                NSLog(@"possible");
                break;
            case UIGestureRecognizerStateChanged:
                NSLog(@"changed");
                break;
            case UIGestureRecognizerStateEnded:
                NSLog(@"end");
                break;
            default:
                break;
        }
    }];
    
    [self.view addGestureRecognizer:recognizer];
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
