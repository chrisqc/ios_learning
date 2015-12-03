/*
 作者：MJ
 描述：
 时间：
 文件名：Person.m
 */

#import "Person.h"

// _car -> c1  0

@implementation Person
- (void)setCar:(Car *)car
{
    if (car != _car)
    {
        // 对当前正在使用的车（旧车）做一次release
        [_car release];
        
        // 对新车做一次retain操作
        _car = [car retain];
    }
}
- (Car *)car
{
    return _car;
}

- (void)setAge:(int)age
{ // 基本数据类型不需要管理内存
    _age = age;
}
- (int)age
{
    return _age;
}

- (void)dealloc
{
    // 当人不在了，代表不用车了
    // 对车做一次release操作
    [_car release];
    
    NSLog(@"%d岁的Person对象被回收了", _age);
    
    [super dealloc];
}

@end
