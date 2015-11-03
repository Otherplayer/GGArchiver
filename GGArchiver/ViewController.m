//
//  ViewController.m
//  GGArchiver
//
//  Created by __无邪_ on 15/9/14.
//  Copyright © 2015年 __无邪_. All rights reserved.
//


//xml属性列表（plist归档）
//
//NSUserDefaults（偏好设置）
//
//NSKeyedArchiver归档（加密形式）              ///
//
//SQLite3(嵌入式数据库)
//
//Core Data（面向对象方式的嵌入式数据库）


#import "ViewController.h"
#import "GGCar.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
//    //NSString归档
//    NSString *str1=@"Hello,world!";
//    NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
//    NSString *homePath  = [path stringByAppendingPathComponent:@"atany.arc"];//添加储存的文件名
//    BOOL flag = [NSKeyedArchiver archiveRootObject:str1 toFile:homePath];//归档一个字符串
//    if(!flag){
//        NSLog(@"archiver failed!");
//    }
//    //NSString解档
//    NSString *str2= [NSKeyedUnarchiver unarchiveObjectWithFile:homePath];
//    NSLog(@"str2=%@",str2);//结果：str2=Hello,world!
//    
//    
//    //NSArray归档
//    NSString *path2 = [path stringByAppendingPathComponent:@"nsarray.arc"];
//    NSArray *array1=@[@"Kenshin",@"Kaoru",@"Rosa"];
//    if(![NSKeyedArchiver archiveRootObject:array1 toFile:path2]){
//        NSLog(@"archiver failed!");
//    }
//    //NSArray解档
//    NSArray *array2=[NSKeyedUnarchiver unarchiveObjectWithFile:path2];
//    [array2 enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
//        NSLog(@"array2[%lu]=%@",idx,obj);
//    }];
//    /*结果：
//     array2[0]=Kenshin
//     array2[1]=Kaoru
//     array2[2]=Rosa
//     */
    
//    NSLog(@"%@",[GGCar propertyOfSelf]);
    GGCar *car = [[GGCar alloc] init];
    car.name = @"Cadillac";
    car.price = @1234566;
    
    NSString *file = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    file = [file stringByAppendingPathComponent:@"myLittleCar"];
    // 将student对象归档到file中
    [NSKeyedArchiver archiveRootObject:car toFile:file];
    // 从file存档中解析对象到student中
    GGCar *myCar = [NSKeyedUnarchiver unarchiveObjectWithFile:file];
    NSLog(@"%@\n  %@",file,myCar.description);
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
