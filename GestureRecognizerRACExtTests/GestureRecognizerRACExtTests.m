#import <Specta.h>
#define EXP_SHORTHAND
#import <Expecta.h>

#import "UIGestureRecognizer+ReactiveCocoa.h"

SpecBegin(UIGestureRecognizer)

describe(@"UIGestureRecognizer", ^{
    describe(@"setAssociatedObject", ^{
        describe(@"rac_gestureDelegate", ^{
            it(@"Can set & get rac_gestureDelegate", ^{
                UIGestureRecognizer *recognizer = [[UIGestureRecognizer alloc] init];
                recognizer.rac_gestureDelegate = @3;
                expect(recognizer.rac_gestureDelegate).to.equal(@3);
            });
        });
    });
});

SpecEnd