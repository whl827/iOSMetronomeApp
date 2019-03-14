//
//  AppDelegate.h
//  libPDMetronomeObjC
//
//  Created by Woong Hee Lee on 3/6/19.
//  Copyright © 2019 Woong Hee Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PdAudioController.h"



@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) PdAudioController *pd;


@end

