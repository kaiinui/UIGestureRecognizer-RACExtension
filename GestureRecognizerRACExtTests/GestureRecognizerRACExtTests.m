#import <Specta.h>
#define EXP_SHORTHAND
#import <Expecta.h>

#import "UIGestureRecognizer+ReactiveCocoa.h"
#import "RACGestureRecognizerDelegate.h"
#import <ReactiveCocoa.h>

SpecBegin(UIGestureRecognizer)

describe(@"UIGestureRecognizer", ^{
    describe(@"setAssociatedObject", ^{
        describe(@"rac_gestureDelegate", ^{
            it(@"Can set & get rac_gestureDelegate", ^{
                UIGestureRecognizer *recognizer = [[UIGestureRecognizer alloc] init];
                RACGestureRecognizerDelegate *delegate = [[RACGestureRecognizerDelegate alloc] init];
                recognizer.rac_gestureDelegate = delegate;
                expect(recognizer.rac_gestureDelegate).to.equal(delegate);
            });
        });
        
        describe(@"rac_subject", ^{
            it(@"Can set & get rac_subject", ^{
                UIGestureRecognizer *recognizer = [[UIGestureRecognizer alloc] init];
                RACSubject *subject =[RACSubject subject];
                recognizer.rac_subject = subject;
                expect(recognizer.rac_subject).to.equal(subject);
            });
        });
    });
});

SpecEnd