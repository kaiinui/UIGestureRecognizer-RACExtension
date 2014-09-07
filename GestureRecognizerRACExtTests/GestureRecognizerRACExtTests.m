#import <Specta.h>
#define EXP_SHORTHAND
#import <Expecta.h>

#import "UIGestureRecognizer+ReactiveCocoa.h"
#import "RACGestureRecognizerActionHandler.h"
#import <ReactiveCocoa.h>

SpecBegin(UIGestureRecognizer)

describe(@"UIGestureRecognizer", ^{
    describe(@"setAssociatedObject", ^{
        describe(@"rac_gestureDelegate", ^{
            it(@"Can set & get rac_gestureDelegate", ^{
                UIGestureRecognizer *recognizer = [[UIGestureRecognizer alloc] init];
                RACGestureRecognizerActionHandler *handler = [[RACGestureRecognizerActionHandler alloc] init];
                recognizer.rac_gestureHandler = handler;
                expect(recognizer.rac_gestureHandler).to.equal(handler);
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
    
    describe(@"- rac_initializeRAC", ^{
        it(@"Should initialize its properties", ^{
            UIGestureRecognizer *recognizer = [[UIGestureRecognizer alloc] init];
            [recognizer rac_initializeRAC];
            expect(recognizer.rac_gestureHandler).to.beTruthy;
            expect(recognizer.rac_subject).to.beTruthy;
        });
    });
    
    describe(@"+ rac_recognizer", ^{
        it(@"Should instantiate UIGestureRecognizer and initialize properly", ^{
            UIGestureRecognizer *recognizer = [UIGestureRecognizer rac_recognizer];
            expect(recognizer.rac_gestureHandler).to.beTruthy;
            expect(recognizer.rac_subject).to.beTruthy;
        });
        
        it(@"Should instantiate its subclass", ^{
            UITapGestureRecognizer *recognizer = [UITapGestureRecognizer rac_recognizer];
            recognizer.numberOfTapsRequired = 1;
            expect(recognizer.numberOfTapsRequired).to.equal(1);
        });
    });
});

SpecEnd