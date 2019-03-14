//
//  PDPatch.h
//  PracticeLibPD
//
//  Created by Woong Hee Lee on 3/6/19.
//  Copyright © 2019 Woong Hee Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PdDispatcher.h"
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PDPatch : NSObject

-(void)onOff:(BOOL)yesNo;
-(instancetype) initWithFile:(NSString *)pdFile;

@end

NS_ASSUME_NONNULL_END
