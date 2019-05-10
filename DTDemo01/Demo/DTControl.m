//
//  DTControl.m
//  Demo
//
//  Created by WangDa Mac on 2019/5/8.
//  Copyright © 2019 黄启标. All rights reserved.
//

#import "DTControl.h"

@implementation DTControl


// @property(nonatomic,getter=isEnabled) BOOL enabled;

- (void)setEnabled:(BOOL)enabled {
    [super setEnabled:enabled];
}

// @property(nonatomic,getter=isSelected) BOOL selected;
- (void)setSelected:(BOOL)selected {
    [super setSelected:selected];
}

// @property(nonatomic,getter=isHighlighted) BOOL highlighted;
- (void)setHighlighted:(BOOL)highlighted {
    [super setHighlighted:highlighted];
}
// @property(nonatomic) UIControlContentVerticalAlignment contentVerticalAlignment;
// @property(nonatomic) UIControlContentHorizontalAlignment contentHorizontalAlignment;

// @property(nonatomic, readonly) UIControlContentHorizontalAlignment effectiveContentHorizontalAlignment;
// @property(nonatomic,readonly) UIControlState state;
// @property(nonatomic,readonly,getter=isTracking) BOOL tracking;
// @property(nonatomic,readonly,getter=isTouchInside) BOOL touchInside;

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
}

- (BOOL)beginTrackingWithTouch:(UITouch *)touch withEvent:(nullable UIEvent *)event {
    BOOL shouldBegin = [super beginTrackingWithTouch:touch withEvent:event];
    return shouldBegin;
}
- (BOOL)continueTrackingWithTouch:(UITouch *)touch withEvent:(nullable UIEvent *)event {
    BOOL shouldContibue = [super continueTrackingWithTouch:touch withEvent:event];
    return shouldContibue;
}
- (void)endTrackingWithTouch:(nullable UITouch *)touch withEvent:(nullable UIEvent *)event {
    [super endTrackingWithTouch:touch withEvent:event];
}
- (void)cancelTrackingWithEvent:(nullable UIEvent *)event{
    [super cancelTrackingWithEvent:event];
}

// add target/action for particular event. you can call this multiple times and you can specify multiple target/actions for a particular event.
// passing in nil as the target goes up the responder chain. The action may optionally include the sender and the event in that order
// the action cannot be NULL. Note that the target is not retained.
- (void)addTarget:(nullable id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents {
    [super addTarget:target action:action forControlEvents:controlEvents];
}

// remove the target/action for a set of events. pass in NULL for the action to remove all actions for that target
- (void)removeTarget:(nullable id)target action:(nullable SEL)action forControlEvents:(UIControlEvents)controlEvents {
    [super removeTarget:target action:action forControlEvents:controlEvents];
}

//#if UIKIT_DEFINE_AS_PROPERTIES
//@property(nonatomic,readonly) NSSet *allTargets;
//@property(nonatomic,readonly) UIControlEvents allControlEvents;
//#else

// set may include NSNull to indicate at least one nil target
- (NSSet *)allTargets {
    NSSet *allTargets = [super allTargets];
    return allTargets;
}
// list of all events that have at least one action
- (UIControlEvents)allControlEvents {
    UIControlEvents allControlEvents = [super allControlEvents];
    return allControlEvents;
}
//#endif
 // single event. returns NSArray of NSString selector names. returns nil if none
- (nullable NSArray<NSString *> *)actionsForTarget:(nullable id)target forControlEvent:(UIControlEvents)controlEvent {
    NSArray *actions = [super actionsForTarget:target forControlEvent:controlEvent];
    return actions;
}

// send the action. the first method is called for the event and is a point at which you can observe or override behavior. it is called repeately by the second.
- (void)sendAction:(SEL)action to:(nullable id)target forEvent:(nullable UIEvent *)event {
    [super sendAction:action to:target forEvent:event];
}

// send all actions associated with events
- (void)sendActionsForControlEvents:(UIControlEvents)controlEvents {
    [super sendActionsForControlEvents:controlEvents];
}

@end
