//
//  ViewController.m
//  PracticeLibPD
//
//  Created by Woong Hee Lee on 3/6/19.
//  Copyright © 2019 Woong Hee Lee. All rights reserved!!
//

#import "ViewController.h"

@interface ViewController ()


@property (weak, nonatomic) IBOutlet UISwitch *onOff;

@end

@implementation ViewController
- (IBAction)onSwitchChange:(id)sender {
    [self.patch onOff:[sender isOn]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.patch = [[PDPatch alloc]initWithFile:@"main.pd"];
}


@end
