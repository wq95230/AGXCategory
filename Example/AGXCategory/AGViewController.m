//
//  AGViewController.m
//  AGXCategory
//
//  Created by 952303557@qq.com on 05/29/2022.
//  Copyright (c) 2022 952303557@qq.com. All rights reserved.
//

#import "AGViewController.h"
#import "AGCategory.h"

@interface AGViewController ()

@end

@implementation AGViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSString *tiemstr = [NSDate agdateToString:[NSDate date] dateFormatter:@"yyyy-MM-dd"];
    
    NSLog(@"time = %@",tiemstr);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
