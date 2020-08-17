#import <Foundation/Foundation.h>

@interface DataModel : NSObject

#pragma mark - atomic task
/********************************************************************
 taskId使用bitmask方式定义， 每个任务只能某一位为1， e.g:
 
 typedef NS_ENUM(NSUInteger, DataModelTaskId)
 {
 DataModelTaskId1 = 0x0001 << 0,
 DataModelTaskId2 = 0x0001 << 1,
 ...
 DMCodeErrorInvalid = INT_MAX
 };
 ********************************************************************/

/**
 添加开始执行的操作。调用该方法必须通过endAtomicTask来结束。
 @param taskId 任务id, 不能为0;
 @return YES,可以开始执行； NO，不允许执行
 */
- (BOOL)addAtomicTask:(NSInteger)taskId;


/**
 结束任务

@param taskId 任务id, 不能为0
 @return YES,任务结束； NO，任务结束失败
 */
- (BOOL)endAtomicTask:(NSInteger)taskId;

@end


