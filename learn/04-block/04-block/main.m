//
//  main.m
//  04-block
//
//  Created by apple on 13-8-11.
//  Copyright (c) 2013年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 block要掌握的东西
 1> 如何定义block变量
 int (^sumBlock)(int, int);
 void (^myBlock)();
 
 2> 如何利用block封装代码
 ^(int a, int b) {
    return a - b;
 };
 
 ^() {
    NSLog(@"----------");
 };
 
 ^ {
    NSLog(@"----------");
 };
 
 3> block访问外面变量
 * block内部可以访问外面的变量
 * 默认情况下，block内部不能修改外面的局部变量
 * 给局部变量加上__block关键字，这个局部变量就可以在block内部修改
 
 4>　利用typedef定义block类型
 typedef int (^MyBlock)(int, int);
 // 以后就可以利用MyBlock这种类型来定义block变量
 MyBlock block;
 MyBlock b1, b2;
 
 b1 = ^(int a, int b) {
    return a - b;
 };
 
 MyBlock b3 = ^(int a, int b) {
    return a - b;
 };
 */

typedef int (*SumP)(int, int);


typedef int (^MyBlock)(int, int);

int sum(int a, int b)
{
    return a + b;
}

int main()
{
    // int (*p)(int, int) = sum;
    // int (*p2)(int, int) = sum;
    // SumP p = sum;
    // SumP p2 = sum;
    
    
    /*
    int (^sumBlock)(int, int);
    
    sumBlock = ^(int a, int b) {
        return a + b;
    };
    
    int (^minusBlock)(int, int) = ^(int a, int b) {
        return a - b;
    };*/
    
    MyBlock sumBlock;
    sumBlock = ^(int a, int b) {
        return a + b;
    };
    
    MyBlock minusBlock = ^(int a, int b) {
        return a - b;
    };
    
    
    MyBlock multiplyBlock = ^(int a, int b) {
        return a * b;
    };
    
    
    NSLog(@"%d - %d - %d", multiplyBlock(2, 4),  sumBlock(10 , 9), minusBlock(10, 8));
     
    return 0;
}

void test3()
{
    int a = 10;
    __block int b = 20;
    
    void (^block)();
    
    block = ^{
        // block内部可以访问外面的变量
        //NSLog(@"a = %d", a);
        
        // 默认情况下，block内部不能修改外面的局部变量
        // a = 20;
        
        // 给局部变量加上__block关键字，这个局部变量就可以在block内部修改
        b = 25;
    };
    
    
    block();
}

// 有返回值、有形参的block
void test2()
{
    /*
     // 指针函数的指针
     int (*p)(int, int) = sum;
     int d = p(10, 12);
     NSLog(@"%d", d);
     */
    
    
    int (^sumblock)(int, int) = ^(int a, int b){
        return a + b;
    };
    
    int c = sumblock(10, 11);
    
    
    // 用一个block输出n条横线
    
    
    void (^lineBlock)(int) =  ^(int n)
    {
        for (int i = 0; i<n; i++) {
            NSLog(@"----------------");
        }
    };
    lineBlock(5);

}

// 没有返回值、没有形参的block
void test()
{
    // block用来保存一段代码
    // block的标志：^
    /*
     block跟函数很像：
     1.可以保存代码
     2.有返回值
     3.有形参
     4.调用方式一样
     */
    
    // 定义block变量
    /*
    void (^myblock)() = ^(){
        NSLog(@"----------------");
        NSLog(@"----------------");
    };*/
    
    // 如果block没有形参，可以省略后面的()
    void (^myblock)() = ^{
        NSLog(@"----------------");
        NSLog(@"----------------");
    };
    
    // 利用block变量调用block内部的代码
    myblock();
    
    myblock();
}