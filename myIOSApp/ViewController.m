//
//  ViewController.m
//  myIOSApp
//
//  Created by 吕义丰 on 2022/5/27.
//

#import "ViewController.h"
#import "PracticeTask1.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    PracticeTask1 *pt1 = [[PracticeTask1 alloc] init];
    [pt1 convertAndSaveData];
}


@end
