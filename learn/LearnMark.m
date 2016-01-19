/*
 1.#import的用途：
 1> 跟#include一样，拷贝文件的内容
 2> 可以自动防止文件的内容被重复拷贝
 
 2.#import <Foundation/NSObjCRuntime.h>
    NSObjCRuntime.h中有NSLog函数的声明
 
 3.Foundation框架头文件的路径
 1> 右击Xcode.app --> 显示包内容
 2> Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS6.0.sdk/System/Library/Frameworks/Foundation.framework
 
 4.主头文件
 1> 主头文件：最主要的头文件，名字一般跟框架名称一样，包含了框架中的所有其他头文件
 2> Foundation框架的主头文件名称就是Foundation.h
 3> 只需要包含Foundation框架主头文件，就可以使用整个框架的东西
 
 
 5.运行过程
 1> 编写OC源文件：.m、.c
 2> 编译：cc -c xxx.m xxx.c
 3> 链接：cc xxx.o xxx.o -framework Foundation
   (只有用到了Foundation框架才需要加上-framework Foundation)
 4> 运行：./a.out
 */
 
 公共变量可以使用指针类型直接访问
@public
    int wheels; // 轮胎个数
    int speed; // 时速(xxkm/h)


p->wheels = 4;
p->speed = 250;

***********************************************
方法 
对象

***********************************************
 set方法
 1.作用： 提供一个方法给外界设置成员变量值，可以在方法里面对参数进行相应过滤
 2.命名规范：
 1> 方法名必须以set开头
 2> set后面跟上成员变量的名称，成员变量的首字母必须大写
 3> 返回值一定是void
 4> 一定要接收一个参数，而且参数类型跟成员变量类型一致
 5> 形参的名称不能跟成员变量名一样
 - (void)setAge:(int)age
{
    // 对传进来的参数进行过滤
    if (age <= 0)
    {
        age = 1;
    }
    
    _age = age;
}

  get方法
 1.作用：返回对象内部的成员变量
 2.命名规范：
 1> 肯定有返回值，返回值类型肯定与成员变量类型一致
 2> 方法名跟成员变量名一样
 3> 不需要接收任何参数
 - (int)age
{
    return _age;
}

***********************************************
 对象方法
 1> 减号 - 开头
 2> 只能由对象来调用
 3> 对象方法中能访问当前对象的成员变量（实例变量）
 
 类方法
 1> 加号 + 开头
 2> 只能由类（名）来调用
 3> 类方法中不能访问成员变量（实例变量）
 
 
 类方法的好处和使用场合
 1> 不依赖于对象，执行效率高
 2> 能用类方法，尽量用类方法
 3> 场合：当方法内部不需要使用到成员变量时，就可以改为类方法
 
***********************************************
  self的用途：
 1> 谁调用了当前方法，self就代表谁
 * self出现在对象方法中，self就代表对象
 * self出现在类方法中，self就代表类
 
 2> 在对象方法利用"self->成员变量名"访问当前对象内部的成员变量
 
 2> [self 方法名]可以调用其他对象方法\类方法
 
***********************************************
   1.继承的好处：
 1> 抽取重复代码
 2> 建立了类之间的关系
 3> 子类可以拥有父类中的所有成员变量和方法
 
 2.注意点
 1> 基本上所有类的根类是NSObject
 
 
  1.重写：子类重新实现父类中的某个方法，覆盖父类以前的做法
 2.注意
 1> 父类必须声明在子类的前面
 2> 子类不能拥有和父类相同的成员变量
 3> 调用某个方法时，优先去当前类中找，如果找不到，去父类中找
 
 2.坏处：耦合性太强
 
 1.继承的使用场合
 1> 当两个类拥有相同属性和方法的时候，就可以将相同的东西抽取到一个父类中
 2> 当A类完全拥有B类中的部分属性和方法时，可以考虑让B类继承A类
 
***********************************************
 super的作用
 1.直接调用父类中的某个方法
 2.super处在对象方法中，那么就会调用父类的对象方法
   super处在类方法中，那么就会调用父类的类方法
 
 3.使用场合：子类重写父类的方法时想保留父类的一些行为
 
 ***********************************************
  多态
 1.没有继承就没有多态
 2.代码的体现：父类类型的指针指向子类对象
 3.好处：如果函数\方法参数中使用的是父类类型，可以传入父类、子类对象
 4.局限性：
 1> 父类类型的变量 不能 直接调用子类特有的方法。必须强转为子类类型变量后，才能直接调用子类特有的方法
 
***********************************************
  使用注意：
 1.分类只能增加方法，不能增加成员变量
 2.分类方法实现中可以访问原来类中声明的成员变量
 3.分类可以重新实现原来类中的方法，但是会覆盖掉原来的方法，会导致原来的方法没法再使用
 4.方法调用的优先级：分类(最后参与编译的分类优先) --> 原来类  --> 父类
 
***********************************************
 构造方法：用来初始化对象的方法，是个对象方法，-开头
 重写构造方法的目的：为了让对象创建出来，成员变量就会有一些固定的值

 重写构造方法的注意点
1.先调用父类的构造方法（[super init]）
2.再进行子类内部成员变量的初始化

// 重写-init方法
//- (id)init
//{
//    // 1.一定要调用回super的init方法:初始化父类中声明的一些成员变量和其他属性
//    self = [super init]; // 当前对象 self
//    
//    
//    // 2.如果对象初始化成功，才有必要进行接下来的初始化
//    if (self != nil)
//    { // 初始化成功
//        _age = 10;
//    }
//    
//    // 3.返回一个已经初始化完毕的对象
//    return self;
//}

***********************************************
/*
 自定义构造方法的规范
 1.一定是对象方法，一定以 - 开头
 2.返回值一般是id类型
 3.方法名一般以initWith开头
*/

***********************************************
/*
 1.当程序启动时，就会加载项目中所有的类和分类，而且加载后会调用每个类和分类的+load方法。只会调用一次。
 
 2.当第一次使用某个类时，就会调用当前类的+initialize方法
 
 3.先加载父类，再加载子类（先调用父类的+load方法，再调用子类的+load方法）
   先初始化父类，再初始化子类（先调用父类的+initialize方法，再调用子类的+initialize方法）
 */

 ***********************************************
 // 输出当前函数名
 NSLog(@"%s\n", __func__);
 // 输出行号
 NSLog(@"%d", __LINE__);
 
// NSLog输出C语言字符串的时候，不能有中文
// NSLog(@"%s", __FILE__);
 
// 输出源文件的名称
printf("%s\n", __FILE__);

// 默认情况下，利用NSLog和%@输出对象时，结果是：<类名：内存地址>
    
// 1.会调用对象p的-description方法
// 2.拿到-description方法的返回值（NSString *）显示到屏幕上
// 3.-description方法默认返回的是“类名+内存地址”
NSLog(@"%@", p);

***********************************************
SEL其实是对方法的一种包装，将方法包装成一个SEL类型的数据，去找对应的方法地址。找到方法地址就可以调用方法
其实消息就是SEL

***********************************************
 1.方法的基本使用
 1> retain ：计数器+1，会返回对象本身
 2> release ：计数器-1，没有返回值
 3> retainCount ：获取当前的计数器
 4> dealloc
  * 当一个对象要被回收的时候，就会调用
  * 一定要调用[super dealloc]，这句调用要放在最后面
 
 2.概念
 1> 僵尸对象 ：所占用内存已经被回收的对象，僵尸对象不能再使用
 2> 野指针 ：指向僵尸对象（不可用内存）的指针，给野指针发送消息会报错（EXC_BAD_ACCESS）
 3> 空指针 ：没有指向任何东西的指针（存储的东西是nil、NULL、0），给空指针发送消息不会报错
 
 1.你想使用（占用）某个对象，就应该让对象的计数器+1（让对象做一次retain操作）
 2.你不想再使用（占用）某个对象，就应该让对象的计数器-1（让对象做一次release）
 3.谁retain，谁release
 4.谁alloc，谁release
 
  内存管理代码规范：
 1.只要调用了alloc，必须有release（autorelease）
   对象不是通过alloc产生的，就不需要release
 
 2.set方法的代码规范
 1> 基本数据类型：直接复制
 - (void)setAge:(int)age
 { 
    _age = age;
 }
 
 2> OC对象类型
 - (void)setCar:(Car *)car
 {
    // 1.先判断是不是新传进来对象
    if ( car != _car )
    {
        // 2.对旧对象做一次release
        [_car release];
 
        // 3.对新对象做一次retain
        _car = [car retain];
    }
 }
 
 3.dealloc方法的代码规范
 1> 一定要[super dealloc]，而且放到最后面
 2> 对self（当前）所拥有的其他对象做一次release
 - (void)dealloc
 {
    [_car release];
    [super dealloc];
 }
 
***********************************************
 1.set方法内存管理相关的参数
 * retain : release旧值，retain新值（适用于OC对象类型）
 * assign : 直接赋值（默认，适用于非OC对象类型）
 * copy   : release旧值，copy新值
 
 2.是否要生成set方法
 * readwrite : 同时生成setter和getter的声明、实现(默认)
 * readonly  : 只会生成getter的声明、实现
 
 3.多线程管理
 * nonatomic : 性能高 (一般就用这个)
 * atomic    : 性能低（默认）
 
 4.setter和getter方法的名称
 * setter : 决定了set方法的名称，一定要有个冒号 :
 * getter : 决定了get方法的名称(一般用在BOOL类型)
 
 ***********************************************
  1.autorelease的基本用法
 1> 会将对象放到一个自动释放池中
 2> 当自动释放池被销毁时，会对池子里面的所有对象做一次release操作
 3> 会返回对象本身
 4> 调用完autorelease方法后，对象的计数器不变
 
 2.autorelease的好处
 1> 不用再关心对象释放的时间
 2> 不用再关心什么时候调用release
 
 3.autorelease的使用注意
 1> 占用内存较大的对象不要随便使用autorelease
 2> 占用内存较小的对象使用autorelease，没有太大影响
 
 
 4.错误写法
 1> alloc之后调用了autorelease，又调用release
 @autoreleasepool
 {
    // 1
    Person *p = [[[Person alloc] init] autorelease];
 
    // 0
    [p release];
 }
 
 2> 连续调用多次autorelease
 @autoreleasepool
 {
    Person *p = [[[[Person alloc] init] autorelease] autorelease];
 }
 
 5.自动释放池
 1> 在iOS程序运行过程中，会创建无数个池子。这些池子都是以栈结构存在（先进后出）
 2> 当一个对象调用autorelease方法时，会将这个对象放到栈顶的释放池
 
 
 6.自动释放池的创建方式
 1> iOS 5.0前
 NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
 
 [pool release]; // [pool drain];
 
 
 2> iOS 5.0 开始
 @autoreleasepool
 {
    
 }
 
***********************************************
 1.系统自带的方法里面没有包含alloc、new、copy，说明返回的对象都是autorelease的
 
 2.开发中经常会提供一些类方法，快速创建一个已经autorelease过的对象
 1> 创建对象时不要直接用类名，一般用self
 + (id)person
 {
    return [[[self alloc] init] autorelease];
 }
 
***********************************************
 ARC的判断准则：只要没有强指针指向对象，就会释放对象
 
 
 1.ARC特点
 1> 不允许调用release、retain、retainCount
 2> 允许重写dealloc，但是不允许调用[super dealloc]
 3> @property的参数
  * strong ：成员变量是强指针（适用于OC对象类型）
  * weak ：成员变量是弱指针（适用于OC对象类型）
  * assign : 适用于非OC对象类型
 4> 以前的retain改为用strong
 
 指针分2种：
 1> 强指针：默认情况下，所有的指针都是强指针 __strong
 2> 弱指针：__weak
 
***********************************************
 当两端循环引用的时候，解决方案：
 1> ARC
 1端用strong，另1端用weak
 
 2> 非ARC
 1端用retain，另1端用assign
 
 @interface Person : NSObject

@property (nonatomic, strong) Dog *dog;

@end

@interface Dog : NSObject

@property (nonatomic, weak) Person *person;

@end
***********************************************
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
 
***********************************************
 1.协议的定义
 @protocol 协议名称 <NSObject>
  // 方法声明列表....
 @end
 
 
 2.如何遵守协议
 1> 类遵守协议
 @interface 类名 : 父类名 <协议名称1, 协议名称2>
 
 @end
 
 2> 协议遵守协议
 @protocol 协议名称 <其他协议名称1, 其他协议名称2>
 
 @end
 
 3.协议中方法声明的关键字
 1> @required (默认)
   要求实现，如果没有实现，会发出警告
 
 2> @optional
   不要求实现，怎样不会有警告
 
 4.定义一个变量的时候，限制这个变量保存的对象遵守某个协议
 类名<协议名称> *变量名;
 id<协议名称> 变量名;
 NSObject<MyProtocol> *obj;
 id<MyProtocol> obj2;
 
 如果没有遵守对应的协议，编译器会警告
 
 5.@property中声明的属性也可用做一个遵守协议的限制
 @property (nonatomic, strong) 类名<协议名称> *属性名;
 @property (nonatomic, strong) id<协议名称> 属性名;

 @property (nonatomic, strong) Dog<MyProtocol> *dog;
 @property (nonatomic, strong) id<MyProtocol> dog2;
 
 6.协议可用定义在单独.h文件中，也可用定义在某个类中
 1> 如果这个协议只用在某个类中，应该把协议定义在该类中
 
 2> 如果这个协议用在很多类中，就应该定义在单独文件中
 
 7.分类可用定义在单独.h和.m文件中，也可用定义在原来类中
 1> 一般情况下，都是定义在单独文件
 2> 定义在原来类中的分类，只要求能看懂语法
 
***********************************************
失去焦点后自动关闭键盘
[self.view endEditing:YES];

***********************************************
ScollView内容
1.将需要展示的内容添加到UIScrollView中,在view下增加ScrollView,ScrollView下增加imageview
2.设置UIScrollView的contentSize属性，告诉UIScrollView所有内容的尺寸，也就是告诉它滚动的范围（能滚多远，滚到哪里是尽头）
self.scrollView.contentSize = CGSizeMake(500,480);

获取图片尺寸：self.minionView.frame.size;
self.minionView.image.size;

@property(nonatomic) CGPoint contentOffset; 
这个属性用来表示UIScrollView滚动的位置

@property(nonatomic) CGSize contentSize; 
这个属性用来表示UIScrollView内容的尺寸，滚动范围（能滚多远）

@property(nonatomic) UIEdgeInsets contentInset; 
这个属性能够在UIScrollView的4周增加额外的滚动区域

移动效果动画实现
 [UIView animateWithDuration:1.0 animations:^{
	self.scrollView.contentOffset = CGPointMake(100,0);
]}
动画方法2
[self.scrollView setContentOffset:offset animated:YES];

缩放大小需要设定max min







***********************************************
***********************************************
***********************************************
***********************************************
***********************************************
***********************************************
***********************************************
***********************************************
***********************************************
***********************************************
***********************************************
 ***********************************************
 ***********************************************
  ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
  ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
  ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
  ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
  ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
  ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
  ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
  ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
  ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
  ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
  ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
  ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
  ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
  ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
  ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
  ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
  ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
  ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
  ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
  ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
  ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
  ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
  ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
  ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
  ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
  ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
  ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
  ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
  ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
  ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
  ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
  ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************
 ***********************************************