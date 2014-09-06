UIGestureRecognizer-RACExtension
================================

Handle gesture events as ReactiveCocoa signals!

```objc
UILongPressGestureRecognizer *recognizer = [UITapGestureRecognizer rac_recognizerWithTarget:self];
recognizer.minimumPressDuration = 0.2;
[self addGestureRecognizer:recognizer];
[[recognizer rac_signal] subscribeNext:^(UILongPressGestureRecognizer *sender){
  // Do something with a signal.
}];
```
