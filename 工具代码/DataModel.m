
#import "DataModel.h"

@interface DataModel ()

@property (nonatomic, assign) NSInteger  task;
@property (nonatomic, strong) dispatch_queue_t atomicTaskOpQueue;

@end

@implementation DataModel


- (instancetype)init {
    if (self = [super init]) {
        _task = 0;
        _atomicTaskOpQueue = dispatch_queue_create("com.dtfindme.atomicTaskOpQueue", DISPATCH_QUEUE_SERIAL);
    }
    
    return self;
}

- (BOOL)addAtomicTask:(NSInteger)taskId {
    
    __block BOOL addSuccess = NO;

    dispatch_sync(self.atomicTaskOpQueue, ^{
        
        if ([self validationTaskId:taskId]) {
            if (![self alreadyWorking:taskId]) {
                self.task |= taskId;
                addSuccess = YES;
            }  else {
                addSuccess = NO;
            }
        }
    });
    return addSuccess;
}

- (BOOL)endAtomicTask:(NSInteger)taskId {
    __block BOOL endSuccess = NO;
    
    dispatch_sync(self.atomicTaskOpQueue, ^{
        
        if ([self validationTaskId:taskId])
        {
            if ([self alreadyWorking:taskId]) {
                self.task &= ~taskId;
                endSuccess = YES;
            } else {
                endSuccess = NO;
            }
        }
    });
    return endSuccess;
}

- (BOOL)alreadyWorking:(NSInteger)taskId {
    return (self.task & taskId) == taskId;
}

- (BOOL)validationTaskId:(NSInteger)taksId {
    if (taksId == 0){
        return NO;
    } else {
        return YES;        
    }
}

@end

