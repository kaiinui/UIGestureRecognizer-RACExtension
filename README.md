UIGestureRecognizer-RACExtension
================================

Handle gesture events as ReactiveCocoa signals!

```objc
UILongPressGestureRecognizer *recognizer = [UILongPressGestureRecognizer rac_recognizer];
recognizer.minimumPressDuration = 0.2;
[self.view addGestureRecognizer:recognizer];

[[recognizer rac_signal] subscribeNext:^(UILongPressGestureRecognizer *sender){
  // Do something with a signal.
}];
```

You can leverage ReactiveCocoa's powerful stream manipulation.

```objc
UIPanGestureRecognizer *panRecognizer = [UIPanGestureRecognizer rac_recognizer];
[[[panRecognizer rac_signal]
  filter:^BOOL(UIPanGestureRecognizer *pannizer) {
    return pannizer.state == UIGestureRecognizerStateEnded;
  }]
  subscribeNext:^(UIPanGestureRecognizer *recognizer) {
    NSLog(@"Panning is end!");
  }];
```

This is just an novice example. 
Mapping / filtering / combining signals will enable you to handle complex gesture state management easier.

To avoid circular reference
---

Practically, to avoid circular reference, you should weakify `self` to do something with `self` in a block. It is recommended to use `libextobjc` to handle it easier. (https://github.com/jspahrsummers/libextobjc)

```objc
@weakify(self);
[[recognizer rac_signal] subscribeNext:^(UILongPressGestureRecognizer *sender){
  @strongify(self);
  
  // Do something with a signal and self.
}];
```

Installation
---

`pod 'UIGestureRecognizer+ReactiveCocoa'`

and import `UIGestureRecognizer+ReactiveCocoa.h` in your code.

LICENSE
---

The MIT License (MIT)

Copyright (c) 2014 kaiinui

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
